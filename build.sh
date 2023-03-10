# Normal build steps
. build/envsetup.sh
lunch superior_lavender-userdebug

# 0 = Vanilla or Gapps
# 1 = Vanilla and Gapps
build_gapps=1

# export variable here
export TZ=Asia/Kolkata
export SELINUX_IGNORE_NEVERALLOWS=true

exp_gapps() {
export BUILD_WITH_GAPPS=true
}

compile_plox () {
m bacon -j10
}
