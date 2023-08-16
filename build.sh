# Normal build steps
. build/envsetup.sh
lunch cherish_lavender-userdebug

build_gapps=1

# export variable here
export TZ=Asia/Kolkata
export SELINUX_IGNORE_NEVERALLOWS=true
#export BUILD_BROKEN_DUP_RULES=true
export RELAX_USES_LIBRARY_CHECK=true
#export WITH_GMS=false
export CHERISH_VANILLA=true

exp_gapps() {
export USE_GAPPS=true
export WITH_GMS=true
export TARGET_CORE_GMS=true
export WITH_GAPPS=true
export BLISS_BUILD_VARIANT=gapps
export CHERISH_VANILLA=false
export TARGET_USES_MINI_GAPPS=true
export GAPPS_BUILD_TYPE=2
}

compile_plox () {
mka bacon -j10
}
