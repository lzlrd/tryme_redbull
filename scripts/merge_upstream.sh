printmerge()
{
	echo "Merging \"$@\"..."
}


if [[ -z $BASETAG ]]; then
	echo "Please set the tag to merge of this kernel's base via BASETAG env variable."
fi

# Base Kernel

dir="."
printmerge $dir
git fetch -n https://android.googlesource.com/kernel/msm "$BASETAG"
git merge --signoff FETCH_HEAD

# Core Kernel Modules

dir="arch/arm64/boot/dts/vendor"
printmerge $dir
git fetch -n https://android.googlesource.com/kernel/msm-extra/devicetree "$BASETAG"
git subtree merge -P $dir FETCH_HEAD

dir="arch/arm64/boot/dts/vendor/qcom/camera"
printmerge $dir
git fetch -n https://android.googlesource.com/kernel/msm-extra/camera-devicetree "$BASETAG"
git subtree merge -P $dir FETCH_HEAD

dir="arch/arm64/boot/dts/vendor/qcom/display"
printmerge $dir
git fetch -n https://android.googlesource.com/kernel/msm-extra/display-devicetree "$BASETAG"
git subtree merge -P $dir FETCH_HEAD

dir="drivers/input/touchscreen/stm"
printmerge $dir
git fetch -n https://android.googlesource.com/kernel/msm-modules/fts_touch "$BASETAG"
git subtree merge -P $dir FETCH_HEAD

dir="drivers/input/touchscreen/sec_ts"
printmerge $dir
git fetch -n https://android.googlesource.com/kernel/msm-modules/sec_touch "$BASETAG"
git subtree merge -P $dir FETCH_HEAD

dir="drivers/staging/qcacld-3.0"
printmerge $dir
git fetch -n https://android.googlesource.com/kernel/msm-modules/qcacld/ "$BASETAG"
git subtree merge -P $dir FETCH_HEAD

dir="drivers/staging/qca-wifi-host-cmn"
printmerge $dir
git fetch -n https://android.googlesource.com/kernel/msm-modules/qca-wfi-host-cmn/ "$BASETAG"
git subtree merge -P $dir FETCH_HEAD

dir="drivers/staging/fw-api"
printmerge $dir
git fetch -n https://android.googlesource.com/kernel/msm-modules/wlan-fw-api/ "$BASETAG"
git subtree merge -P $dir FETCH_HEAD

dir="techpack/audio"
printmerge $dir
git fetch -n https://android.googlesource.com/kernel/msm-extra "$BASETAG"
git subtree merge -P $dir FETCH_HEAD

dir="techpack/camera"
printmerge $dir
git fetch -n https://android.googlesource.com/kernel/msm-extra/camera-kernel "$BASETAG"
git subtree merge -P $dir FETCH_HEAD

dir="techpack/display"
printmerge $dir
git fetch -n https://android.googlesource.com/kernel/msm-extra/display-drivers "$BASETAG"
git subtree merge -P $dir FETCH_HEAD

dir="techpack/video"
printmerge $dir
git fetch -n https://android.googlesource.com/kernel/msm-extra/video-driver "$BASETAG"
git subtree merge -P $dir FETCH_HEAD

# External Kernel Modules

dir="fs/exfat"
printmerge $dir
git fetch -n https://github.com/arter97/exfat-linux master
git subtree merge -P $dir FETCH_HEAD

dir="scripts/ufdt/libufdt"
printmerge $dir
git fetch -n https://android.googlesource.com/platform/system/libufdt master
git subtree merge -P $dir FETCH_HEAD
