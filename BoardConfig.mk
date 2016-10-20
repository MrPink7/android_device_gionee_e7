#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# inherit from the proprietary version
-include vendor/gionee/e7/BoardConfigVendor.mk

TARGET_SPECIFIC_HEADER_PATH := device/gionee/e7/include

# RIL
TARGET_RIL_VARIANT := caf

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE     := 16777216
BOARD_CACHEIMAGE_PARTITION_SIZE    := 536870912
BOARD_PERSISTIMAGE_PARTITION_SIZE  := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 1073741824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13747929088 # 13747945472 - 16384 for crypto footer
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 3221225472
BOARD_FLASH_BLOCK_SIZE := 131072

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := e7

# Platform
TARGET_BOARD_PLATFORM := msm8974
TARGET_BOARD_PLATFORM_GPU := qcom-adreno330
USE_CLANG_PLATFORM_BUILD := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := krait
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

# Krait optimizations
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION:= true
TARGET_USE_KRAIT_PLD_SET := true
TARGET_KRAIT_BIONIC_PLDOFFS := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH := 64
TARGET_KRAIT_BIONIC_PLDSIZE := 64

# Kernel
KERNEL_TOOLCHAIN_PREFIX := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-cortex_a15-linux-gnueabihf-linaro_4.9/bin/arm-cortex_a15-linux-gnueabihf-
BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.selinux=permissive androidboot.hardware=qcom user_debug=22 msm_rtb.filter=0x37 ehci-hcd.park=3 androidboot.bootdevice=msm_sdcc.1
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --kernel_offset 0x00008000
TARGET_CUSTOM_DTBTOOL := dtbTool.msm8974
BOARD_CUSTOM_BOOTIMG_MK := device/gionee/e7/mkbootimg.mk

# Power
TARGET_POWERHAL_VARIANT := qcom

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/gionee/e7/bluetooth

# Graphics
USE_OPENGL_RENDERER               := true
TARGET_CONTINUOUS_SPLASH_ENABLED  := true
TARGET_USES_C2D_COMPOSITION       := true
TARGET_USE_COMPAT_GRALLOC_PERFORM := true
TARGET_USES_ION                   := true
OVERRIDE_RS_DRIVER                := libRSDriver_adreno.so
NUM_FRAMEBUFFER_SURFACE_BUFFERS   := 3

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := false
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_NEW_SAMPLE_RATE := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
USE_CUSTOM_AUDIO_POLICY := 1

# Flags
COMMON_GLOBAL_CFLAGS   += -D__ARM_USE_PLD -D__ARM_CACHE_LINE_SIZE=64

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true

# CM Hardware
BOARD_USES_CYANOGEN_HARDWARE := true
TARGET_TAP_TO_WAKE_NODE := "/sys/devices/platform/tp_wake_switch/double_wake"
BOARD_HARDWARE_CLASS += \
    hardware/cyanogen/cmhw

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# Qualcomm support
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QC_TIME_SERVICES := true
USE_DEVICE_SPECIFIC_QCOM_PROPRIETARY:= true

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_WLAN_DEVICE                := qcwcn
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
TARGET_PROVIDES_WCNSS_QMI        := true
TARGET_USES_QCOM_WCNSS_QMI       := true
TARGET_USES_WCNSS_CTRL           := true
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME          := "wlan"

# keymaster
TARGET_KEYMASTER_WAIT_FOR_QSEE := true
    
# Recovery
#RECOVERY_VARIANT := twrp
TARGET_RECOVERY_FSTAB := device/gionee/e7/rootdir/fstab.qcom
TW_THEME := portrait_hdpi
TW_NO_SCREEN_TIMEOUT := true 
TARGET_USERIMAGES_USE_EXT4 := true
TW_FLASH_FROM_STORAGE := true
#TW_INCLUDE_JB_CRYPTO := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
# The real path for this is /sys/devices/mdp.0/qcom,cmdss_fb_primary.148/leds/lcd-backlight/brightness but the comma doesn't compile correctly
TW_BRIGHTNESS_PATH := "/sys/devices/mdp.0/qcom\x2cmdss_fb_primary.148/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_EXTRA_LANGUAGES := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"

# SELinux
include device/qcom/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += device/gionee/e7/sepolicy

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/gionee/e7
