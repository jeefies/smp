#!/usr/bin/sh
# no need for root

os_type=`uname -m`

version="1.17.13"
go64="https://golang.google.cn/dl/go$version.linux-arm64.tar.gz"
go32="https://golang.google.cn/dl/go$version.linux-armv6l.tar.gz"

if [ ! -f /tmp/go.tar.gz ];then
	if [ "$os_type" = 'aarch64' ] || [ $os_type = 'arm64' ]; then
		wget $go64 -O /tmp/go.tar.gz
	else
		wget $go32 -O /tmp/go.tar.gz
	fi
	echo "get go source"
fi

if [ ! -d $HOME/.go ];then
	tar -xf /tmp/go.tar.gz -C $HOME
	mv $HOME/go $HOME/.go
	echo "decompress tar file to $HOME/.go"
fi

PATH="$HOME/.go/bin" go env -w GO111MODULE='auto'
echo "set go module to auto"
