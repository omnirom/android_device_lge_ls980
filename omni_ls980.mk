# Copyright (C) 2012 The CyanogenMod Project
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

# Inherit APNs list
$(call inherit-product, vendor/omni/config/cdma.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

$(call inherit-product-if-exists, vendor/lge/galbi/galbi-ls980-vendor.mk)
$(call inherit-product, device/lge/g2-common/g2.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := omni_ls980
PRODUCT_DEVICE := ls980
PRODUCT_BRAND := lge
PRODUCT_MANUFACTURER := lge
PRODUCT_MODEL := LG-LS980

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=lge/g2_spr_us/g2:4.4.2/KOT49I.LS980ZVC/LS980ZVC.1394331950:user/release-keys \
    PRIVATE_BUILD_DESC="g2_spr_us-user 4.4.2 KOT49I.LS980ZVC LS980ZVC.1394331950 release-keys"

## overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_PROPERTY_OVERRIDES += \
    ro.cdma.home.operator.numeric=310120 \
    ro.cdma.home.operator.alpha=Sprint \
    telephony.lteOnCdmaDevice=1 \
    telephony.lte.cdma.device=1 \
    ro.telephony.default_network=8 \
    ro.ril.def.preferred.network=8 \
    ril.subscription.types=NV,RUIM \
    ro.cdma.subscribe_on_ruim_ready=true \
    persist.radio.no_wait_for_card=1 \
    keyguard.no_require_sim=true \
    telephony.sms.pseudo_multipart=1 \
    DEVICE_PROVISIONED=1

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

# NFC packages
PRODUCT_PACKAGES += \
    nfc.default \
    libnfc \
    libnfc_jni \
    Nfc
