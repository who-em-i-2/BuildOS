#!/bin/bash

# Specify Kernel Directory
KERNEL_DIR=/tmp/kernel

# Device Name and Model
MODEL=Xiaomi
DEVICE=Lavender

# Kernel Name and Version
ZIPNAME=Nexus
VERSION=X1
CAF_TAG=LA.UM.11.2.1.r1-02600
vLINUX=4.19

# Kernel Defconfig
DEFCONFIG=lavender_defconfig


# Specify compiler - nexus, proton, azure, evagcc, aosp
COMPILER=proton


# Files
IMAGE=/tmp/kernel/out/arch/arm64/boot/Image.gz-dtb

# Verbose Build
VERBOSE=0

# Date and Time
TANGGAL=$(date +"%F%S")

# Final Zip Name
FINAL_ZIP=${ZIPNAME}-${VERSION}-${vLINUX}-${DEVICE}-${TANGGAL}.zip

# Export KBUILD_COMPILER_STRING
if [ -d /tmp/clang ]; then
export KBUILD_COMPILER_STRING=$(/tmp/clang/bin/clang --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g' -e 's/[[:space:]]*$//')
PATH="/tmp/clang/bin:$PATH"
elif [ -d /tmp/gcc64 ]; then
export KBUILD_COMPILER_STRING=$(/tmp/gcc64/bin/aarch64-elf-gcc --version | head -n 1)
PATH="/tmp/gcc64/bin/:/tmp/gcc32/bin/:/usr/bin:$PATH"
elif [ -d /tmp/aosp-clang ]; then
export KBUILD_COMPILER_STRING=$(/tmp/aosp-clang/bin/clang --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g' -e 's/[[:space:]]*$//')
PATH="/tmp/aosp-clang/bin:/tmp/gcc/bin:/tmp/gcc32/bin:${PATH}"
fi

# Export ARCH and SUBARCH
export ARCH=arm64
export SUBARCH=arm64

# Export Local Version
#export LOCALVERSION="-${VERSION}-${CAF_TAG}"

# KBUILD HOST and USER
export KBUILD_BUILD_HOST=NexGang
export KBUILD_BUILD_USER="ImPrashant"
export DISTRO=$(source /etc/os-release && echo "${NAME}")


function clone_kt() {
	git clone --depth=1 https://github.com/Prashant-1695/kernel_xiaomi_lavender-4.19 kernel -b caf
}

function clone_tc() {
	case $COMPILER in
		nexus)
		post_msg " Cloning Nexus Clang ToolChain "
		git clone --depth=1 https://gitlab.com/Project-Nexus/nexus-clang.git clang
		;;
		proton)
		post_msg " Cloning Proton Clang ToolChain "
		git clone --depth=1 https://github.com/kdrag0n/proton-clang.git clang
		;;
		azure)
		post_msg " Cloning Azure Clang ToolChain "
		git clone --depth=1 https://gitlab.com/Panchajanya1999/azure-clang.git clang
		;;
		eva)
		post_msg " Cloning Eva GCC ToolChain "
		git clone --depth=1 https://github.com/mvaisakh/gcc-arm64.git -b gcc-new gcc64
		git clone --depth=1 https://github.com/mvaisakh/gcc-arm.git -b gcc-new gcc32
		;;
		aosp)
		post_msg " Cloning Aosp Clang ToolChain "
		mkdir aosp-clang && cd aosp-clang
		down https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/refs/heads/master/clang-r475365.tar.gz
		tar -xf clang* && cd ..
		rm -rf clang*
		git clone https://github.com/LineageOS/android_prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9.git --depth=1 gcc
		git clone https://github.com/LineageOS/android_prebuilts_gcc_linux-x86_arm_arm-linux-androideabi-4.9.git  --depth=1 gcc32
		;;
	esac
}

function clone_ak3() {
	git clone --depth=1 https://github.com/reaPeR1010/AnyKernel3 AK3
}

# Telegram Bot Integration
function post_msg() {
	curl -s -X POST "https://api.telegram.org/bot$token/sendMessage" \
	-d chat_id="$chat_id" \
	-d "disable_web_page_preview=true" \
	-d "parse_mode=html" \
	-d text="$1"
}

