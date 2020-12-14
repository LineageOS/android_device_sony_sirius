# Copyright (C) 2013-2016 The CyanogenMod Project
#           (C) 2017-2020 The LineageOS Project
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

# inherit from the common shinano definitions
include device/sony/shinano-common/BoardConfigCommon.mk

DEVICE_PATH := device/sony/sirius

# Assert
TARGET_OTA_ASSERT_DEVICE := sirius

# Kernel properties
TARGET_KERNEL_CONFIG := lineageos_shinano_sirius_defconfig

# Partition information
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2671771648
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12656294912

# Power
TARGET_TAP_TO_WAKE_NODE := "/sys/devices/virtual/input/max1187x/wakeup_gesture"

# Partition information
BOARD_VOLD_MAX_PARTITIONS := 25

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/sony/sirius

# SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# Inherit from proprietary files
include vendor/sony/sirius/BoardConfigVendor.mk
