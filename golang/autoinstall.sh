#!/usr/bin/sh

os_type=`uname -m`

go64='https://golang.google.cn/dl/go1.17.2.linux-arm64.tar.gz'
go32='https://golang.google.cn/dl/go1.17.2.linux-armv6l.tar.gz'

if [ ! -f /tmp/go.tar.gz ]; then
	if [ "$os_type" = 'aarch64] || [ $os_type = 'arm64' ]; then
		wget $go64 -O /tmp/go.tar.gz
	else
		wget $go32 -O /tmp/go.tar.gz
	fi
fi


