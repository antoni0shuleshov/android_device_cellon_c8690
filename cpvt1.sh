#!/bin/sh

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

# This file is generated by device/common/generate-blob-scripts.sh - DO NOT EDIT
# set -x

# SOURCE_DIST is the path to unzipped stock recovery update package of jellybean 

FILE="system/bin/file"
FILE_TARGET=$(echo $FILE | cut -d":" -f1)
FILE_SOURCE=$(echo $FILE | cut -d":" -f2-)
echo $FILE
echo $FILE_TARGET
echo $FILE_SOURCE
