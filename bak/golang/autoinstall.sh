#!/usr/bin/sh

os_type=`uname -m`

<<<<<<< HEAD
go64='https://golang.google.cn/dl/go1.17.2.linux-arm64.tar.gz'
go32='https://golang.google.cn/dl/go1.17.2.linux-armv6l.tar.gz'

if [ ! -f /tmp/go.tar.gz ]; then
	if [ "$os_type" = 'aarch64] || [ $os_type = 'arm64' ]; then
		wget $go64 -O /tmp/go.tar.gz
	else
		wget $go32 -O /tmp/go.tar.gz
	fi
fi


=======
version="1.17.2"
go64="https://golang.google.cn/dl/go$version.linux-arm64.tar.gz"
go32="https://golang.google.cn/dl/go$version.linux-armv6l.tar.gz"

if [ ! -f /tmp/go.tar.gz ];then
	if [ "$os_type" = 'aarch64' ] || [ $os_type = 'arm64' ]; then
		sudo wget $go64 -O /tmp/go.tar.gz
	else
		sudo wget $go32 -O /tmp/go.tar.gz
	fi
	echo "get go source"
fi

if [ ! -d $HOME/.go ];then
	tar -xf /tmp/go.tar.gz -C $HOME
	mv $HOME/go $HOME/.go
	echo "decompress tar file to $HOME/.go"
fi

if [ $GOROOT =  '' ]; then
	echo 'export GOROOT="$HOME/.go"' >> $HOME/.bashrc
	echo 'export PATH="$PATH:$GOROOT/bin"' >> $HOME/.bashrc
	echo 'export PATH into users bashrc'
fi

if [ -x go ]; then
	go env -w GO111MODULE='auto'
	echo "set go module to auto"
fi
>>>>>>> fec23cc76085c41ad98d1cafeb819a2ea924268b
