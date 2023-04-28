# Normal build steps
. build/envsetup.sh
lunch xdroid_lavender-user

# export variable here
export TZ=Asia/Kolkata
#export ARROW_GAPPS=true

compile_plox () {
make xd -j17
}
