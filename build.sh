# Normal build steps
. build/envsetup.sh
lunch lavender-userdebug

build_gapps=0

# export variable here
export TZ=Asia/Kolkata
export SELINUX_IGNORE_NEVERALLOWS=true
export PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS=false

compile_plox () {
m leaf -j17
}
