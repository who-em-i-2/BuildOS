# Normal build steps
. build/envsetup.sh
lunch lineage_lavender-ap1a-user

build_gapps=0

# export variable here
export TZ=Asia/Kolkata
#export SELINUX_IGNORE_NEVERALLOWS=true
export RELAX_USES_LIBRARY_CHECK=true
if [ $K19 == 1 ]; then
export TARGET_KERNEL_VERSION=4.19
elif [ $K19 == 0 ]; then
export TARGET_KERNEL_VERSION=4.4
fi

exp_gapps () {
export USE_GAPPS=false
}

compile_plox () {
make bacon -j16
}
