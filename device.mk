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

TARGET_REFERENCE_DEVICE ?= roth
TARGET_TEGRA_VARIANT    ?= common

$(call inherit-product, device/nvidia/t114-common/t114.mk)

PRODUCT_CHARACTERISTICS  := tv
PRODUCT_AAPT_CONFIG      := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi
TARGET_SCREEN_HEIGHT     := 720
TARGET_SCREEN_WIDTH      := 1280

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
