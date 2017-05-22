#
# Copyright (C) 2017 The halogenOS Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from oneplus5 device
$(call inherit-product, device/oneplus/oneplus5/device.mk)

# Inherit some common XOS stuff
$(call inherit-product, vendor/xos/config/common.mk)

PRODUCT_NAME := XOS_oneplus5
PRODUCT_DEVICE := oneplus5
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_BRAND := OnePlus

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

TARGET_VENDOR_PRODUCT_NAME := OnePlus5
TARGET_VENDOR_DEVICE_NAME := OnePlus5
PRODUCT_BUILD_PROP_OVERRIDES += TARGET_DEVICE=OnePlus5 PRODUCT_NAME=OnePlus5
#PRODUCT_PROPERTY_OVERRIDES += \
#    persist.ota.romname=$(PRODUCT_NAME) \
#    persist.ota.version=$(shell date +%Y%m%d) \
#    persist.ota.manifest=https://raw.githubusercontent.com/halogenOS/android_extras_ota/XOS-7.1/$(PRODUCT_NAME).xml

PRODUCT_SYSTEM_PROPERTY_BLACKLIST += ro.product.model

#PRODUCT_BUILD_PROP_OVERRIDES += \
#    BUILD_FINGERPRINT= \
#    PRIVATE_BUILD_DESC=""
#PRODUCT_PROPERTY_OVERRIDES += \
#    ro.build.oemfingerprint=

TARGET_VENDOR := oneplus
