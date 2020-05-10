#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, device/zte/pine/device.mk)
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_BRAND := ZTE
PRODUCT_DEVICE := pine
PRODUCT_MANUFACTURER := ZTE
PRODUCT_MODEL := ZTE A2020U Pro
PRODUCT_NAME := lineage_pine

# Build info
BUILD_FINGERPRINT := "ZTE/P855A03_NA/P855A03_NA:9/PKQ1.190519.001/20191126.101456:user/release-keys"
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=P855A03_NA \
    PRODUCT_NAME=P855A03_NA \
    PRIVATE_BUILD_DESC="msmnile-user 9 PKQ1.190519.001 235 release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-zte
