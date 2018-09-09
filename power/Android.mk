LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := android.hardware.power@1.2-service.pine
LOCAL_INIT_RC := android.hardware.power@1.2-service.pine.rc
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true

LOCAL_SRC_FILES := \
    power-common.c \
    Power.cpp \
    power-msmnile.c \
    service.cpp \
    utils.c

LOCAL_SHARED_LIBRARIES := \
    android.hardware.power@1.2 \
    libbase  \
    libdl \
    libhidlbase \
    libhidltransport \
    liblog \
    libutils

LOCAL_HEADER_LIBRARIES += libhardware_headers

LOCAL_CFLAGS += -Werror -Wall -Wextra

include $(BUILD_EXECUTABLE)
