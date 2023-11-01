# Normal build steps
. build/envsetup.sh
lunch nad_lavender-user

build_gapps=1

# export variable here
export TZ=Asia/Kolkata
export SELINUX_IGNORE_NEVERALLOWS=true
export USE_GAPPS=true

exp_gapps () {
export USE_GAPPS=false
}

compile_plox () {
make nad -j$(nproc --all)
}
