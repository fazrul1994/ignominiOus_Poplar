	#!/bin/bash
	clear
	BUILD_START=$(date +"%s")
	
	neofetch
	echo Reload Compiler | lolcat
	echo by fazrul Not Dev.... | lolcat
	toilet Are you Ready...???? | lolcat
	
	time make clean mrproper O=out
	
	
	export ARCH=arm64
    export SUBARCH=arm64
    export HEADER_ARCH=arm64
    export KBUILD_BUILD_USER=Fazrul
    export KBUILD_BUILD_HOST=NotMastah
    export PATH="/usr/lib/ccache:$PATH"
    export USE_CCACHE=1
    export CROSS_COMPILE="ccache aarch64-linux-gnu-"
    export CROSS_COMPILE_ARM32="ccache arm-linux-gnueabi-"
    export CLANG_PATH=/root/braindrill
    
    time make ignominiOus-RR_defconfig O=out
    time make menuconfig O=out
    
    figlet tinggal tunggu sambil ngopi | lolcat

time make -j8 \
 O=out \
 CC="ccache ${CLANG_PATH}/bin/clang" \
 CXX="${CLANG_PATH}/bin/clang++" \
 CLANG_TRIPLE=aarch64-linux-gnu- \
 CROSS_COMPILE="${CLANG_PATH}/bin/" \
 CROSS_COMPILE_ARM32="${CLANG_PATH}/bin/arm-linux-gnueabi-" O=out 2>&1 | tee /sdcard/log.txt
 
 echo -e ""
depmod -a -E out/Module.symvers -b modules $(cat out/include/config/kernel.release)

BUILD_END=$(date +"%s")
DIFF=$(($BUILD_END - $BUILD_START))

echo -e ""
figlet ignominiOus kernel compile done | lolcat
echo -e ""
echo -e "\033[0;32mBuild completed in $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds."
	
