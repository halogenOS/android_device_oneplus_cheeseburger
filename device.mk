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

$(call inherit-product-if-exists, vendor/oneplus/cheeseburger/cheeseburger-vendor.mk)

PLATFORM_PATH := device/oneplus/cheeseburger

PRODUCT_COPY_FILES += $(PLATFORM_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml \
                      $(PLATFORM_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
                      $(PLATFORM_PATH)/media/media_codecs_performance.xml:system/etc/media_codecs_performance.xml

# Override heap growth limit due to high display density on device
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapgrowthlimit=256m

DEVICE_PACKAGE_OVERLAYS := $(PLATFORM_PATH)/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

$(call inherit-product, frameworks/native/build/phone-xxxhdpi-4096-dalvik-heap.mk)

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

# Permissions
PRODUCT_COPY_FILES += \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:system/etc/permissions/com.dsi.ant.antradio_library.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:system/etc/permissions/android.hardware.hdmi.cec.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.vr.high_performance.xml:system/etc/permissions/android.hardware.vr.high_performance.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:system/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:system/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml

#ANT+ stack
PRODUCT_PACKAGES += \
    AntHalService \
    libantradio \
    antradio_app \
    libvolumelistener

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/configs/msm_irqbalance.conf:system/vendor/etc/msm_irqbalance.conf

# rootdir and wifi
# find rootdir/ -type f | sed -e 's/rootdir\///g' | xargs -i echo '        $(PLATFORM_PATH)/rootdir/{}:root/{} \'
# find wifi/ -type f | sed -e 's/wifi\///g' | xargs -i echo '        $(PLATFORM_PATH)/wifi/{}:$(TARGET_OUT_ETC)/wifi/{} \'
PRODUCT_COPY_FILES += \
        $(PLATFORM_PATH)/rootdir/init.qcom.fm.sh:root/init.qcom.fm.sh \
        $(PLATFORM_PATH)/rootdir/hsic.control.bt.sh:root/hsic.control.bt.sh \
        $(PLATFORM_PATH)/rootdir/init.qcom.efs.sync.sh:root/init.qcom.efs.sync.sh \
        $(PLATFORM_PATH)/rootdir/init.qcom.uicc.sh:root/init.qcom.uicc.sh \
        $(PLATFORM_PATH)/rootdir/init.qcom.usb.sh:root/init.qcom.usb.sh \
        $(PLATFORM_PATH)/rootdir/init.qti.qseecomd.sh:root/init.qti.qseecomd.sh \
        $(PLATFORM_PATH)/rootdir/fstab.qcom:root/fstab.qcom \
        $(PLATFORM_PATH)/rootdir/bin/init.qti.qseecomd.sh:root/bin/init.qti.qseecomd.sh \
        $(PLATFORM_PATH)/rootdir/bin/init.qcom.modem_links.sh:root/bin/init.qcom.modem_links.sh \
        $(PLATFORM_PATH)/rootdir/init.qcom.coex.sh:root/init.qcom.coex.sh \
        $(PLATFORM_PATH)/rootdir/vold.fstab:root/vold.fstab \
        $(PLATFORM_PATH)/rootdir/init.qti.dcc.sh:root/init.qti.dcc.sh \
        $(PLATFORM_PATH)/rootdir/init.qcom.usb.configfs.rc:root/init.qcom.usb.configfs.rc \
        $(PLATFORM_PATH)/rootdir/usf_settings.sh:root/usf_settings.sh \
        $(PLATFORM_PATH)/rootdir/init.oem.rc:root/init.oem.rc \
        $(PLATFORM_PATH)/rootdir/init.target.rc:root/init.target.rc \
        $(PLATFORM_PATH)/rootdir/init.qcom.wifi.sh:root/init.qcom.wifi.sh \
        $(PLATFORM_PATH)/rootdir/init.msm.usb.configfs.rc:root/init.msm.usb.configfs.rc \
        $(PLATFORM_PATH)/rootdir/init.qcom.ssr.sh:root/init.qcom.ssr.sh \
        $(PLATFORM_PATH)/rootdir/init.crda.sh:root/init.crda.sh \
        $(PLATFORM_PATH)/rootdir/init.qcom.usb.rc:root/init.qcom.usb.rc \
        $(PLATFORM_PATH)/rootdir/init.qcom.modem_links.sh:root/init.qcom.modem_links.sh \
        $(PLATFORM_PATH)/rootdir/usf_post_boot.sh:root/usf_post_boot.sh \
        $(PLATFORM_PATH)/rootdir/init.qcom.sdio.sh:root/init.qcom.sdio.sh \
        $(PLATFORM_PATH)/rootdir/hcidump.sh:root/hcidump.sh \
        $(PLATFORM_PATH)/rootdir/init.qcom.power.rc:root/init.qcom.power.rc \
        $(PLATFORM_PATH)/rootdir/init.qti.ims.sh:root/init.qti.ims.sh \
        $(PLATFORM_PATH)/rootdir/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
        $(PLATFORM_PATH)/rootdir/init.usb.configfs.rc:root/init.usb.configfs.rc \
        $(PLATFORM_PATH)/rootdir/init.class_main.sh:root/init.class_main.sh \
        $(PLATFORM_PATH)/rootdir/init.qcom.post_boot.sh:root/init.qcom.post_boot.sh \
        $(PLATFORM_PATH)/rootdir/init.qcom.early_boot.sh:root/init.qcom.early_boot.sh \
        $(PLATFORM_PATH)/rootdir/init.mdm.sh:root/init.mdm.sh \
        $(PLATFORM_PATH)/rootdir/init.qcom.bt.sh:root/init.qcom.bt.sh \
        $(PLATFORM_PATH)/rootdir/init.qcom.factory.rc:root/init.qcom.factory.rc \
        $(PLATFORM_PATH)/rootdir/init.qcom.sensors.sh:root/init.qcom.sensors.sh \
        $(PLATFORM_PATH)/rootdir/init.qcom.sh:root/init.qcom.sh \
        $(PLATFORM_PATH)/rootdir/init.qcom.audio.sh:root/init.qcom.audio.sh \
        $(PLATFORM_PATH)/rootdir/qca6234-service.sh:root/qca6234-service.sh \
        $(PLATFORM_PATH)/rootdir/init.ath3k.bt.sh:root/init.ath3k.bt.sh \
        $(PLATFORM_PATH)/rootdir/ueventd.qcom.rc:root/ueventd.qcom.rc \
        $(PLATFORM_PATH)/rootdir/init.qcom.rc:root/init.qcom.rc \
        $(PLATFORM_PATH)/rootdir/verity_key:root/verity_key \
        $(PLATFORM_PATH)/wifi/hostapd.accept:$(TARGET_OUT_ETC)/wifi/hostapd.accept \
        $(PLATFORM_PATH)/wifi/hostapd.conf:$(TARGET_OUT_ETC)/wifi/hostapd.conf \
        $(PLATFORM_PATH)/wifi/WCNSS_qcom_cfg.ini:$(TARGET_OUT_ETC)/wifi/WCNSS_qcom_cfg.ini \
        $(PLATFORM_PATH)/wifi/hostapd.deny:$(TARGET_OUT_ETC)/wifi/hostapd.deny \
        $(PLATFORM_PATH)/wifi/wpa_supplicant_overlay.conf:$(TARGET_OUT_ETC)/wifi/wpa_supplicant_overlay.conf \
        $(PLATFORM_PATH)/wifi/wpa_supplicant_wcn.conf:$(TARGET_OUT_ETC)/wifi/wpa_supplicant_wcn.conf \
        $(PLATFORM_PATH)/wifi/wifi_concurrency_cfg.txt:$(TARGET_OUT_ETC)/wifi/wifi_concurrency_cfg.txt \
        $(PLATFORM_PATH)/wifi/p2p_supplicant_overlay.conf:$(TARGET_OUT_ETC)/wifi/p2p_supplicant_overlay.conf

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/fpc1020.kl:system/usr/keylayout/fpc1020.kl \
    $(LOCAL_PATH)/keylayout/synaptics_rmi4_i2c.kl:system/usr/keylayout/synaptics_rmi4_i2c.kl

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

# Init
PRODUCT_PACKAGES += \
    libinit_cheeseburger \

# Audio
PRODUCT_PACKAGES += \
    audiod \
    audio.a2dp.default \
    audio.primary.msm8998 \
    audio.r_submix.default \
    audio.usb.default \
    audio_policy.msm8998 \
    libaudio-resampler \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    tinymix

PRODUCT_PACKAGES += \
	$(LOCAL_PATH)/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
	$(LOCAL_PATH)/audio/audio_output_policy.conf:system/vendor/etc/audio_output_policy.conf \
	$(LOCAL_PATH)/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml \
	$(LOCAL_PATH)/audio/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml \
	$(LOCAL_PATH)/audio/listen_platform_info.xml:system/etc/listen_platform_info.xml \
	$(LOCAL_PATH)/audio/mixer_paths_dtp.xml:system/etc/mixer_paths_dtp.xml \
	$(LOCAL_PATH)/audio/mixer_paths_i2s.xml:system/etc/mixer_paths_i2s.xml \
	$(LOCAL_PATH)/audio/mixer_paths_qvr.xml:system/etc/mixer_paths_qvr.xml \
	$(LOCAL_PATH)/audio/mixer_paths_skuk.xml:system/etc/mixer_paths_skuk.xml \
	$(LOCAL_PATH)/audio/mixer_paths_tasha.xml:system/etc/mixer_paths_tasha.xml \
	$(LOCAL_PATH)/audio/mixer_paths_tavil.xml:system/etc/mixer_paths_tavil.xml \
	$(LOCAL_PATH)/audio/sound_trigger_mixer_paths_wcd9330.xml:system/etc/sound_trigger_mixer_paths_wcd9330.xml \
	$(LOCAL_PATH)/audio/sound_trigger_mixer_paths_wcd9340.xml:system/etc/sound_trigger_mixer_paths_wcd9340.xml \
	$(LOCAL_PATH)/audio/sound_trigger_mixer_paths.xml:system/etc/sound_trigger_mixer_paths.xml \
	$(LOCAL_PATH)/audio/sound_trigger_platform_info.xml:system/etc/sound_trigger_platform_info.xml
	$(TOPDIR)frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:/system/etc/a2dp_audio_policy_configuration.xml \
	$(TOPDIR)frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:/system/etc/audio_policy_volumes.xml \
	$(TOPDIR)frameworks/av/services/audiopolicy/config/default_volume_tables.xml:/system/etc/default_volume_tables.xml \
	$(TOPDIR)frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:/system/etc/r_submix_audio_policy_configuration.xml \
	$(TOPDIR)frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:/system/etc/usb_audio_policy_configuration.xml

# Buttons & Gestures
PRODUCT_BUTTON_GESTURES_PACKAGES := \
    oppo-keyhandler \
    ConfigPanel

PRODUCT_PACKAGES += $(PRODUCT_BUTTON_GESTURES_PACKAGES)

# Camera
PRODUCT_PACKAGES += \
    camera.msm8998 \
    mm-qcamera-app \
    libmm-qcamera \
    sensors.hal.tof

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# HALs
PRODUCT_PACKAGES += \
    copybit.msm8998 \
    gralloc.msm8998 \
    gps.msm8998 \
    hwcomposer.msm8998 \
    lights.msm8998 \
    memtrack.msm8998 \
    power.msm8998 \
    vr.msm8998

$(call inherit-product, device/oppo/common/common.mk)
