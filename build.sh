# Normal build steps
. build/envsetup.sh
lunch arrow_lavender-userdebug

build_gapps=1

# export variable here
export TZ=Asia/Kolkata
export SELINUX_IGNORE_NEVERALLOWS=true
export ARROW_GAPPS=false

exp_gapps () {
export ARROW_GAPPS=true
}

compile_plox () {
mka bacon -j17
}
