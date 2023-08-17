# Normal build steps
cd vendor/proton; curl https://github.com/xenxynon/vendor_proton/commit/8709619bb3e097775e2d3a337d0b3c56ff704101.patch | git am
cd /tmp/rom
. build/envsetup.sh
lunch aosp_Spacewar-user

# export variable here
export TZ=Asia/Kolkata
#export BUILD_BROKEN_DUP_RULES=true
export RELAX_USES_LIBRARY_CHECK=true
export WITH_GAPPS=true

compile_plox () {
m otapackage -j12
}
