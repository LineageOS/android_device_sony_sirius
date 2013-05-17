# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=16m \
    dalvik.vm.heapgrowthlimit=192m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=2m \
    dalvik.vm.heapmaxfree=8m

# LCD
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=480

# USB path
PRODUCT_PROPERTY_OVERRIDES += \
    ro.usb.pid_suffix=1AF
