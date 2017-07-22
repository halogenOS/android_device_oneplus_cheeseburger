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

# Inherit from cheeseburger device
$(call inherit-product, device/oneplus/cheeseburger/device.mk)

# Inherit some common XOS stuff
$(call inherit-product, vendor/xos/config/common.mk)

PRODUCT_NAME := XOS_cheeseburger
PRODUCT_DEVICE := cheeseburger
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := ONEPLUS A5000

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

TARGET_VENDOR_PRODUCT_NAME := OnePlus5
TARGET_VENDOR_DEVICE_NAME := OnePlus5
PRODUCT_BUILD_PROP_OVERRIDES += TARGET_DEVICE=OnePlus5 PRODUCT_NAME=OnePlus5
#PRODUCT_PROPERTY_OVERRIDES += \
#    persist.ota.romname=$(PRODUCT_NAME) \
#    persist.ota.version=$(shell date +%Y%m%d) \
#    persist.ota.manifest=https://raw.githubusercontent.com/halogenOS/android_extras_ota/XOS-7.1/$(PRODUCT_NAME).xml


PRODUCT_BUILD_PROP_OVERRIDES += \
	BUILD_FINGERPRINT=OnePlus/OnePlus5/OnePlus5:7.1.1/NMF26X/06282233:user/release-keys \
	PRIVATE_BUILD_DESC="OnePlus5-user 7.1.1 NMF26X 19 release-keys"
PRODUCT_PROPERTY_OVERRIDES += \
	ro.build.oemfingerprint=7.1.1/NMF26X/06282233:user/release-keys \
	ro.build.ota.versionname=OnePlus5Oxygen_23_1707192021 \
	ro.build.version.ota=OnePlus5Oxygen_23.O.11_GLO_011_1707192021

TARGET_VENDOR := oneplus
