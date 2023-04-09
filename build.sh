# Normal build steps
. build/envsetup.sh
lunch bliss_lavender-userdebug

# export variable here
export TZ=Asia/Kolkata
export SELINUX_IGNORE_NEVERALLOWS=true

build_gapps=1
export WITH_GMS=false
export WITH_GAPPS=false

exp_gapps() {
export WITH_GMS=true
export WITH_GAPPS=true
export BLISS_BUILD_VARIANT=gapps
}

compile_plox () {
make blissify -j17
}
