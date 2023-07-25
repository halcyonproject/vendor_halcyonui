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

# Bootanimation
ifeq ($(TARGET_BOOT_ANIMATION_RES),1080)
     PRODUCT_COPY_FILES += vendor/halcyonui/bootanimation/bootanimation_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),1440)
     PRODUCT_COPY_FILES += vendor/halcyonui/bootanimation/bootanimation_1440.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),720)
     PRODUCT_COPY_FILES += vendor/halcyonui/bootanimation/bootanimation_720.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
else
    ifeq ($(TARGET_BOOT_ANIMATION_RES),)
        $(warning "halcyonUI: TARGET_BOOT_ANIMATION_RES is undefined, assuming 1080p")
    else
        $(warning "halcyonUI: Current bootanimation res is not supported, forcing 1080p")
    endif
    PRODUCT_COPY_FILES += vendor/halcyonui/bootanimation/bootanimation_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
endif

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
    NestQuickStep \
    ThemedIconsOverlay

# Theme Picker
PRODUCT_PACKAGES += \
    ThemePicker
