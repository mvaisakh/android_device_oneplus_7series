# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2020 The Linux Foundation. All rights reserved.
# Copyright (c) 2020 Paranoid Android

# config.mk
#
# Product-specific compile-time definitions.
#

# Platform
TARGET_BOARD_PLATFORM := msmnile
TARGET_BOOTLOADER_BOARD_NAME := msmnile

# Architechture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a9
TARGET_CPU_VARIANT_RUNTIME := cortex-a76

# Defines for enabling A/B builds
AB_OTA_UPDATER := true
# Full A/B partition update set
# AB_OTA_PARTITIONS := xbl rpm tz hyp pmic modem abl boot keymaster cmnlib cmnlib64 system bluetooth

# Minimum partition set for automation to test recovery generation code
# Packages generated by using just the below flag cannot be used for updating a device. You must pass
# in the full set mentioned above as part of your make commandline
AB_OTA_PARTITIONS ?= boot vendor odm

#----------------------------------------------------------------------
# Compile Linux Kernel
#----------------------------------------------------------------------
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 earlycon=msm_geni_serial,0xa90000
BOARD_KERNEL_CMDLINE += androidboot.hardware=qcom androidboot.console=ttyMSM0
BOARD_KERNEL_CMDLINE += androidboot.memcg=1 lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE += video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237
BOARD_KERNEL_CMDLINE += service_locator.enable=1 swiotlb=2048
BOARD_KERNEL_CMDLINE += loop.max_part=7 androidboot.usbcontroller=a600000.dwc3
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000
BOARD_KERNEL_IMAGE_NAME := Image.gz
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
NEED_KERNEL_MODULE_SYSTEM := true
TARGET_KERNEL_SOURCE := kernel/oneplus/sm8150
TARGET_KERNEL_CONFIG := sm8150-perf_defconfig
TARGET_KERNEL_NEW_GCC_COMPILE := true
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_USES_UEFI := true
TARGET_NO_KERNEL := false
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

# Audio
AUDIO_FEATURE_QSSI_COMPLIANCE := false
AUDIO_FEATURE_ENABLED_COMPRESS_CAPTURE := false
AUDIO_FEATURE_ENABLED_COMPRESS_INPUT := true
AUDIO_FEATURE_ENABLED_CONCURRENT_CAPTURE := true
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := false
AUDIO_FEATURE_ENABLED_DYNAMIC_ECNS := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_EXTN_FLAC_DECODER := true
AUDIO_FEATURE_ENABLED_EXTN_RESAMPLER := true
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
AUDIO_FEATURE_ENABLED_HDMI_SPK := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD_24 := true
AUDIO_FEATURE_ENABLED_FLAC_OFFLOAD := true
AUDIO_FEATURE_ENABLED_VORBIS_OFFLOAD := true
AUDIO_FEATURE_ENABLED_WMA_OFFLOAD := true
AUDIO_FEATURE_ENABLED_ALAC_OFFLOAD := true
AUDIO_FEATURE_ENABLED_APE_OFFLOAD := true
AUDIO_FEATURE_ENABLED_AAC_ADTS_OFFLOAD := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_SSR := true
AUDIO_FEATURE_ENABLED_DTS_EAGLE := true
BOARD_USES_SRS_TRUEMEDIA := false
DTS_CODEC_M_ := true
MM_AUDIO_ENABLED_SAFX := true
AUDIO_FEATURE_ENABLED_HW_ACCELERATED_EFFECTS := false
AUDIO_FEATURE_ENABLED_AUDIOSPHERE := true
AUDIO_FEATURE_ENABLED_USB_TUNNEL := true
AUDIO_FEATURE_ENABLED_A2DP_OFFLOAD := true
AUDIO_FEATURE_ENABLED_3D_AUDIO := true
AUDIO_FEATURE_ENABLED_AHAL_EXT := true
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := true
DOLBY_ENABLE := true
USE_XML_AUDIO_POLICY_CONF := 1
BOARD_SUPPORTS_SOUND_TRIGGER := true
AUDIO_FEATURE_ENABLED_INSTANCE_ID := true
AUDIO_USE_DEEP_AS_PRIMARY_OUTPUT := false
AUDIO_FEATURE_ENABLED_VBAT_MONITOR := true
AUDIO_FEATURE_ENABLED_ANC_HEADSET := true
AUDIO_FEATURE_ENABLED_CUSTOMSTEREO := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_HDMI_EDID := true
AUDIO_FEATURE_ENABLED_HDMI_PASSTHROUGH := true
AUDIO_FEATURE_ENABLED_DISPLAY_PORT := true
AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := false
AUDIO_FEATURE_ENABLED_HFP := true
AUDIO_FEATURE_ENABLED_INCALL_MUSIC := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_ENABLED_SPKR_PROTECTION := true
AUDIO_FEATURE_ENABLED_ACDB_LICENSE := false
AUDIO_FEATURE_ENABLED_DEV_ARBI := false
MM_AUDIO_ENABLED_FTM := true
TARGET_USES_QCOM_MM_AUDIO := true
AUDIO_FEATURE_ENABLED_SOURCE_TRACKING := true
AUDIO_FEATURE_ENABLED_GEF_SUPPORT := true
BOARD_SUPPORTS_QAHW := false
AUDIO_FEATURE_ENABLED_RAS := true
AUDIO_FEATURE_ENABLED_SND_MONITOR := true
AUDIO_FEATURE_ENABLED_DLKM := false
AUDIO_FEATURE_ENABLED_USB_BURST_MODE := true
AUDIO_FEATURE_ENABLED_SVA_MULTI_STAGE := true
AUDIO_FEATURE_ENABLED_BATTERY_LISTENER := true

