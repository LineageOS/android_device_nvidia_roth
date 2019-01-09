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

# Bluetooth
BOARD_HAVE_BLUETOOTH     := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_CUSTOM_BT_CONFIG   := device/nvidia/roth/comms/vnd_roth.txt
BCM_BLUETOOTH_MANTA_BUG  := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/nvidia/roth/comms

# Kernel
TARGET_KERNEL_SOURCE    := kernel/nvidia/mainline
TARGET_KERNEL_CONFIG    := tegra_defconfig
BOARD_KERNEL_IMAGE_NAME := zImage
LZMA_RAMDISK_TARGETS    := recovery

# Recovery
TARGET_RECOVERY_FSTAB := device/nvidia/roth/initfiles/fstab.roth

# Vendor Init
TARGET_INIT_VENDOR_LIB := libinit_tegra libinit_shield libinit_roth

include device/nvidia/t114-common/BoardConfigCommon.mk
include device/nvidia/touch/BoardConfigTouch.mk
include device/nvidia/shield-common/BoardConfigShield.mk
