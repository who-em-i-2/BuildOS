# Normal build steps
. build/envsetup.sh
lunch lineage_lavender-userdebug

build_gapps=0

# export variable here
export TZ=Asia/Kolkata
export SELINUX_IGNORE_NEVERALLOWS=true
export PRODUCT_DEFAULT_DEV_CERTIFICATE=vendor/lineage-priv/keys/releasekey

exp_gapps () {
export USE_GAPPS=false
}

compile_plox () {
make bacon -j16
}
