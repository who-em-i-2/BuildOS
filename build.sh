# Normal build steps
. build/envsetup.sh
lunch lineage_lavender-userdebug

# export variable here
export TZ=Asia/Kolkata
export SELINUX_IGNORE_NEVERALLOWS=true

build_gapps=0
export GAPPS=false


exp_gapps() {
export GAPPS=true
}

compile_plox () {
mka bacon -j$(nproc --all)
}
