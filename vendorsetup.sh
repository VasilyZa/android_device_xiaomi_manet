#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2021-2025 The OrangeFox Recovery Project
#
FDEVICE="manet"

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w \"$FDEVICE\")
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w \"$FDEVICE\")
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
    # Register lunch combo for OrangeFox 14.1
    add_lunch_combo twrp_manet-ap2a-eng
    add_lunch_combo twrp_manet-ap2a-userdebug

    # A/B + Virtual A/B (MIUI HyperOS)
    export FOX_AB_DEVICE=1
    export FOX_VIRTUAL_AB_DEVICE=1

    export LC_ALL="C"
    export FOX_USE_BASH_SHELL=1
    export FOX_ASH_IS_BASH=1
    export FOX_USE_TAR_BINARY=1
    export FOX_USE_SED_BINARY=1
    export FOX_USE_XZ_UTILS=1
    export FOX_USE_LZ4_BINARY=1
    export FOX_USE_ZSTD_BINARY=1
    export FOX_DELETE_AROMAFM=1
    export FOX_USE_DATE_BINARY=1

    # GKI prebuilt kernel
    export OF_FORCE_PREBUILT_KERNEL=1

    # Keymaster 4.1 for SD8Gen3
    export OF_DEFAULT_KEYMASTER_VERSION=4.1

    # MIUI device
    export OF_PATCH_AVB20=1

    # Maintainer
    export OF_MAINTAINER="XiaoBai"
    export FOX_VARIANT="Unified"

    [ "$FOX_BUILD_TYPE" = "Stable" ] && export OF_ADVANCED_SECURITY=1;
else
    if [ -z "$FOX_BUILD_DEVICE" -a -z "$BASH_SOURCE" ]; then
        echo "I: This script requires bash. Not processing the $FDEVICE $(basename $0)"
    fi
fi
