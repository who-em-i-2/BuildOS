# Normal build steps
. build/envsetup.sh
lunch bliss_lavender-userdebug

# export variable here
export TZ=Asia/Kolkata
export SELINUX_IGNORE_NEVERALLOWS=true
export TARGET_BOOTANIMATION_RES=1080

build_gapps=1
export BLISS_BUILD_VARIANT=vanilla
export ARROW_GAPPS=false
export WITH_GMS=false
export WITH_GAPPS=false

exp_gapps() {
export BLISS_BUILD_VARIANT=gapps
export ARROW_GAPPS=true
export WITH_GMS=true
export WITH_GAPPS=true
}

compile_plox () {
make blissify -j16
}
