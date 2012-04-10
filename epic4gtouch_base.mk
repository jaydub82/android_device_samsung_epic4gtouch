#
# Copyright (C) 2012 The Android Open-Source Project
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
DEVICE_PACKAGE_OVERLAYS := device/samsung/epic4gtouch/overlay

# This device is hdpi.
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += hdpi

# Init files
PRODUCT_COPY_FILES := \
	device/samsung/epic4gtouch/lpm.rc:root/lpm.rc \
	device/samsung/epic4gtouch/init.smdk4210.usb.rc:root/init.smdk4210.usb.rc \
	device/samsung/epic4gtouch/init.smdk4210.rc:root/init.smdk4210.rc \
	device/samsung/epic4gtouch/ueventd.smdk4210.rc:root/ueventd.smdk4210.rc

# Audio
PRODUCT_COPY_FILES += \
	device/samsung/epic4gtouch/configs/asound.conf:system/etc/asound.conf

# Vold
PRODUCT_COPY_FILES += \
	device/samsung/epic4gtouch/configs/vold.fstab:system/etc/vold.fstab

# Media
PRODUCT_COPY_FILES += \
	device/samsung/epic4gtouch/configs/media_profiles.xml:system/etc/media_profiles.xml

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
	system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf

# Wifi
PRODUCT_COPY_FILES += \
	device/samsung/epic4gtouch/configs/nvram_net.txt:system/etc/nvram_net.txt \
	device/samsung/epic4gtouch/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
	device/samsung/epic4gtouch/configs/bcmdhd.cal:system/etc/wifi/bcmdhd.cal

PRODUCT_PROPERTY_OVERRIDES := \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=15

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

# Gps
PRODUCT_COPY_FILES += \
	device/samsung/epic4gtouch/configs/gps.conf:system/etc/gps.conf \
	device/samsung/epic4gtouch/configs/sirfgps.conf:system/etc/sirfgps.conf

# Packages
PRODUCT_PACKAGES := \
        com.android.future.usb.accessory \
        TvOut \
        TvOutHack \
        Camera \
        camera.exynos4 \
        Torch \
        GalaxyS2Settings \
        SamsungServiceMode

# HAL 
PRODUCT_PACKAGES += \
        lights.SPH-D710 \
        libhwconverter \
        libswconverter \
        libs5pjpeg \
        libfimg

# OMX 
PRODUCT_PACKAGES += \
        libstagefrighthw \
        libcsc \
        libsecbasecomponent \
        libsecosal \
        libSEC_OMX_Resourcemanager \
        libSEC_OMX_Core \
        libSEC_OMX_Vdec \
        libOMX.SEC.AVC.Decoder \
        libOMX.SEC.M4V.Decoder \
        libOMX.SEC.WMV.Decoder \
        libOMX.SEC.VP8.Decoder \
        libSEC_OMX_Venc \
        libOMX.SEC.AVC.Encoder \
        libOMX.SEC.M4V.Encoder \
        libSEC_OMX_Adec \
        libOMX.SEC.MP3.Decoder 

# Ril
PRODUCT_PROPERTY_OVERRIDES += \
	ro.telephony.default_network=4 \
	ro.com.google.clientidbase=android-sprint-us \
	ro.cdma.home.operator.numeric=310120 \
	ro.cdma.home.operator.alpha=Sprint \
	net.cdma.pppd.authtype=require-pap \
	net.cdma.pppd.user=user[SPACE]SprintNextel \
	net.cdma.datalinkinterface=/dev/ttyCDMA0 \
	net.interfaces.defaultroute=cdma \
	ro.telephony.ril_class=SamsungRIL \
	ro.ril.samsung_cdma=true \
	ro.carrier=Sprint \
	ro.wimax.interface=uwbr0 \
	ro.cdma.ppp.interface=ppp0 \
	net.tcp.buffersize.wimax=4096,524288,1048576,4096,16384,110208 \
	mobiledata.interfaces=ppp0,uwbr0

PRODUCT_COPY_FILES += \
	device/samsung/epic4gtouch/configs/ip-up:system/etc/ppp/ip-up \
	device/samsung/epic4gtouch/configs/ip-down:system/etc/ppp/ip-down\
	device/samsung/epic4gtouch/configs/pppd_runner:system/bin/pppd_runner

# Filesystem management tools
PRODUCT_PACKAGES += \
	static_busybox \
	make_ext4fs \
	setup_fs

# Live Wallpapers
PRODUCT_PACKAGES += \
	Galaxy4 \
	HoloSpiralWallpaper \
	LiveWallpapers \
	LiveWallpapersPicker \
	MagicSmokeWallpapers \
	NoiseField \
	PhaseBeam \
	VisualizationWallpapers \
	librs_jni

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
	frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/base/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
	frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Feature live wallpaper
PRODUCT_COPY_FILES += \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072 \
	hwui.render_dirty_regions=false

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=240

PRODUCT_TAGS += dalvik.gc.type-precise

# Set default USB interface
PRODUCT_PROPERTY_OVERRIDES += \
	ro.vold.switchablepair=/mnt/sdcard,/mnt/emmc \
        persist.sys.usb.config=mass_storage

$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)

# Include exynos4 platform specific parts
$(call inherit-product, hardware/samsung/exynos4/Android.mk)
