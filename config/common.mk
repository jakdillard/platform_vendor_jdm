# JDM vendor config

# Common overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/jdm/overlay/common

# Additional Packages
PRODUCT_PACKAGES += \
    AudioFX \
    Eleven

# Additional tools
PRODUCT_PACKAGES += \
    librsjni

# Google Device specific
PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1

# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID=$(BUILD_ID).$(shell date +"%Y%m%d") USER=android-build BUILD_UTC_DATE=$(shell date +"%Y-%m-%d")

# Enable SIP+VoIP
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/jdm/prebuilt/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/jdm/prebuilt/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/jdm/prebuilt/bin/50-base.sh:system/addon.d/50-base.sh

# SuperSU
PRODUCT_COPY_FILES += \
    vendor/jdm/prebuilt/supersu/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
    vendor/jdm/prebuilt/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon

# Busybox
PRODUCT_COPY_FILES += \
    vendor/jdm/prebuilt/busybox/UPDATE-Busybox.zip:system/addon.d/UPDATE-Busybox.zip

# init.d script support
PRODUCT_COPY_FILES += \
    vendor/jdm/prebuilt/bin/sysinit:system/bin/sysinit

# JDM init file
PRODUCT_COPY_FILES += \
    vendor/jdm/prebuilt/etc/init.jdm.rc:root/init.jdm.rc

# Bootanimation
PRODUCT_COPY_FILES += \
    vendor/jdm/prebuilt/bootanimation/bootanimation.zip:system/media/bootanimation.zip

# Latin IME gesture typing 
PRODUCT_COPY_FILES += \
    vendor/jdm/prebuilt/lib64/libjni_latinimegoogle.so:system/lib64/libjni_latinime.so

# Disable dex optimization
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := false
    endif
  endif
endif

