#
# Copyright (C) 2019-2021 The conquerOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

include $(call all-subdir-makefiles,$(LOCAL_PATH))

# Boot Animation
$(call inherit-product, vendor/halcyonui/bootanimation/bootanimation.mk)

# Overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/halcyonui/overlay
DEVICE_PACKAGE_OVERLAYS += \
    vendor/halcyonui/overlay/common/

# Power off charing resource
PRODUCT_PACKAGES += \
    charger_res_images \
    product_charger_res_images

# Nest Launcher
PRODUCT_PACKAGES += \
    ThemedIconsOverlay

# Lagfest Memory Robbery Launcher
PRODUCT_PACKAGES += \
    LagfestMemoryRobberyLauncher
