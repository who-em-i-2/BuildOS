# Normal build steps
. build/envsetup.sh
lunch lineage_lavender-user

build_gapps=1

# export variable here
export TZ=Asia/Kolkata
export SELINUX_IGNORE_NEVERALLOWS=true

exp_gapps () {
export WITH_GMS=true
}

compile_plox () {
mka bacon -j$(nproc --all)
}
