# Normal build steps
. build/envsetup.sh
lunch p404_lavender-userdebug

# export variable here
export TZ=Asia/Kolkata
export SELINUX_IGNORE_NEVERALLOWS=true
export WITH_GAPPS=true

compile_plox () {
make bacon -j$(nproc --all)
}
