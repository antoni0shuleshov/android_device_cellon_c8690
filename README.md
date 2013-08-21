android_device_cellon_c8690
===========================
The set of configs for building Cyanogenmod 10 for cellon c8690 platform devices such as Newman N2, Freelander I20 and others.

Before building download and extract stock firmware for your device and setup that path to SOURCE_DIST in copy-props-vendor.sh

How to build.
```
1. Get cyanogenmod sources
2. Put files of this repo to device/cellon/c8690
3. > cd <root_of_cyanogenmod_sources>
4. > source build/envsetup.sh
6. > lunch 
# and select cm_c8690-eng
5. > mka
# you will got in $ANDROID_PRODUCT_OUT image-files for your device. 
You need system.img, userdata.img, ramdisk-uboot.img, recovery.img
```
Goog luck ))
