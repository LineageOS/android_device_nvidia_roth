#
# Copyright (C) 2018 The LineageOS Project
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

BOARD_FLASH_BLOCK_SIZE             := 4096
BOARD_BOOTIMAGE_PARTITION_SIZE     := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_CACHEIMAGE_PARTITION_SIZE    := 805306368
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13771997184
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 805306368
TARGET_USERIMAGES_USE_EXT4         := true

# Assert
TARGET_OTA_ASSERT_DEVICE := roth

# Audio
BOARD_USES_TINYHAL_AUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH     := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_CUSTOM_BT_CONFIG   := device/nvidia/roth/comms/vnd_roth.txt
BCM_BLUETOOTH_MANTA_BUG  := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/nvidia/roth/comms

# Bootloader versions
TARGET_BOARD_INFO_FILE := device/nvidia/roth/board-info.txt

# Hardware overlays
BOARD_HARDWARE_CLASS := device/nvidia/roth/lineagehw/

# Kernel
ifneq ($(TARGET_PREBUILT_KERNEL),)
BOARD_VENDOR_KERNEL_MODULES += $(wildcard $(dir $(TARGET_PREBUILT_KERNEL))/*.ko)
else
TARGET_KERNEL_SOURCE            := kernel/nvidia/mainline
TARGET_KERNEL_CONFIG            := tegra_defconfig
TARGET_KERNEL_ADDITIONAL_CONFIG := tegra_android_variant_defconfig
BOARD_KERNEL_IMAGE_NAME         := zImage
endif
LZMA_RAMDISK_TARGETS            := recovery

# Manifest
DEVICE_MANIFEST_FILE := device/nvidia/roth/manifest.xml

# Recovery
TARGET_RECOVERY_FSTAB := device/nvidia/roth/initfiles/fstab.roth

# Sensors
TARGET_SENSOR_VARIANT := tegra

# TWRP Support
ifeq ($(WITH_TWRP),true)
include device/nvidia/roth/twrp/twrp.mk
endif

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

include device/nvidia/t114-common/BoardConfigCommon.mk
include device/nvidia/touch/BoardConfigTouch.mk
