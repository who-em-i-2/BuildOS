# Normal build steps
. build/envsetup.sh
lunch rr_lavender-userdebug

# export variable here
export TZ=Asia/Kolkata
export SELINUX_IGNORE_NEVERALLOWS=true

build_gapps=1
export GAPPS=false

exp_gapps() {
export GAPPS=true
}

compile_plox () {
mka bacon -j17
}
