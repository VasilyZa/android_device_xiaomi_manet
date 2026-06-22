#
# Copyright (C) 2024 The OrangeFox Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/manet

# Inherit TWRP common configuration
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit device configuration
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# Device identifier
PRODUCT_DEVICE := manet
PRODUCT_NAME := twrp_manet
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := K70 Pro
PRODUCT_MANUFACTURER := xiaomi
