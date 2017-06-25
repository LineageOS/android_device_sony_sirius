# Copyright (C) 2013 The CyanogenMod Project
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

# Inherit the fusion-common definitions
$(call inherit-product, device/sony/shinano-common/shinano.mk)

DEVICE_PACKAGE_OVERLAYS += device/sony/sirius/overlay

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/d6502.sh:d6502.sh

# Audio
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
   $(LOCAL_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths.xml \
   $(LOCAL_PATH)/audio/mixer_paths_auxpcm.xml:system/etc/mixer_paths_auxpcm.xml

# Thermal manager
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/thermanager.xml:system/etc/thermanager.xml

# Wifi
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/rootdir/system/etc/wifi/bcmdhd.cal:system/etc/wifi/bcmdhd.cal
   
# LCD
PRODUCT_PROPERTY_OVERRIDES += \
ro.sf.lcd_density=480

# USB path
PRODUCT_PROPERTY_OVERRIDES += \
ro.usb.pid_suffix=1AF

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
ro.use_data_netmgrd=true
   
# NFC
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/rootdir/system/etc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
   $(LOCAL_PATH)/rootdir/system/etc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf
   
# Sensor
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/rootdir/system/etc/sensor_def_qcomdev.conf:system/etc/sensor_def_qcomdev.conf \

# Dalvik/HWUI
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-3072-dalvik-heap.mk)
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-3072-hwui-memory.mk)

# Include non-opensource parts
$(call inherit-product, vendor/sony/sirius/sirius-vendor.mk)
