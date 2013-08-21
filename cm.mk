# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := N2

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/cellon/c8690/full_c8690.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := c8690
PRODUCT_NAME := cm_c8690
PRODUCT_BRAND := Newman
PRODUCT_MODEL := NewmanN2
PRODUCT_MANUFACTURER := cellon

# Set build fingerprint / ID / Product Name ect.
# PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=m0xx TARGET_DEVICE=m0 BUILD_FINGERPRINT="samsung/m0xx/m0:4.1.1/JRO03C/I9300XXDLIB:user/release-keys" PRIVATE_BUILD_DESC="m0xx-user 4.1.1 JRO03C I9300XXDLIB release-keys"
