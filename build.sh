# Normal build steps
. build/envsetup.sh
lunch aosp_lavender-userdebug

build_gapps=0

# export variable here
export TZ=Asia/Kolkata
export SELINUX_IGNORE_NEVERALLOWS=true
#export BUILD_BROKEN_DUP_RULES=true
export RELAX_USES_LIBRARY_CHECK=true
#export WITH_GMS=false

#exp_gapps() {
export USE_GAPPS=true
export WITH_GMS=true
export TARGET_CORE_GMS=true
export WITH_GAPPS=true
export BLISS_BUILD_VARIANT=gapps
export TARGET_USES_MINI_GAPPS=true
export GAPPS_BUILD_TYPE=1
export BUILD_WITH_GAPPS=true
#}

compile_plox () {
mka bacon -j12
}
