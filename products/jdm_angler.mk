#
# Copyright 2015 The Android Open Source Project
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

# Get the long list of APNs
PRODUCT_COPY_FILES := device/huawei/angler/apns-full-conf.xml:system/etc/apns-conf.xml

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, vendor/jdm/config/full_base_telephony.mk)

PRODUCT_NAME := jdm_angler
PRODUCT_DEVICE := angler
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 6P
PRODUCT_MANUFACTURER := Huawei

$(call inherit-product, device/huawei/angler/device.mk)
$(call inherit-product-if-exists, vendor/huawei/angler/device-vendor.mk)

PRODUCT_PACKAGES += \
    Launcher3

# Inherit custom product configuration
$(call inherit-product, vendor/jdm/config/common.mk)

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
BUILD_FINGERPRINT="google/angler/angler:6.0.1/MHC19I/2590160:user/release-keys" \
PRIVATE_BUILD_DESC="angler-user 6.0.1 MHC19I 2590160 release-keys"

# misc
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.force_eri_from_xml=true \
    ro.telephony.get_imsi_from_sim=true

# Miracast support
PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.wfd.enable=1

# drmservice prop
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# facelock properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.facelock.black_timeout=400 \
    ro.facelock.det_timeout=1500 \
    ro.facelock.rec_timeout=2500 \
    ro.facelock.lively_timeout=2500 \
    ro.facelock.est_max_time=600 \
    ro.facelock.use_intro_anim=false

# tethering
PRODUCT_PROPERTY_OVERRIDES += \
    net.tethering.noprovisioning=true

# Product extra packages
PRODUCT_PACKAGES += \
    CarrierConfig \
    CellBroadcastReceiver \
    Stk    
