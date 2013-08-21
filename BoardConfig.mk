# scorpio92(4PDA), config for Cellon c8690, Newman N2, Freelander i20
#2013
-include vendor/cellon/c8690/BoardConfigVendor.mk
-include device/cellon/c8690/smdk4412-common/BoardCommonConfig.mk

TARGET_OTA_ASSERT_DEVICE := c8690,NewmanN2
DISABLE_DEXPREOPT := true



TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp





TARGET_SPECIFIC_HEADER_PATH := device/cellon/c8690/overlay/include

# Kernel
BOARD_KERNEL_CMDLINE := ""
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE := 6291456
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 6291456
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 515899392
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1198522368


#Audio
BOARD_USES_GENERIC_AUDIO := true


# Enable JIT
WITH_JIT := true

# TVOut & HDMI
BOARD_USE_SECTVOUT := false
BOARD_USES_SKTEXTBOX := false

BOARD_USE_SYSFS_VSYNC_NOTIFICATION := true

# Camera
USE_CAMERA_STUB := true
BOARD_USES_LEGACY_CAMERA := true
# OMX
BOARD_USE_SAMSUNG_COLORFORMAT := true
BOARD_USES_PROPRIETARY_LIBFIMC := true

# RIL
#BOARD_MOBILEDATA_INTERFACE_NAME := "rmnet0" 

# # Wifi
# Wifi
BOARD_WLAN_DEVICE                := bcmdhd
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_MODULE_PATH          := 
BOARD_HAVE_SAMSUNG_WIFI          := false

BOARD_WLAN_DEVICE_REV            := bcm4330
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          :="/system/etc/wifi/fw_bcmdhd_p2p.bin"
WIFI_DRIVER_FW_PATH_AP           :="/system/etc/wifi/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P          :="/system/etc/wifi/fw_bcmdhd_p2p.bin"
WIFI_DRIVER_MODULE_NAME          := "bcmdhd"
WIFI_DRIVER_MODULE_ARG           :="firmware_path=/system/etc/wifi/fw_bcmdhd.bin nvram_path=/system/etc/wifi/bcmdhd.cal"
WIFI_DRIVER_MODULE_AP_ARG        :="firmware_path=/system/etc/wifi/fw_bcmdhd_apsta.bin nvram_path=/system/etc/wifi/bcmdhd.cal"
WIFI_BAND                        := 802_11_ABG
HAVE_HOSTAPD                     := true


# Bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/cellon/c8690/bluetooth/vnd_smdk4x12.txt
WITH_A2DP := true
BOARD_CUSTOM_BRCM_PATCHRAM_PLUS := ../../../vendor/cellon/c8690/proprietary/system/bin/brcm_patchram_plus.c
BOARD_BLUETOOTH_BCM4329 := false
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/cellon/c8690/bluetooth


#GPS
#BOARD_USES_GPSSHIM := true
#BOARD_GPS_NEEDS_XTRA := true
#BOARD_GPS_LIBRARIES := libloc

#Sensors
BOARD_VENDOR_USE_AKMD := true
BOARD_VENDOR_USE_AKMD := akm8963

#Touchscreen
BOARD_USE_LEGACY_TOUCHSCREEN := true

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/s3c-usbgadget/gadget/lun%d/file"
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

# Kernel
TARGET_OTA_ASSERT_DEVICE := c8690,NewmanN2
# Kernel
#TARGET_KERNEL_SOURCE := kernel/samsung/smdk4412
#TARGET_KERNEL_CONFIG := cyanogenmod_c8690_defconfig

TARGET_PREBUILT_KERNEL := device/cellon/c8690/kernel.img
#TARGET_PREBUILT_KERNEL := device/cellon/c8690/recovery-kernel.img

BOARD_CUSTOM_BOOTIMG_MK := device/cellon/c8690/shbootimg_cm10.mk

BOARD_MKBOOTIMG_ARGS := 

# Recovery
TARGET_NO_RECOVERY := false
RECOVERY_NAME := CWM-based Recovery by kaasnake
TARGET_RECOVERY_INITRC := device/cellon/c8690/recovery.rc
TARGET_PROVIDES_INIT := true
TARGET_PROVIDES_INIT_TARGET_RC := true
BOARD_CUSTOM_GRAPHICS := ../../../device/cellon/c8690/recovery/graphics.c
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
BOARD_UMS_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun/file"
BOARD_USES_MMCUTILS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true


####
# TEST values
BOARD_USES_PROPRIETARY_LIBCAMERA := true
BOARD_USES_HDMI := false
BOARD_USES_HDMI_SUBTITLES := false

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mass_storage

# turninig on custom egl.cfg
BOARD_EGL_CFG := device/cellon/c8690/configs/egl.cfg