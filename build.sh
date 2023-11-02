# Normal build steps
. build/envsetup.sh
lunch lineage_lavender-userdebug

# export variable here
export TZ=Asia/Kolkata
export SELINUX_IGNORE_NEVERALLOWS=true

build_gapps=1
export GAPPS=true


exp_gapps() {
export GAPPS=false
}

compile_plox () {
mka bacon -j$(nproc --all)
}
