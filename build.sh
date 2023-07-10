# Normal build steps
. build/envsetup.sh
lunch legion_lavender-userdebug

build_gapps=1

# export variable here
export TZ=Asia/Kolkata
export SELINUX_IGNORE_NEVERALLOWS=true
export LEGION_GAPPS=false

exp_gapps() {
export LEGION_GAPPS=true
}

compile_plox () {
m bacon -j17
}
