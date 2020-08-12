# config.mk
#
# Product-specific compile-time definitions.
#

#Generate DTBO image
BOARD_KERNEL_SEPARATED_DTBO := true

### Dynamic partition Handling
ifneq ($(strip $(BOARD_DYNAMIC_PARTITION_ENABLE)),true)
BOARD_VENDORIMAGE_PARTITION_SIZE := 1073741824
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
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

ifeq ($(SHIPPING_API_LEVEL),29)
BOARD_SYSTEMSDK_VERSIONS:=29
else
BOARD_SYSTEMSDK_VERSIONS:=28
endif

TARGET_BOARD_PLATFORM := msmnile
TARGET_BOOTLOADER_BOARD_NAME := msmnile

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a9

TARGET_HW_DISK_ENCRYPTION := true
TARGET_HW_DISK_ENCRYPTION_PERF := true

TARGET_USES_UEFI := true
TARGET_NO_KERNEL := false
-include vendor/qcom/prebuilt/msmnile/BoardConfigVendor.mk
-include $(QCPATH)/common/msmnile/BoardConfigVendor.mk

USE_OPENGL_RENDERER := true
BOARD_USE_LEGACY_UI := true

#Disable appended dtb
TARGET_KERNEL_APPEND_DTB := false

# Set Header version for bootimage
ifneq ($(strip $(TARGET_KERNEL_APPEND_DTB)),true)
#Enable dtb in boot image and Set Header version
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_BOOTIMG_HEADER_VERSION := 2
else
BOARD_BOOTIMG_HEADER_VERSION := 1
endif
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

# Defines for enabling A/B builds
AB_OTA_UPDATER := true
# Full A/B partition update set
# AB_OTA_PARTITIONS := xbl rpm tz hyp pmic modem abl boot keymaster cmnlib cmnlib64 system bluetooth

# Minimum partition set for automation to test recovery generation code
# Packages generated by using just the below flag cannot be used for updating a device. You must pass
# in the full set mentioned above as part of your make commandline
AB_OTA_PARTITIONS ?= boot vendor odm

BOARD_USES_METADATA_PARTITION := true

#Enable compilation of oem-extensions to recovery
#These need to be explicitly
ifneq ($(AB_OTA_UPDATER),true)
    TARGET_RECOVERY_UPDATER_LIBS += librecovery_updater_msm
endif

#Enable split vendor image
ENABLE_VENDOR_IMAGE := true
ifeq ($(ENABLE_VENDOR_IMAGE), true)
ifneq ($(strip $(BOARD_DYNAMIC_PARTITION_ENABLE)),true)
TARGET_RECOVERY_FSTAB := device/oneplus/oneplus7/recovery_vendor_variant.fstab

else
TARGET_RECOVERY_FSTAB := device/oneplus/oneplus7/recovery_dynamic_partition.fstab
endif
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
else
TARGET_RECOVERY_FSTAB := device/oneplus/oneplus7/recovery.fstab
endif
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x06000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 48318382080
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_METADATAIMAGE_PARTITION_SIZE := 16777216
BOARD_DTBOIMG_PARTITION_SIZE := 0x0800000
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

#----------------------------------------------------------------------
# Compile Linux Kernel
#----------------------------------------------------------------------
TARGET_USES_ION := true
TARGET_USES_NEW_ION_API :=true
TARGET_USES_QCOM_BSP := false
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 earlycon=msm_geni_serial,0xa90000 androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 swiotlb=2048 loop.max_part=7 androidboot.usbcontroller=a600000.dwc3

BOARD_EGL_CFG := device/onelpus/oneplus7/configs/egl.cfg

BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64

MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

#File system for ODM
TARGET_COPY_OUT_ODM := odm
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_USES_GENERIC_AUDIO := true
TARGET_NO_RPC := true

TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/

TARGET_COMPILE_WITH_MSM_KERNEL := true

#Enable PD locater/notifier
TARGET_PD_SERVICE_ENABLED := true

#Enable peripheral manager
TARGET_PER_MGR_ENABLED := true

TARGET_USES_GRALLOC1 := true

# Enable sensor multi HAL
USE_SENSOR_MULTI_HAL := true

# Enable sensor Version V_2
USE_SENSOR_HAL_VER := 2.0

#Add non-hlos files to ota packages
ADD_RADIO_FILES := true

#Enable INTERACTION_BOOST
TARGET_USES_INTERACTION_BOOST := true

#Enable DRM plugins 64 bit compilation
TARGET_ENABLE_MEDIADRM_64 := true

#----------------------------------------------------------------------
# wlan specific
#----------------------------------------------------------------------
-include device/qcom/wlan/msmnile/BoardConfigWlan.mk

BUILD_BROKEN_DUP_RULES := true

#Enable VNDK Compliance
BOARD_VNDK_VERSION := current

#Disable PHONY target checks for initial bringup
BUILD_BROKEN_PHONY_TARGETS := true