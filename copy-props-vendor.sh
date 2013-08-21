#!/bin/sh

# set -x

# SOURCE_DIST is the path to unzipped stock recovery update package of jellybean 
SOURCE_DIST=~/dev/android/n2/update

VENDOR=cellon
DEVICE=c8690

VENDOR_DIR=../../../vendor/$VENDOR/$DEVICE

PROPRIETARY_DIR=$VENDOR_DIR/proprietary

if [ -d $PROPRIETARY_DIR/$DIR ] ; then
  rm -rf $PROPRIETARY_DIR/$DIR
fi
mkdir -p $PROPRIETARY_DIR



echo "Pulling proprietary files..."
for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^$`; do

    FILE_SOURCE=$(echo $FILE | cut -d":" -f1)    
    FILE_TARGET=$(echo $FILE | cut -d":" -f2-)
    
    DIR=`dirname $FILE_TARGET`
    
    if [ ! -d $PROPRIETARY_DIR/$DIR ]; then
        mkdir -p $PROPRIETARY_DIR/$DIR
    fi
    cp -fr $SOURCE_DIST/$FILE_SOURCE $PROPRIETARY_DIR/$FILE_TARGET
done
#exit 0

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g | sed s/__VENDOR__/$VENDOR/g > $VENDOR_DIR/$DEVICE-vendor-blobs.mk
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := vendor/__VENDOR__/__DEVICE__

PRODUCT_COPY_FILES += \\
EOF

LINEEND=" \\"
COUNT=`cat proprietary-files.txt | grep -v ^# | grep -v ^$ | wc -l | awk {'print $1'}`
for FILE_S in `cat proprietary-files.txt | grep -v ^# | grep -v ^$`; do
    FILE=$(echo $FILE_S | cut -d":" -f2-)
    COUNT=`expr $COUNT - 1`
    if [ $COUNT = "0" ]; then
        LINEEND=""
    fi
    echo "    \$(LOCAL_PATH)/proprietary/$FILE:$FILE$LINEEND" >> $VENDOR_DIR/$DEVICE-vendor-blobs.mk
done

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g | sed s/__VENDOR__/$VENDOR/g > $VENDOR_DIR/$DEVICE-vendor.mk
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Pick up overlay for features that depend on non-open-source files
DEVICE_PACKAGE_OVERLAYS += vendor/__VENDOR__/__DEVICE__/overlay

\$(call inherit-product, vendor/__VENDOR__/__DEVICE__/__DEVICE__-vendor-blobs.mk)
EOF

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g | sed s/__VENDOR__/$VENDOR/g > $VENDOR_DIR/BoardConfigVendor.mk
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

EOF

