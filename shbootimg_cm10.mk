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

LOCAL_PATH := $(call my-dir)

$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES) $(MKIMAGE)
	$(call pretty,"-- Creating c8690 uboot ramdisk image: $@")
	$(MKIMAGE) -A ARM -O Linux -T ramdisk -C none -a 0x41000000 -e 0x41000000 -n ramdisk -d $(INSTALLED_RAMDISK_TARGET) $(PRODUCT_OUT)/ramdisk-uboot.img
	@echo -e ${CL_CYN}"-- ---> uboot ramdisk image: $(PRODUCT_OUT)/ramdisk-uboot.img"${CL_RST}

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) $(MKIMAGE) \
		$(recovery_ramdisk) \
		$(recovery_kernel)
	@echo -e ${CL_CYN}"-- Creating c8690 uboot recovery image ------"${CL_RST}
	@echo -e ${CL_CYN}"-- --- creating ramdisk image ------"${CL_RST}
	$(MKIMAGE) -A ARM -O Linux -T ramdisk -C none -a 0x41000000 -e 0x41000000 -n ramdisk -d $(recovery_ramdisk) $(PRODUCT_OUT)/ramdisk-recovery-uboot-tmp.img 
	@echo -e ${CL_CYN}"-- --- combaining ramdisk and kernel to uboot-style boot image ------"${CL_RST}
	$(MKBOOTIMG) \
	  --kernel $(recovery_kernel) \
	  --ramdisk $(PRODUCT_OUT)/ramdisk-recovery-uboot-tmp.img \
	  --cmdline $(strip 	$(BOARD_KERNEL_CMDLINE)) \
	  --base $(strip $(BOARD_KERNEL_BASE)) \
	  --ramdiskaddr 0x11000000 \
	  --pagesize $(strip $(BOARD_KERNEL_PAGESIZE))\
	  --output $@
	rm -f $(PRODUCT_OUT)/ramdisk-recovery-uboot-tmp.img
	@echo -e ${CL_CYN}"-- ---> uboot recovery image: $@"${CL_RST}
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)