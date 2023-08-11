# Normal build steps
. build/envsetup.sh
lunch nad_lavender-user

# export variable here
export TZ=Asia/Kolkata
export SELINUX_IGNORE_NEVERALLOWS=true
export USE_GAPPS=true
export RELAX_USES_LIBRARY_CHECK=true
export SKIP_ABI_CHECKS=true
export BUILD_BROKEN_VERIFY_USES_LIBRARIES=true
export RELAX_USES_LIBRARY_CHECK=true

build_gapps=0

exp_gapps () {
export USE_GAPPS=false
}

compile_plox () {
make nad -j17
}
