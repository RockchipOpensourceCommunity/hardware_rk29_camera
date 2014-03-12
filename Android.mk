#
# RockChip Camera HAL 
#
LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

$(warning $(TARGET_BOARD_HARDWARE))
$(warning $(TARGET_BOARD_PLATFORM))

LOCAL_SRC_FILES:=\
	CameraHal_Module.cpp\
	CameraHal.cpp\
	CameraHal_Utils.cpp\
	MessageQueue.cpp\
	CameraHal_Mem.cpp\
  
ifeq ($(strip $(TARGET_BOARD_HARDWARE)),rkpx2board)
LOCAL_C_INCLUDES += \
	frameworks/base/include/ui \
  external/jpeg \
  external/jhead\
  hardware/rk29/hwcomposer_rga\
	hardware/rk29/libgralloc_ump/ump/include\
	hardware/rk29/libon2

LOCAL_SHARED_LIBRARIES:= \
    libui \
    libbinder \
    libutils \
    libcutils \
    libcamera_client \
    libgui\
    libjpeg\
    libjpeghwenc\
    libion\
    libvpu\
    libdl

endif

LOCAL_CFLAGS := -fno-short-enums -DCOPY_IMAGE_BUFFER
ifeq ($(strip $(TARGET_BOARD_HARDWARE)),rkpx2board)
LOCAL_CFLAGS += -DTARGET_RKPS2
endif

ifeq ($(strip $(TARGET_BOARD_PLATFORM)),rkpx2)
LOCAL_CFLAGS += -DTARGET_BOARD_PLATFORM_RKPX2
endif

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE:=camera.$(TARGET_BOARD_HARDWARE)

LOCAL_MODULE_TAGS:= optional
include $(BUILD_SHARED_LIBRARY)
