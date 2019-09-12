#
# Copyright 2017 The Android Open Source Project
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

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a75

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a75

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msmnile
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Kernel

BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 swiotlb=2048 firmware_class.path=/vendor/firmware_mnt/image loop.max_part=7 androidboot.usbcontroller=a600000.dwc3 ramoops.mem_address=0xafd00000 ramoops.mem_size=0x200000 ramoops.console_size=0x100000 ramoops.ftrace_size=0x40000 ramoops.pmsg_size=0x40000
BOARD_KERNEL_CMDLINE += skip_override androidboot.fastboot=1
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
NEED_KERNEL_MODULE_SYSTEM := true
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CONFIG := vendor/pine_defconfig
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_KERNEL_SOURCE := kernel/zte/sm8150

DEVICE_PATH := device/zte/pine

# Platform
TARGET_BOARD_PLATFORM := msmnile
TARGET_BOARD_PLATFORM_GPU := qcom-adreno640
QCOM_BOARD_PLATFORMS += msmnile

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144

BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3758096384
BOARD_USERDATAIMAGE_PARTITION_SIZE := 118112366592
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

TARGET_NO_KERNEL := false
TARGET_NO_RECOVERY := false
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true

# TWRP specific build flags
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
AB_OTA_UPDATER := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_THEME := portrait_hdpi
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
TW_MAX_BRIGHTNESS := 1023
TW_USE_TOOLBOX := true
TW_NO_LEGACY_PROPS := true
TW_INCLUDE_REPACKTOOLS := true
LZMA_RAMDISK_TARGETS := recovery,boot
BOARD_USES_METADATA_PARTITION := true

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

# A/B updater updatable partitions list. Keep in sync with the partition list
# with "_a" and "_b" variants in the device. Note that the vendor can add more
# more partitions to this list for the bootloader and radio.
AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor \
    vbmeta \
    dtbo 

# Encryption
PLATFORM_SECURITY_PATCH := 2099-12-31
TW_INCLUDE_CRYPTO := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_INCLUDE_CRYPTO_FBE := true

# Extras
BOARD_SUPPRESS_SECURE_ERASE := true
TW_USE_LEDS_HAPTICS := true
TW_EXCLUDE_SUPERSU := true
TW_NO_HAPTICS := true
TARGET_RECOVERY_DEVICE_MODULES := android.hardware.boot@1.0
TW_HAS_EDL_MODE := true
TW_EXCLUDE_TWRPAPP := true
