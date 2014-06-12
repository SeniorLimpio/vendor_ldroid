PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1 \
    persist.sys.root_access=3 \
    ro.adb.secure=3

# CM Theme Engine
include vendor/slim/config/themes_common.mk

# Embed SuperUser
SUPERUSER_EMBEDDED := true
 
# Tether for all
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.dun.override=0

# Disable excessive dalvik debug messages
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.debug.alloc=0

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/slim/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/slim/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/slim/prebuilt/common/bin/50-ldroid.sh:system/addon.d/50-ldroid.sh \
    vendor/slim/prebuilt/common/bin/99-backup.sh:system/addon.d/99-backup.sh \
    vendor/slim/prebuilt/common/etc/backup.conf:system/etc/backup.conf

# L-Droid-specific init file
PRODUCT_COPY_FILES += \
    vendor/slim/prebuilt/common/etc/init.local.rc:root/init.ldroid.rc

# Copy latinime for gesture typing
PRODUCT_COPY_FILES += \
    vendor/slim/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so

# Copy libgif for Nova Launcher 3.0
PRODUCT_COPY_FILES += \
    vendor/slim/prebuilt/common/lib/libgif.so:system/lib/libgif.so

# SELinux filesystem labels
PRODUCT_COPY_FILES += \
    vendor/slim/prebuilt/common/etc/init.d/50selinuxrelabel:system/etc/init.d/50selinuxrelabel

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/slim/prebuilt/common/etc/mkshrc:system/etc/mkshrc \
    vendor/slim/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf

PRODUCT_COPY_FILES += \
    vendor/slim/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/slim/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit \
    vendor/slim/prebuilt/common/bin/sysinit:system/bin/sysinit

# Workaround for NovaLauncher zipalign fails
PRODUCT_COPY_FILES += \
    vendor/slim/prebuilt/common/app/NovaLauncher.apk:system/app/NovaLauncher.apk

# Required packages
PRODUCT_PACKAGES += \
    Camera \
    Development \
    SpareParts \
    Superuser \
    su

PRODUCT_COPY_FILES += \
    external/koush/Superuser/init.superuser.rc:root/init.superuser.rc

# Copy specific L-Droid files
PRODUCT_COPY_FILES += \
    vendor/slim/prebuilt/common/app/BoefflaConfig.apk:system/app/BoefflaConfig.apk \

# Added xbin files
PRODUCT_COPY_FILES += \
    vendor/slim/prebuilt/common/xbin/zip:system/xbin/zip \
    vendor/slim/prebuilt/common/xbin/zipalign:system/xbin/zipalign \

# init.d support
PRODUCT_COPY_FILES += \
    vendor/slim/prebuilt/common/bin/sysinit:system/bin/sysinit \
    vendor/slim/prebuilt/common/etc/helpers.sh:system/etc/helpers.sh \
    vendor/slim/prebuilt/common/etc/init.d.cfg:system/etc/init.d.cfg \
    vendor/slim/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/slim/prebuilt/common/etc/init.d/01check:system/etc/init.d/00check \
    vendor/slim/prebuilt/common/etc/init.d/02zipalign:system/etc/init.d/01zipalign \
    vendor/slim/prebuilt/common/etc/init.d/03sysctl:system/etc/init.d/02sysctl \
    vendor/slim/prebuilt/common/etc/init.d/04firstboot:system/etc/init.d/03firstboot \
    vendor/slim/prebuilt/common/etc/init.d/05freemem:system/etc/init.d/05freemem \
    vendor/slim/prebuilt/common/etc/init.d/06removecache:system/etc/init.d/06removecache \
    vendor/slim/prebuilt/common/etc/init.d/07fixperms:system/etc/init.d/07fixperms \
    vendor/slim/prebuilt/common/etc/init.d/09cron:system/etc/init.d/09cron \
    vendor/slim/prebuilt/common/etc/init.d/10sdboost:system/etc/init.d/10sdboost \
    vendor/slim/prebuilt/common/etc/init.d/11battery:system/etc/init.d/11battery \
    vendor/slim/prebuilt/common/etc/init.d/12touch:system/etc/init.d/12touch \
    vendor/slim/prebuilt/common/etc/init.d/13minfree:system/etc/init.d/13minfree \
    vendor/slim/prebuilt/common/etc/init.d/14gpurender:system/etc/init.d/14gpurender \
    vendor/slim/prebuilt/common/etc/init.d/15sleepers:system/etc/init.d/15sleepers \
    vendor/slim/prebuilt/common/etc/init.d/16journalism:system/etc/init.d/16journalism \
    vendor/slim/prebuilt/common/etc/init.d/17sqlite3:system/etc/init.d/17sqlite3 \
    vendor/slim/prebuilt/common/etc/init.d/18wifisleep:system/etc/init.d/18wifisleep \
    vendor/slim/prebuilt/common/etc/init.d/19iostats:system/etc/init.d/19iostats \
    vendor/slim/prebuilt/common/etc/init.d/20setrenice:system/etc/init.d/20setrenice \
    vendor/slim/prebuilt/common/etc/init.d/21tweaks:system/etc/init.d/21tweaks \
    vendor/slim/prebuilt/common/etc/init.d/24speedy_modified:system/etc/init.d/24speedy_modified \
    vendor/slim/prebuilt/common/etc/init.d/25loopy_smoothness_tweak:system/etc/init.d/25loopy_smoothness_tweak \

