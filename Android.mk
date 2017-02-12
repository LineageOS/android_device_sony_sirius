LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),sirius)
    include $(call first-makefiles-under,$(LOCAL_PATH))
endif

toto: 
	$(hide) echo "display: $(call project-path-for,qcom-display)"
	$(hide) echo "wifi: $(call project-path-for,wlan)"
	$(hide) echo "media: $(call project-path-for,qcom-media)"
	$(hide) echo "camera: $(call project-path-for,qcom-camera)"
	$(hide) echo "CAMERA_STUB: $(USE_CAMERA_STUB)"
	$(hide) echo "TARGET_PRODUCT_KERNEL_HEADERS: $(TARGET_PRODUCT_KERNEL_HEADERS)"
	$(hide) echo "PRODUCT_VENDOR_KERNEL_HEADERS: $(PRODUCT_VENDOR_KERNEL_HEADERS)"
	$(hide) echo "TARGET_BOARD_KERNEL_HEADERS: $(TARGET_BOARD_KERNEL_HEADERS)"
	$(hide) echo "TARGET_DEVICE_KERNEL_HEADERS: $(TARGET_DEVICE_KERNEL_HEADERS)"
	$(call validate-kernel-headers,$(TARGET_PRODUCT_KERNEL_HEADERS))
	$(hide) echo "kernel sources: $(TARGET_KERNEL_SOURCE)"
	echo "kernel sources: $(TARGET_KERNEL_SOURCE)"
	echo "PLATFORM_SDK_VERSION $(PLATFORM_SDK_VERSION)"

rebuild-headers: 
	rm -f $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/.headers_install_stamp
	rm -rf $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
	make -j2 $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
