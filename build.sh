# Normal build steps
. build/envsetup.sh
lunch reloaded_lavender-userdebug

build_gapps=0

# export variable here
export TZ=Asia/Kolkata
export SELINUX_IGNORE_NEVERALLOWS=true

exp_gapps () {
export USE_GAPPS=false
}

compile_plox () {
make reloaded -j16
}
