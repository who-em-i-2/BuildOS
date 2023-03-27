# Normal build steps
. build/envsetup.sh
lunch lavender-userdebug

build_gapps=1

# export variable here
export TZ=Asia/Kolkata

export VANILLA_BUILD=false

exp_gapps() {
export VANILLA_BUILD=true
}

compile_plox () {
make reloaded -j17
}
