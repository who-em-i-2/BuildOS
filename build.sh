# Normal build steps
. build/envsetup.sh
lunch lineage_lavender-user

build_gapps=1

# export variable here
export TZ=Asia/Kolkata
export SELINUX_IGNORE_NEVERALLOWS=true
export WITH_GMS=true

exp_gapps () {
export WITH_GMS=true
export WITH_GMS_MINIMAL=true
}

compile_plox () {
mka bacon -j12
#ls /tmp/rom/out/target/product/lav*/*2023*zip || make bacon -j8
}
