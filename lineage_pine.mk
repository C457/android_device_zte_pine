#
# Copyright 2017 The Android Open Source Project
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

# Release name
PRODUCT_RELEASE_NAME := pine

$(call inherit-product, build/target/product/embedded.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/lineage/config/common.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/zte/pine/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := pine
PRODUCT_NAME := lineage_pine
PRODUCT_BRAND := ZTE
PRODUCT_MODEL := ZTE A2020G Pro
PRODUCT_MANUFACTURER := ZTE

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=GEN_EU_EEA_P855A01 \
    BUILD_PRODUCT=P855A01 \
    TARGET_DEVICE=P855A01

PRODUCT_SYSTEM_PROPERTY_BLACKLIST += \
    ro.bootimage.build.date.utc \
    ro.build.date.utc

PRODUCT_PROPERTY_OVERRIDES += \
	ro.vendor.build.security_patch=2018-08-05
