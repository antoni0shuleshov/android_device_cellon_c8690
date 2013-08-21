



#################  full_xxxxx.mk


# kaasnake disable copying propietary files
#$(call inherit-product-if-exists, vendor/cellon/c8690/newman.mk)

#Additional apps
#$(call inherit-product, $(LOCAL_PATH)/Additional.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, device/cellon/c8690/c8690.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# PRODUCT_TAGS += dalvik.gc.type-precise

# $(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

PRODUCT_NAME := full_c8690
PRODUCT_DEVICE := c8690
PRODUCT_BRAND := Newman
PRODUCT_MANUFACTURER := cellon
PRODUCT_MODEL := NewmanN2


