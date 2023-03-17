# Normal build steps
. build/envsetup.sh
lunch rr_lavender-userdebug

# export variable here
export TZ=Asia/Kolkata
#export SELINUX_IGNORE_NEVERALLOWS=true
#export ARROW_GAPPS=true

compile_plox () {
mka bacon -j17
}
