#!/usr/bin/sh

cd $HOME

sudo apt update
sudo apt install build-essential gcc-mingw-w64
sudo apt install libfontconfig1-dev libice-dev libsm-dev libxext-dev libxft-dev libxrender-dev libxss-dev libxt-dev uuid-dev x11proto-scrnsaver-dev x11proto-xext-dev libx11-dev

wget https://prdownloads.sourceforge.net/tcl/tcl8.6.12-src.tar.gz
wget https://prdownloads.sourceforge.net/tcl/tk8.6.12-src.tar.gz

tar -xf tcl8.6.12-src.tar.gz
tar -xf tk8.6.12-src.tar.gz

cd tcl8.6.12/unix
# mkdir build
# ./configure --prefix=`pwd`/build --enable-threads --enable-shared
./configure --enable-threads --enable-shared
make
make install
cd $HOME
cd tk8.6.12/unix
# ./configure --prefix=$HOME/tcl8.6.12/unix/build --enable-shared --enable-threads
./configure --enable-shared --enable-threads
make
make install


# Build for windows
cd $HOME
export Cpre=x86_64-w64-mingw32
export CC=${Cpre}-gcc
export CPP=${Cpre}-cpp
cd tcl8.6.12/win
# mkdir build
# ./configure --prefix=`pwd`/build --enable-threads --enable-shared --host=$Cpre
./configure --enable-threads --enable-shared --host=$Cpre
make
make install
cd $HOME
cd tk8.6.12/win
# ./configure --prefix=$HOME/tcl8.6.12/win/build --enable-shared --enable-threads --host=$Cpre
./configure --enable-shared --enable-threads --host=$Cpre
make
make install
