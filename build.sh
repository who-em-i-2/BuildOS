# Normal build steps
. build/envsetup.sh
lunch aospa_lavender-user

build_gapps=0

# export variable here
export TZ=Asia/Kolkata
#export SELINUX_IGNORE_NEVERALLOWS=true
export USE_GAPPS=false

exp_gapps() {
export USE_GAPPS=true
}

compile_plox () {
#ls /tmp/rom/out/target/product/lavender/boot.img || make bootimage -j12
./rom-build.sh lavender -t user -s keys -j16
ls /tmp/rom/aospa*.zip && mv -f /tmp/rom/aospa*.zip /tmp/rom/out/target/product/lavender
}
