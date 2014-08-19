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
include vendor/ldroid/config/themes_common.mk

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
    vendor/ldroid/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/ldroid/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/ldroid/prebuilt/common/bin/50-ldroid.sh:system/addon.d/50-ldroid.sh \
    vendor/ldroid/prebuilt/common/bin/99-backup.sh:system/addon.d/99-backup.sh \
    vendor/ldroid/prebuilt/common/etc/backup.conf:system/etc/backup.conf

# L-Droid-specific init file
PRODUCT_COPY_FILES += \
    vendor/ldroid/prebuilt/common/etc/init.local.rc:root/init.ldroid.rc

# Copy latinime for gesture typing
PRODUCT_COPY_FILES += \
    vendor/ldroid/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so

# Copy libgif for Nova Launcher 3.0
PRODUCT_COPY_FILES += \
    vendor/ldroid/prebuilt/common/lib/libgif.so:system/lib/libgif.so

# SELinux filesystem labels
PRODUCT_COPY_FILES += \
    vendor/ldroid/prebuilt/common/etc/init.d/50selinuxrelabel:system/etc/init.d/50selinuxrelabel

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/ldroid/prebuilt/common/etc/mkshrc:system/etc/mkshrc \
    vendor/ldroid/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf

PRODUCT_COPY_FILES += \
    vendor/ldroid/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/ldroid/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit \
    vendor/ldroid/prebuilt/common/bin/sysinit:system/bin/sysinit

# Workaround for NovaLauncher zipalign fails
PRODUCT_COPY_FILES += \
    vendor/ldroid/prebuilt/common/app/NovaLauncher.apk:system/app/NovaLauncher.apk

# Required packages
PRODUCT_PACKAGES += \
    Development \
    SpareParts \
    Superuser \
    su

PRODUCT_COPY_FILES += \
    external/koush/Superuser/init.superuser.rc:root/init.superuser.rc

# Added xbin files
PRODUCT_COPY_FILES += \
    vendor/ldroid/prebuilt/common/xbin/zip:system/xbin/zip \
    vendor/ldroid/prebuilt/common/xbin/zipalign:system/xbin/zipalign \

# init.d support
PRODUCT_COPY_FILES += \
    vendor/ldroid/prebuilt/common/bin/sysinit:system/bin/sysinit \
    vendor/ldroid/prebuilt/common/etc/helpers.sh:system/etc/helpers.sh \
    vendor/ldroid/prebuilt/common/etc/init.d.cfg:system/etc/init.d.cfg \
    vendor/ldroid/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/ldroid/prebuilt/common/etc/init.d/01check:system/etc/init.d/00check \
    vendor/ldroid/prebuilt/common/etc/init.d/02zipalign:system/etc/init.d/01zipalign \
    vendor/ldroid/prebuilt/common/etc/init.d/03sysctl:system/etc/init.d/02sysctl \
    vendor/ldroid/prebuilt/common/etc/init.d/04firstboot:system/etc/init.d/03firstboot \
    vendor/ldroid/prebuilt/common/etc/init.d/05freemem:system/etc/init.d/05freemem \
    vendor/ldroid/prebuilt/common/etc/init.d/06removecache:system/etc/init.d/06removecache \
    vendor/ldroid/prebuilt/common/etc/init.d/07fixperms:system/etc/init.d/07fixperms \
    vendor/ldroid/prebuilt/common/etc/init.d/09cron:system/etc/init.d/09cron \
    vendor/ldroid/prebuilt/common/etc/init.d/10sdboost:system/etc/init.d/10sdboost \
    vendor/ldroid/prebuilt/common/etc/init.d/11battery:system/etc/init.d/11battery \
    vendor/ldroid/prebuilt/common/etc/init.d/12touch:system/etc/init.d/12touch \
    vendor/ldroid/prebuilt/common/etc/init.d/13minfree:system/etc/init.d/13minfree \
    vendor/ldroid/prebuilt/common/etc/init.d/14gpurender:system/etc/init.d/14gpurender \
    vendor/ldroid/prebuilt/common/etc/init.d/15sleepers:system/etc/init.d/15sleepers \
    vendor/ldroid/prebuilt/common/etc/init.d/16journalism:system/etc/init.d/16journalism \
    vendor/ldroid/prebuilt/common/etc/init.d/17sqlite3:system/etc/init.d/17sqlite3 \
    vendor/ldroid/prebuilt/common/etc/init.d/18wifisleep:system/etc/init.d/18wifisleep \
    vendor/ldroid/prebuilt/common/etc/init.d/19iostats:system/etc/init.d/19iostats \
    vendor/ldroid/prebuilt/common/etc/init.d/20setrenice:system/etc/init.d/20setrenice \
    vendor/ldroid/prebuilt/common/etc/init.d/21tweaks:system/etc/init.d/21tweaks \
    vendor/ldroid/prebuilt/common/etc/init.d/24speedy_modified:system/etc/init.d/24speedy_modified \
    vendor/ldroid/prebuilt/common/etc/init.d/25loopy_smoothness_tweak:system/etc/init.d/25loopy_smoothness_tweak \

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
    KernelTweaker \
    Trebuchet \

# HFM Files
PRODUCT_COPY_FILES += \
    vendor/ldroid/prebuilt/etc/hosts.alt:system/etc/hosts.alt \
    vendor/ldroid/prebuilt/etc/hosts.og:system/etc/hosts.og

# Terminal Emulator
PRODUCT_COPY_FILES +=  \
    vendor/ldroid/prebuilt/Term.apk:system/app/Term.apk \
    vendor/ldroid/prebuilt/lib/libjackpal-androidterm4.so:system/lib/libjackpal-androidterm4.so

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

PRODUCT_PACKAGE_OVERLAYS += vendor/ldroid/overlay/common

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
bootanimation_sizes := $(subst .zip,, $(shell ls vendor/ldroid/prebuilt/common/bootanimation))
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
    vendor/ldroid/prebuilt/common/bootanimation/$(TARGET_BOOTANIMATION_NAME).zip:system/media/bootanimation.zip
endif



# Versioning System
PRODUCT_VERSION_MAJOR = 3
PRODUCT_VERSION_MINOR = 0
PRODUCT_VERSION_MAINTENANCE = 2
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
    ro.ldroid.buildtype=$(LDROID_BUILD_TYPE)
