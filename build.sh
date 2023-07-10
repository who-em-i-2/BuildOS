# Normal build steps
. build/envsetup.sh
lunch havoc_lavender-userdebug

build_gapps=0

# export variable here
export TZ=Asia/Kolkata
export SELINUX_IGNORE_NEVERALLOWS=true
export WITH_GMS=true

exp_gapps () {
export WITH_GMS=false
}

compile_plox () {
m bacon -j17
#ls /tmp/rom/out/target/product/lav*/*2023*zip || make bacon -j8
}
