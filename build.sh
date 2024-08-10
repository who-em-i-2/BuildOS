# Normal build steps
. build/envsetup.sh
lunch nad_lavender-user

build_gapps=0

# export variable here
export TZ=Asia/Kolkata
export SELINUX_IGNORE_NEVERALLOWS=true

exp_gapps () {
export USE_GAPPS=false
}

compile_plox () {
make Settings -j16
goupload /tmp/rom/out/target/product/lavender/system/product/priv-app/Settings/Settings.apk
exit 1
}
