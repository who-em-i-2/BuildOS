# Normal build steps
. build/envsetup.sh
lunch arrow_lavender-userdebug

# export variable here
export TZ=Asia/Kolkata
export SELINUX_IGNORE_NEVERALLOWS=true
export BUILD_BROKEN_DUP_RULES=true
export RELAX_USES_LIBRARY_CHECK=true
#export TARGET_BOOTANIMATION_RES=1080

#build_gapps=1
export ARROW_GAPPS=true
#export WITH_GMS=false
#export WITH_GAPPS=false

exp_gapps() {
export ARROW_GAPPS=true
export WITH_GMS=true
export WITH_GAPPS=true
export BLISS_BUILD_VARIANT=gapps
}

compile_plox () {
make bacon -j16
}
