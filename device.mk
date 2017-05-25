#
# Copyright (C) 2017 The Linux Foundation
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

PLATFORM_PATH := device/oneplus/oneplus5

PRODUCT_COPY_FILES += $(PLATFORM_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml \
                      $(PLATFORM_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
                      $(PLATFORM_PATH)/media/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
                      $(PLATFORM_PATH)/whitelistedapps.xml:system/vendor/etc/whitelistedapps.xml

# Override heap growth limit due to high display density on device
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapgrowthlimit=256m

$(call inherit-product, frameworks/native/build/phone-xxxhdpi-4096-dalvik-heap.mk)
$(call inherit-product, device/qcom/common/common.mk)

#Android EGL implementation
PRODUCT_PACKAGES += libGLES_android

PRODUCT_BOOT_JARS += \
        tcmiface \
        telephony-ext

PRODUCT_PACKAGES += \
		telephony-ext \
		libqmiextservices

ifeq ($(strip $(BOARD_HAVE_QCOM_FM)),true)
PRODUCT_BOOT_JARS += qcom.fmradio
endif #BOARD_HAVE_QCOM_FM

# Sensor HAL conf file
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/sensors/hals.conf:system/etc/sensors/hals.conf

# WLAN driver configuration file
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    $(PLATFORM_PATH)/wifi/wifi_concurrency_cfg.txt:system/etc/wifi/wifi_concurrency_cfg.txt

# MIDI feature
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml

PRODUCT_PACKAGES += \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf

#ANT+ stack
PRODUCT_PACKAGES += \
    AntHalService \
    libantradio \
    antradio_app \
    libvolumelistener

# Sensor features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.sensor.ambient_temperature.xml:system/etc/permissions/android.hardware.sensor.ambient_temperature.xml \
    frameworks/native/data/etc/android.hardware.sensor.relative_humidity.xml:system/etc/permissions/android.hardware.sensor.relative_humidity.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:system/etc/permissions/android.hardware.sensor.hifi_sensors.xml

# High performance VR feature
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vr.high_performance.xml:system/etc/permissions/android.hardware.vr.high_performance.xml

# FBE support
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/rootdir/bin/init.qti.qseecomd.sh:system/bin/init.qti.qseecomd.sh

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += $(PLATFORM_PATH)/msm_irqbalance.conf:system/vendor/etc/msm_irqbalance.conf

# Powerhint configuration file
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/powerhint_soc_id_292.xml:system/etc/powerhint_soc_id_292.xml

#for android_filesystem_config.h
PRODUCT_PACKAGES += \
    fs_config_files

#A/B related packages
PRODUCT_PACKAGES += \
		    bootctrl.msm8998 \
		    brillo_update_payload

#FEATURE_OPENGLES_EXTENSION_PACK support string config file
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml
