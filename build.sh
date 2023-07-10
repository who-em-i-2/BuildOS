# Normal build steps
. build/envsetup.sh
lunch lavender-userdebug

build_gapps=0

# export variable here
export TZ=Asia/Kolkata
export SELINUX_IGNORE_NEVERALLOWS=true

compile_plox () {
m leaf -j17
}
