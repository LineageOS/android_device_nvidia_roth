#
# Copyright (C) 2015 The CyanogenMod Project
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

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk

-include device/nvidia/shield-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH := device/nvidia/roth/include

# Architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a15

# Assert
TARGET_OTA_ASSERT_DEVICE := roth

# Board
TARGET_BOARD_PLATFORM := tegra
TARGET_BOOTLOADER_BOARD_NAME := roth
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_INFO_FILE := device/nvidia/roth/board-info.txt

# Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true

# Kernel
TARGET_KERNEL_SOURCE := kernel/nvidia/roth
TARGET_KERNEL_CONFIG := lineageos_roth_defconfig
BOARD_KERNEL_CMDLINE := androidboot.hardware=roth
LZMA_RAMDISK_TARGETS := recovery

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/nvidia/roth/comms
BCM_BLUETOOTH_MANTA_BUG := true

# Graphics
USE_OPENGL_RENDERER := true
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000
BOARD_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Partition
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE :=  8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE :=  8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 805306368
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13771997184
BOARD_FLASH_BLOCK_SIZE := 4096

# Recovery
TARGET_RECOVERY_FSTAB := device/nvidia/roth/initfiles/fstab.roth

# Sensors
TARGET_SENSOR_VARIANT := tegra

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_STA          := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_MODULE_ARG           := "iface_name=wlan0"
WIFI_DRIVER_MODULE_NAME          := "bcmdhd"

BOARD_HARDWARE_CLASS := device/nvidia/roth/cmhw/

BOARD_SEPOLICY_DIRS += device/nvidia/roth/sepolicy

# Vendor Init
TARGET_INIT_VENDOR_LIB := libinit_roth
TARGET_LIBINIT_DEFINES_FILE := device/nvidia/roth/init/init_roth.cpp

# TWRP Support
ifeq ($(WITH_TWRP),true)
-include device/nvidia/roth/twrp/twrp.mk
endif
