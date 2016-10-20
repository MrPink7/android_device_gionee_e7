# Copyright (C) 2014 The CyanogenMod Project
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

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/gionee/e7/e7.mk)

PRODUCT_NAME := cm_e7
PRODUCT_DEVICE := e7
PRODUCT_BRAND := Gionee
PRODUCT_MODEL := E7
PRODUCT_MANUFACTURER := Gionee

# Kernel
TARGET_KERNEL_SOURCE := kernel/gionee/e7
TARGET_KERNEL_CONFIG := e7_defconfig

$(call inherit-product-if-exists, vendor/gionee/e7/e7-vendor.mk)
