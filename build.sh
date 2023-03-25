# Normal build steps
. build/envsetup.sh
lunch lavender-userdebug

build_gapps=1

# export variable here
export TZ=Asia/Kolkata

export VANILLA_BUILD=true

exp_gapps() {
export VANILLA_BUILD=false
}

compile_plox () {
make reloaded -j17
}
