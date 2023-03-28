# Normal build steps
. build/envsetup.sh
lunch lavender-userdebug

build_gapps=1

# export variable here
export TZ=Asia/Kolkata

export VANILLA_BUILD=false

exp_gapps() {
export VANILLA_BUILD=true
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
}

compile_plox () {
make reloaded -j17
}
