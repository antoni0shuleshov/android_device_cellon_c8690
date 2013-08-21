#
# Copyright (C) 2012 The CyanogenMod Project
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
#

LOCAL_PATH := device/cellon/c8690

$(call inherit-product-if-exists, vendor/cellon/c8690/c8690-vendor.mk)

# debug log files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/root/kmsg.sh:/root/kmsg.sh \
    $(LOCAL_PATH)/root/logcat.sh:/root/logcat.sh
   
# Include common makefile
$(call inherit-product, $(LOCAL_PATH)/smdk4412-common/common.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Init files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/root/init.smdk4x12.rc:root/init.smdk4x12.rc \
    $(LOCAL_PATH)/root/ueventd.smdk4x12.rc:root/ueventd.smdk4x12.rc \
    $(LOCAL_PATH)/root/ueventd.smdk4x12.rc:recovery/root/ueventd.smdk4x12.rc\
    $(LOCAL_PATH)/root/init.smdk4x12.usb.rc:root/init.smdk4x12.usb.rc \

# Gps
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gpsconfig.xml:system/etc/gpsconfig.xml


# Vold and Storage
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/vold.fstab:system/etc/vold.fstab
    
# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=Smdk4210RIL \
    mobiledata.interfaces=pdp0,wlan0,gprs,ppp0 \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Packages

# PRODUCT_PACKAGES := \
#    com.android.future.usb.accessory \
#    libnetcmdiface \
#    Stk    
    
    

