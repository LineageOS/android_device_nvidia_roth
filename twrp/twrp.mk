PRODUCT_COPY_FILES += device/nvidia/roth/twrp/twrp.fstab:recovery/root/etc/twrp.fstab

TW_THEME := landscape_hdpi
TW_BRIGHTNESS_PATH := /sys/class/backlight/pwm-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_ROTATION := 90
TARGET_RECOVERY_FORCE_PIXEL_FORMAT := RGB_565
TW_EXCLUDE_MTP := true
TW_NO_EXFAT := true
TW_NO_EXFAT_FUSE := true
