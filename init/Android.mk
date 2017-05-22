LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),oneplus5)

include $(CLEAR_VARS)

LOCAL_MODULE := libinit_oneplus5
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := init_oneplus5.cpp
LOCAL_C_INCLUDES := system/core/init
LOCAL_CFLAGS := -O3 -Wall

include $(BUILD_STATIC_LIBRARY)

endif