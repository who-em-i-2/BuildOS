# Normal build steps
. build/envsetup.sh
lunch aospa_lavender-userdebug

# export variable here
export TZ=Asia/Kolkata
export WITH_GMS=true
#export BUILD_BROKEN_DUP_RULES=true
#export SELINUX_IGNORE_NEVERALLOWS=true
#export BUILD_BROKEN_DUP_RULES=true
#export RELAX_USES_LIBRARY_CHECK=true
#export TARGET_BOOTANIMATION_RES=1080

#build_gapps=1
#export ARROW_GAPPS=false
#export WITH_GMS=false
#export WITH_GAPPS=false
#export USE_GAPPS=false

exp_gapps() {
export TARGET_GAPPS_ARCH=arm64
export USE_GAPPS=true
export ARROW_GAPPS=true
export WITH_GMS=true
export WITH_GAPPS=true
export BLISS_BUILD_VARIANT=gapps
}

compile_plox () {
./rom-build.sh lavender -t userdebug -s keys -j16
ls /tmp/rom/aospa*.zip || ./rom-build.sh lavender -t user -s keys -j16
ls /tmp/rom/aospa*.zip && mv -f /tmp/rom/aospa*.zip /tmp/rom/out/target/product/lavender
}