# AVB
BOARD_AVB_ENABLE := true

# AV
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Display
TARGET_USES_GRALLOC1 := true
TARGET_USES_ION := true
TARGET_USES_NEW_ION_API :=true

# EGL
BOARD_EGL_CFG := device/onelpus/7series/configs/egl.cfg
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

# Encryption
TARGET_HW_DISK_ENCRYPTION := true
TARGET_HW_DISK_ENCRYPTION_PERF := true

# Fingerprint
SOONG_CONFIG_NAMESPACES += oneplusMsmnileFodPlugin
SOONG_CONFIG_oneplusMsmnileFodPlugin := posX posY size

BOARD_USES_GENERIC_AUDIO := true
TARGET_NO_RPC := true

TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/

# Media
TARGET_ENABLE_MEDIADRM_64 := true

# OpenGL
USE_OPENGL_RENDERER := true

#
# Partitions
#
### Dynamic partition Handling
ifneq ($(strip $(BOARD_DYNAMIC_PARTITION_ENABLE)),true)
BOARD_VENDORIMAGE_PARTITION_SIZE := 1073741824
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3640655872
BOARD_ODMIMAGE_PARTITION_SIZE := 67108864
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
TARGET_NO_RECOVERY := true
BOARD_USES_RECOVERY_AS_BOOT := true
else
# Define the Dynamic Partition sizes and groups.
BOARD_SUPER_PARTITION_SIZE := 12884901888
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 6438256640
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := vendor odm
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x06000000
BOARD_EXT4_SHARE_DUP_BLOCKS := true
    ifeq ($(BOARD_KERNEL_SEPARATED_DTBO),true)
        # Enable DTBO for recovery image
        BOARD_INCLUDE_RECOVERY_DTBO := true
    endif
endif
### Dynamic partition Handling

## Enable split vendor image
ENABLE_VENDOR_IMAGE := true
ifeq ($(ENABLE_VENDOR_IMAGE), true)
ifneq ($(strip $(BOARD_DYNAMIC_PARTITION_ENABLE)),true)
TARGET_RECOVERY_FSTAB := device/oneplus/7series/rootdir/etc/recovery_vendor_variant.fstab

else
TARGET_RECOVERY_FSTAB := device/oneplus/7series/rootdir/etc/recovery_dynamic_partition.fstab
endif
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
else
TARGET_RECOVERY_FSTAB := device/oneplus/7series/rootdir/etc/recovery.fstab
endif
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_USERDATAIMAGE_PARTITION_SIZE := 115601780736
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_METADATAIMAGE_PARTITION_SIZE := 16777216
BOARD_DTBOIMG_PARTITION_SIZE := 0x0800000
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
#File system for ODM
TARGET_COPY_OUT_ODM := odm
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_MOUNT_POINTS_SYMLINKS := false
TARGET_USES_MKE2FS := true
BOARD_USES_METADATA_PARTITION := true

# PD locater/notifier
TARGET_PD_SERVICE_ENABLED := true

# Perf
TARGET_USES_INTERACTION_BOOST := true

# Peripheral manager
TARGET_PER_MGR_ENABLED := true

# Sensors
USE_SENSOR_MULTI_HAL := true
USE_SENSOR_HAL_VER := 2.0

# Sepolicy
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Treble
BOARD_VNDK_VERSION := current
PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_VENDOR_MOVE_ENABLED := true

#----------------------------------------------------------------------
# wlan specific
#----------------------------------------------------------------------
QC_WIFI_HIDL_FEATURE_DUAL_AP := true
TARGET_USES_AOSP_FOR_WLAN := false
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_DRIVER_STATE_ON := "ON"
WIFI_DRIVER_STATE_OFF := "OFF"
WIFI_HIDL_FEATURE_AWARE := true
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true

BUILD_BROKEN_DUP_RULES := true

#Disable PHONY target checks for initial bringup
BUILD_BROKEN_PHONY_TARGETS := true
