#
# Copyright (C) 2008 The Android Open Source Project
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

# This file is executed by build/envsetup.sh, and can use anything
# defined in envsetup.sh.
#
# In particular, you can add lunch options with the add_lunch_combo
# function: add_lunch_combo generic-eng

#add_lunch_combo full_c8690-eng
#add_lunch_combo cm_c8690-eng
chooseproduct cm_c8690
choosetype 2
choosevariant eng
printconfig
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "if u want change device please remove or edit device/cellon/c8690/vendorsetup.sh"
echo "!!!!!!!!!!!!!!!!!^^^!!!!!!!!!!!!!!!!!"
echo "!!!!!!!!!!!!!!-<(^v^)>-!!!!!!!!!!!!!!"
echo "!!!!!!!!!!!!!!!!!\~/!!!!!!!!!!!!!!!!!"
source device/cellon/c8690/kaatools/kaatools.sh