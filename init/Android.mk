LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),cheeseburger)

include $(CLEAR_VARS)

LOCAL_MODULE := libinit_cheeseburger
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := init_cheeseburger.cpp
LOCAL_C_INCLUDES := system/core/init
LOCAL_CFLAGS := -O3 -Wall

include $(BUILD_STATIC_LIBRARY)

endif