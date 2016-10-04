#!/bin/bash

uname=`uname -a`
version='2.1.1'
[ -n "`echo $uname | grep 'Darwin'`" ] && echo 'OSX' && file='macosx.zip' && system=1
[ -z "$file" ] && echo Linux && file='linux-x86_64.tar.bz2' && system=2

wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$version-$file

[ $system -eq 1 ] && unzip phantomjs-$version-$file
[ $system -eq 2 ] && tar xf phantomjs-$version-$file

set -- "$file"
IFS="."; declare -a tmp=($*)
IFS=""
path="phantomjs-$version-${tmp[0]}"
echo $path

mv $path/bin/phantomjs .
rm -r $path phantomjs-$version-$file
