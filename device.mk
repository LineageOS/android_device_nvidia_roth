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

$(call inherit-product, device/nvidia/t114-common/t114.mk)
$(call inherit-product, device/nvidia/touch/raydium.mk)
$(call inherit-product, device/nvidia/shield-common/shield.mk)

PRODUCT_CHARACTERISTICS  ?= tv
PRODUCT_AAPT_CONFIG      := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi
TARGET_SCREEN_HEIGHT     := 720
TARGET_SCREEN_WIDTH      := 1280

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

ifneq ("$(wildcard vendor/nvidia/shield/roth.mk)","")
$(call inherit-product, vendor/nvidia/shield/roth.mk)
else ifneq ("$(wildcard vendor/nvidia/roth/roth-vendor.mk)","")
$(call inherit-product, vendor/nvidia/roth/roth-vendor.mk)
else
$(error "No proprietary vendor found.")
endif

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    device/nvidia/roth/overlay

# Init related
PRODUCT_PACKAGES += \
    fstab.dalmore \
    fstab.molly \
    fstab.roth \
    init.dalmore.rc \
    init.molly.rc \
    init.roth.rc \
    init.roth_common.rc \
    init.recovery.dalmore.rc \
    init.recovery.molly.rc \
    init.recovery.roth.rc \
    power.dalmore.rc \
    power.molly.rc \
    power.roth.rc \
    ueventd.roth.rc

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.software.sip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml

# ATV specific stuff
ifeq ($(PRODUCT_IS_ATV),true)
    $(call inherit-product-if-exists, vendor/google/atv/atv-common.mk)

    PRODUCT_PACKAGES += \
        android.hardware.tv.input@1.0-impl
endif

# Audio
PRODUCT_PACKAGES += \
    audio.primary.$(LINEAGE_BUILD) \
    audio_policy.conf \
    nvaudio_conf.xml

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl \
    gps.conf \
    gpsconfig.xml

# Media config
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml
PRODUCT_PACKAGES += \
    media_codecs.xml \
    media_profiles.xml

# NVIDIA specific permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/com.nvidia.feature.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nvidia.feature.xml

# Sensors
PRODUCT_PACKAGES += \
    sensors.tegra

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-service-nvidia \
    thermalhal.dalmore.xml \
    thermalhal.roth.xml

# Wifi
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)
