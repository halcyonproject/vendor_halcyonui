#
# Copyright (C) 2019-2025 The conquerOS Project
#           (C) 2021-2025 The Halcyon Project
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

AUDIO_PATH := vendor/halcyonui/media/audio

# Ringrones
PRODUCT_COPY_FILES += \
    $(AUDIO_PATH)/ringtones/Nest.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Nest.ogg \
    $(AUDIO_PATH)/ringtones/Running.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Running.ogg \
    $(AUDIO_PATH)/ringtones/Sticks.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Sticks.ogg

# Notifications
PRODUCT_COPY_FILES += \
    $(AUDIO_PATH)/notifications/Brightside.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Brightside.ogg \
    $(AUDIO_PATH)/notifications/Dash.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Dash.ogg \
    $(AUDIO_PATH)/notifications/Keys.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Keys.ogg \
    $(AUDIO_PATH)/notifications/North.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/North.ogg \
    $(AUDIO_PATH)/notifications/Oxidation.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Oxidation.ogg \
    $(AUDIO_PATH)/notifications/Radar.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Radar.ogg \
    $(AUDIO_PATH)/notifications/Spaceship.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Spaceship.ogg \
    $(AUDIO_PATH)/notifications/Sticks.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Sticks.ogg

# System UI Effects
PRODUCT_COPY_FILES += \
    $(AUDIO_PATH)/ui/ChargingStarted.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/ChargingStarted.ogg \
    $(AUDIO_PATH)/ui/Lock.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/Lock.ogg \
    $(AUDIO_PATH)/ui/LowBattery.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/LowBattery.ogg \
    $(AUDIO_PATH)/ui/Unlock.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/Unlock.ogg

# Set default ringtone and notification sound
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.notification_sound=Brightside.ogg \
    ro.config.ringtone=Sticks.ogg
