#!/bin/sh

declare -a FileList=( \
perl-Test-Inter \
perl-Test-Pod \
perl-Devel-Symdump \
perl-Pod-Coverage \
perl-Test-Pod-Coverage \
perl-yaml \
perl-YAML-Syck \
perl-net-http \
perl-www-robotrules \
perl-http-date \
perl-file-listing \
perl-IO-HTML \
perl-encode-locale \
perl-lwp-mediatypes \
perl-html-tagset \
perl-html-parser \
perl-http-message \
perl-http-negotiate \
perl-http-cookies \
perl-http-daemon \
libwww-perl \
perl-Date-Manip \
perl-Time-modules \
perl-Astro-SunTime \
perl-Device-SerialPort \
perl-X10 \
perl-Capture-Tiny \
perl-Email-Date-Format \
perl-MIME-Lite \
perl-Sys-Mmap \
perl-Mozilla-CA \
Net-SSLeay \
perl-Net-LibIDN \
perl-IO-Socket-SSL \
perl-LWP-Protocol-https \
)

TMP=/tmp/zm
PKG=/tmp/zm/build

mkdir -p $PKG

for(( i=0; i<${#FileList[@]}; i++ ))
do
   pkgName=${FileList[$i]}
   tar x -f $pkgName.tar.gz -C $PKG
   cd $PKG/$pkgName
   OUTPUT=$TMP sh $pkgName.SlackBuild 2>&1 | tee $TMP/$pkgName.log
   cd -
   installpkg $TMP/$pkgName*.tgz
   sleep 1
done

