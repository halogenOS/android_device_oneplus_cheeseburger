#
# Copyright (C) 2017 The LineageOS Open Source Project
# Copyright (C) 2019 The halogenOS Project
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

# https://github.com/halogenOS/android_build_make/commit/7287944a6f75552089ba244048035fa514a8bbc0
# https://github.com/halogenOS/android_build_make/commit/0c4bb28797d4fc7af1187f30c60f3a5f7033a89c
# https://github.com/halogenOS/android_build_make/commit/49385c4ccc622bec569a872dec0775ae6e30ccd6
CUSTOM_VENDOR_DIR := vendor/aosip

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from cheeseburger device
$(call inherit-product, device/oneplus/cheeseburger/device.mk)

# Inherit some common AOSiP stuff.
$(call inherit-product, $(CUSTOM_VENDOR_DIR)/config/common_full_phone.mk)

PRODUCT_NAME := aosip_cheeseburger
PRODUCT_DEVICE := cheeseburger
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := ONEPLUS A5000

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

TARGET_VENDOR_PRODUCT_NAME := OnePlus5
TARGET_VENDOR_DEVICE_NAME := OnePlus5

PRODUCT_BUILD_PROP_OVERRIDES += TARGET_DEVICE=OnePlus5 PRODUCT_NAME=OnePlus5

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="OnePlus5-user 9 PKQ1.180716.001 1905271736 release-keys"

BUILD_FINGERPRINT := OnePlus/OnePlus5/OnePlus5:9/PKQ1.180716.001/1905271736:user/release-keys

TARGET_VENDOR := oneplus
