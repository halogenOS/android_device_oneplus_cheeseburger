#BOARD_USES_GENERIC_AUDIO := true
#
#AUDIO_FEATURE_FLAGS
BOARD_USES_ALSA_AUDIO := true

ifneq ($(TARGET_USES_AOSP), true)
USE_CUSTOM_AUDIO_POLICY := 1
BOARD_SUPPORTS_SOUND_TRIGGER := false
AUDIO_FEATURE_ENABLED_COMPRESS_CAPTURE := false
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_EXTN_FLAC_DECODER := true
AUDIO_FEATURE_ENABLED_EXTN_RESAMPLER := false
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
AUDIO_FEATURE_ENABLED_HDMI_SPK := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD_24 := true
AUDIO_FEATURE_ENABLED_FLAC_OFFLOAD := true
AUDIO_FEATURE_ENABLED_VORBIS_OFFLOAD := true
AUDIO_FEATURE_ENABLED_WMA_OFFLOAD := true
AUDIO_FEATURE_ENABLED_ALAC_OFFLOAD := true
AUDIO_FEATURE_ENABLED_APE_OFFLOAD := true
AUDIO_FEATURE_ENABLED_AAC_ADTS_OFFLOAD := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_SSR := false
AUDIO_FEATURE_ENABLED_DTS_EAGLE := false
BOARD_USES_SRS_TRUEMEDIA := false
DTS_CODEC_M_ := false
MM_AUDIO_ENABLED_SAFX := true
AUDIO_FEATURE_ENABLED_HW_ACCELERATED_EFFECTS := false
AUDIO_FEATURE_ENABLED_AUDIOSPHERE := true
AUDIO_FEATURE_ENABLED_USB_TUNNEL_AUDIO := true
AUDIO_FEATURE_ENABLED_SPLIT_A2DP := true
AUDIO_FEATURE_ENABLED_3D_AUDIO := true
endif

USE_XML_AUDIO_POLICY_CONF := 1
#BOARD_SUPPORTS_SOUND_TRIGGER_HAL := true
AUDIO_USE_LL_AS_PRIMARY_OUTPUT := true
AUDIO_FEATURE_ENABLED_VBAT_MONITOR := true
AUDIO_FEATURE_ENABLED_ANC_HEADSET := true
AUDIO_FEATURE_ENABLED_CUSTOMSTEREO := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_HDMI_EDID := true
AUDIO_FEATURE_ENABLED_HDMI_PASSTHROUGH := true
#AUDIO_FEATURE_ENABLED_KEEP_ALIVE := true
AUDIO_FEATURE_ENABLED_DISPLAY_PORT := true
AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := true
AUDIO_FEATURE_ENABLED_HFP := true
AUDIO_FEATURE_ENABLED_INCALL_MUSIC := false
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_ENABLED_SPKR_PROTECTION := true
AUDIO_FEATURE_ENABLED_ACDB_LICENSE := true
AUDIO_FEATURE_ENABLED_DEV_ARBI := false
MM_AUDIO_ENABLED_FTM := true
TARGET_USES_QCOM_MM_AUDIO := true
AUDIO_FEATURE_ENABLED_SOURCE_TRACKING := true
AUDIO_FEATURE_ENABLED_GEF_SUPPORT := true
BOARD_SUPPORTS_QAHW := true
AUDIO_FEATURE_ENABLED_RAS := true
##AUDIO_FEATURE_FLAGS

#Audio Specific device overlays
DEVICE_PACKAGE_OVERLAYS += device/oneplus/cheeseburger/audio/configs/common/overlay

PRODUCT_COPY_FILES += \
    device/oneplus/cheeseburger/audio/configs/msm8998/audio_output_policy.conf:system/vendor/etc/audio_output_policy.conf \
    device/oneplus/cheeseburger/audio/configs/msm8998/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    device/oneplus/cheeseburger/audio/configs/msm8998/audio_policy.conf:system/etc/audio_policy.conf \
    device/oneplus/cheeseburger/audio/configs/msm8998/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/oneplus/cheeseburger/audio/configs/msm8998/mixer_paths_tasha.xml:system/etc/mixer_paths_tasha.xml \
    device/oneplus/cheeseburger/audio/configs/msm8998/mixer_paths_qvr.xml:system/etc/mixer_paths_qvr.xml \
    device/oneplus/cheeseburger/audio/configs/msm8998/mixer_paths_tavil.xml:system/etc/mixer_paths_tavil.xml \
    device/oneplus/cheeseburger/audio/configs/msm8998/mixer_paths_skuk.xml:system/etc/mixer_paths_skuk.xml \
    device/oneplus/cheeseburger/audio/configs/msm8998/mixer_paths_dtp.xml:system/etc/mixer_paths_dtp.xml \
    device/oneplus/cheeseburger/audio/configs/msm8998/mixer_paths_i2s.xml:system/etc/mixer_paths_i2s.xml \
    device/oneplus/cheeseburger/audio/configs/msm8998/aanc_tuning_mixer.txt:system/etc/aanc_tuning_mixer.txt \
    device/oneplus/cheeseburger/audio/configs/msm8998/aanc_tuning_mixer_tavil.txt:system/etc/aanc_tuning_mixer_tavil.txt \
    device/oneplus/cheeseburger/audio/configs/msm8998/audio_platform_info_i2s.xml:system/etc/audio_platform_info_i2s.xml \
    device/oneplus/cheeseburger/audio/configs/msm8998/sound_trigger_mixer_paths.xml:system/etc/sound_trigger_mixer_paths.xml \
    device/oneplus/cheeseburger/audio/configs/msm8998/sound_trigger_mixer_paths_wcd9330.xml:system/etc/sound_trigger_mixer_paths_wcd9330.xml \
    device/oneplus/cheeseburger/audio/configs/msm8998/sound_trigger_mixer_paths_wcd9340.xml:system/etc/sound_trigger_mixer_paths_wcd9340.xml \
    device/oneplus/cheeseburger/audio/configs/msm8998/sound_trigger_platform_info.xml:system/etc/sound_trigger_platform_info.xml \
    device/oneplus/cheeseburger/audio/configs/msm8998/graphite_ipc_platform_info.xml:system/etc/graphite_ipc_platform_info.xml \
    device/oneplus/cheeseburger/audio/configs/msm8998/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    device/oneplus/cheeseburger/audio/configs/msm8998/audio_policy_volumes.xml:system/etc/audio_policy_volumes.xml \
    device/oneplus/cheeseburger/audio/configs/msm8998/default_volume_tables.xml:system/etc/default_volume_tables.xml

#XML Audio configuration files
ifeq ($(USE_XML_AUDIO_POLICY_CONF), 1)
ifeq ($(TARGET_USES_AOSP), true)
PRODUCT_COPY_FILES += \
    device/oneplus/cheeseburger/audio/configs/msm8998/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml
else
PRODUCT_COPY_FILES += \
    device/oneplus/cheeseburger/audio/configs/msm8998/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml
endif
PRODUCT_COPY_FILES += \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:/system/etc/a2dp_audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:/system/etc/r_submix_audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:/system/etc/usb_audio_policy_configuration.xml
endif

# Listen configuration file
PRODUCT_COPY_FILES += \
    device/oneplus/cheeseburger/audio/configs/msm8998/listen_platform_info.xml:system/etc/listen_platform_info.xml
