#!/bin/sh

declare -a pkgList=( \
libmp4v2 \
faac \
faad2 \
libfdk-aac \
gsm \
libass \
libavc1394 \
libdc1394 \
opencore-amr \
opus \
rtmpdump \
schroedinger \
speex \
vo-aacenc \
vo-amrwbenc \
x264 \
x265 \
zvbi \
)


TMP=/tmp/ffmpeg-dep
LOG=/tmp/ffmpeg-dep/log
GREEN='\e[32m'
RED='\e[31m'
RESET='\e[0m'

install(){

    mkdir -p $TMP $LOG

    for(( i=0; i<${#pkgList[@]}; i++ ))
    do
	pkgName=${pkgList[$i]}
        cd $pkgName
	echo -n "Install $pkgName ..."
	OUTPUT=$TMP sh $pkgName.SlackBuild 2>&1 | tee $LOG/$pkgName.log >& /dev/null
	cd - >& /dev/null
        installpkg $TMP/$pkgName*.tgz >& /dev/null

	if [ $? -eq 0 ]; then
	    echo -e " ${GREEN}Succeed${RESET}"
	else
	    echo -e " ${RED}Failed${RESET}"
	fi

	sleep 1 
    done
}



remove(){

    for(( i=0; i<${#pkgList[@]}; i++ ))
    do
	echo -n "Remove ${pkgList[$i]} ..."
	ls /var/adm/packages | grep ${pkgList[$i]}- | xargs removepkg >& /dev/null

	if [ $? -eq 0 ]; then
	    echo -e " ${GREEN}Succeed${RESET}"
	else
	    echo -e " ${RED}Failed${RESET}"
	fi

	sleep 1
    done

    rm -r $TMP
}



case "$1" in
'install')
    install
    ;;
'remove')
    remove
    ;;
esac

