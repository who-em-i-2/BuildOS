# Normal build steps
. build/envsetup.sh
lunch lavender-userdebug

# export variable here
export TZ=Asia/Kolkata

compile_plox () {
make reloaded -j17
}
