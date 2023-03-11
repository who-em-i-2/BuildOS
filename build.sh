# Normal build steps
. build/envsetup.sh
lunch cherish_lavender-userdebug

# 0 = Vanilla or Gapps
# 1 = Vanilla and Gapps
build_gapps=1

# export variable here
export TZ=Asia/Kolkata
export SELINUX_IGNORE_NEVERALLOWS=true
export CHERISH_VANILLA=true

exp_gapps() {
export TARGET_USES_MINI_GAPPS=true
}

compile_plox () {
mka bacon -j10
}
