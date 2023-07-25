# Normal build steps
. build/envsetup.sh
lunch evolution_lavender-userdebug

build_gapps=0

# export variable here
export TZ=Asia/Kolkata
export SELINUX_IGNORE_NEVERALLOWS=true
#export BUILD_BROKEN_DUP_RULES=true
export RELAX_USES_LIBRARY_CHECK=true
export WITH_GMS=true

exp_gapps() {
export TARGET_GAPPS_ARCH=arm64
export USE_GAPPS=true
export ARROW_GAPPS=true
export WITH_GMS=true
export WITH_GAPPS=true
export BLISS_BUILD_VARIANT=gapps
}

compile_plox () {
mka evolution -j17
mv out/target/product/lavender/*lavender-ota*.zip out/target/product/lavender/evolution_lavender.zip
}