# Upload On Telegram
function push() {
		curl -F document=@$1 "https://api.telegram.org/bot$token/sendDocument" \
		-F chat_id="$chat_id" \
		-F "disable_web_page_preview=true" \
		-F "parse_mode=html" \
		-F caption="$2"
}

function upl_zip() {
	# Copy Files To AnyKernel3
	if [ -a "$IMAGE" ]; then
	cp $IMAGE /tmp/AK3
	# Zipping
	cd /tmp/AK3 || exit 1
	zip -r9 ${FINAL_ZIP} *
	MD5CHECK=$(md5sum "$FINAL_ZIP" | cut -d' ' -f1)
	push "$FINAL_ZIP" "Build took : $(($SECONDS / 60)) minute(s) and $(($SECONDS % 60)) second(s). | For <b>$MODEL ($DEVICE)</b> | <b>${KBUILD_COMPILER_STRING}</b> | <b>MD5 Checksum : </b><code>$MD5CHECK</code>"
	fi
}

function compile() {
	make O=out CC=clang ARCH=arm64 ${DEFCONFIG}
	case $COMPILER in
	  nexus|proton|azure)
	  make -kj10 O=out \
	  ARCH=arm64 \
#	  LLVM=1 \
#	  LLVM_IAS=1 \
	  CC="ccache clang" \
	  CROSS_COMPILE=aarch64-linux-gnu- \
	  CROSS_COMPILE_ARM32=arm-linux-gnueabi- \
	  V=$VERBOSE 2>&1 | tee error.log
	  ;;
	  eva)
	  make -kj10 O=out \
	  ARCH=arm64 \
	  CROSS_COMPILE_ARM32=arm-eabi- \
	  CROSS_COMPILE=aarch64-elf- \
	  AR=llvm-ar \
	  NM=llvm-nm \
	  OBJCOPY=llvm-objcopy \
	  OBJDUMP=llvm-objdump \
	  STRIP=llvm-strip \
	  OBJSIZE=llvm-size \
	  V=$VERBOSE 2>&1 | tee error.log
	  ;;
	  aosp)
	  make -kj10 O=out \
	  ARCH=arm64 \
#	  LLVM=1 \
#	  LLVM_IAS=1 \
	  CC="ccache clang" \
	  CLANG_TRIPLE=aarch64-linux-gnu- \
	  CROSS_COMPILE=aarch64-linux-android- \
	  CROSS_COMPILE_ARM32=arm-linux-androideabi- \
	  V=$VERBOSE 2>&1 | tee error.log
	  ;;
	esac
}

function build_check() {
	# Verify Files
	if ! [ -a "$IMAGE" ];
	   then
	       push "${KERNEL_DIR}/error.log" "Build Throws Errors"
	   else
	       post_msg " Kernel Compilation Finished. Started Zipping "
	fi
}

# Compress function with pigz for faster compression
function com () {
	tar --use-compress-program="pigz -k -$2 " -cf $1.tar.gz $1
}

# install apt
function install_apt () {
	apt update && apt install -y wget pigz aria2
	down https://emy.ehteshammalik4.workers.dev/gclone_setup || down https://emy.ehteshammalik4.workers.dev/gclone_setup
	CIRRUS_REPO_OWNER=$REAL_REPO_OWNER
	chmod 0775 gclone_setup && ./gclone_setup
}

# download ccache
function down () {
SECONDS=0
time aria2c $1 -x16 -s50
}

# upload our ccache
function upload_ccache () {
SECONDS=0
gclone copy $1 whoemi:cirrus-user/${REAL_REPO_OWNER}/${vLINUX}/${DEVICE}/${ZIPNAME} -P
}

for i in $@
do
  case $i in
   kt|-kt)
   clone_kt
	 ;;
	 -tc)
	 clone_tc
	 ;;
	 -ak|-ak3)
	 clone_ak3
	 ;;
	 -c|-cmpl)
	 compile
	 ;;
	 -err|-bc)
	 build_check
	 ;;
	 upl|-upl)
	 upl_zip
	 ;;
  esac
done