# Optional packages
PRODUCT_PACKAGES += \
    Basic \
    HoloSpiralWallpaper \
    NoiseField \
    Galaxy4 \
    LiveWallpapersPicker \
    PhaseBeam \

# Screen recorder
PRODUCT_PACKAGES += \
    ScreenRecorder \
    libscreenrecorder

# DSPManager
PRODUCT_PACKAGES += \
    DSPManager \
    libcyanogen-dsp \
    audio_effects.conf

# Extra Optional packages
PRODUCT_PACKAGES += \
    SlimFileManager \
    LatinIME \
    BluetoothExt \
    DashClock \
    KernelTweaker

# Terminal Emulator
PRODUCT_COPY_FILES +=  \
    vendor/slim/prebuilt/Term.apk:system/app/Term.apk \
    vendor/slim/prebuilt/lib/libjackpal-androidterm4.so:system/lib/libjackpal-androidterm4.so

# Fixed Camera library file
PRODUCT_COPY_FILES +=  \
    vendor/slim/prebuilt/lib/camera.smdk4x12.so:system/lib/hw/camera.smdk4x12.so

# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    oprofiled \
    sqlite3 \
    strace

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libstagefright_soft_ffmpegadec \
    libstagefright_soft_ffmpegvdec \
    libFFmpegExtractor \
    libnamparser

# easy way to extend to add more packages
-include vendor/extra/product.mk

PRODUCT_PACKAGE_OVERLAYS += vendor/slim/overlay/common

# Boot animation include
ifneq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))

# determine the smaller dimension
TARGET_BOOTANIMATION_SIZE := $(shell \
  if [ $(TARGET_SCREEN_WIDTH) -lt $(TARGET_SCREEN_HEIGHT) ]; then \
    echo $(TARGET_SCREEN_WIDTH); \
  else \
    echo $(TARGET_SCREEN_HEIGHT); \
  fi )

# get a sorted list of the sizes
bootanimation_sizes := $(subst .zip,, $(shell ls vendor/slim/prebuilt/common/bootanimation))
bootanimation_sizes := $(shell echo -e $(subst $(space),'\n',$(bootanimation_sizes)) | sort -rn)

# find the appropriate size and set
define check_and_set_bootanimation
$(eval TARGET_BOOTANIMATION_NAME := $(shell \
  if [ -z "$(TARGET_BOOTANIMATION_NAME)" ]; then
    if [ $(1) -le $(TARGET_BOOTANIMATION_SIZE) ]; then \
      echo $(1); \
      exit 0; \
    fi;
  fi;
  echo $(TARGET_BOOTANIMATION_NAME); ))
endef
$(foreach size,$(bootanimation_sizes), $(call check_and_set_bootanimation,$(size)))

PRODUCT_COPY_FILES += \
    vendor/slim/prebuilt/common/bootanimation/$(TARGET_BOOTANIMATION_NAME).zip:system/media/bootanimation.zip
endif



# Versioning System
# KitKat L-Droid freeze code
PRODUCT_VERSION_MAJOR = 2
PRODUCT_VERSION_MINOR = 1
PRODUCT_VERSION_MAINTENANCE = 3
ifdef LDROID_BUILD_EXTRA
    LDROID_POSTFIX := -$(LDROID_BUILD_EXTRA)
endif
ifndef LDROID_BUILD_TYPE
    LDROID_BUILD_TYPE := UNOFFICIAL
    PLATFORM_VERSION_CODENAME := UNOFFICIAL
    LDROID_POSTFIX := -$(shell date +"%Y%m%d")
endif

# Set all versions
LDROID_VERSION := L-Droid-v$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)
LDROID_MOD_VERSION := L-Droid-v$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(LDROID_BUILD)-$(LDROID_POSTFIX)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ldroid.ota.version=v$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE) \
    ro.ldroid.version=v$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE) \
    ro.modversion=$(LDROID_MOD_VERSION)
