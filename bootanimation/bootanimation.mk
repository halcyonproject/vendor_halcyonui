#
# Copyright (C) 2023 Halcyon Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Bootanimation
ifeq ($(TARGET_SCREEN_WIDTH),)
     $(warning "TARGET_SCREEN_WIDTH is undefined, assuming 1080p")
     TARGET_SCREEN_WIDTH ?= 1080
     TARGET_SCREEN_HEIGHT ?= 1920
else
     $(warning "Current TARGET_SCREEN_WIDTH res is not supported, forcing 1080p")
     TARGET_SCREEN_WIDTH ?= 1080
     TARGET_SCREEN_HEIGHT ?= 1920
endif

# Bootanimation
PRODUCT_PACKAGES += \
    bootanimation.zip