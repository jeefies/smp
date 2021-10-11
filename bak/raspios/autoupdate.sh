#!/usr/bin/sh

os_type=`uname -m`

sources_file="/etc/apt/sources.list"
sources_dir="$sources_file.d/"

if [ "$os_type" = 'aarch64' ] || [ $os_type = 'arm64' ]; then
	echo "a 64"
	sudo cp sources.list.64 $sources_file
else
	echo "a 32"
	sudo cp sources.list $sources_file
fi

sudo cp raspi.list $sources_dir

sudo apt update

read -p 'Are you willing to upgrade all softwares? [Y\n]:' ans

if [ "$ans" = 'y' ] || [ $ans = 'Y' ]; then
	sudo apt full-upgrade
	sudo apt autoremove -y
fi
