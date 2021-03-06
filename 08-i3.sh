#!/bin/bash
#
# i3 profile Setup Script
#
# Distribution: Ubuntu Server 15.10
#
# Author:	loki
source ~/.vars.sh
echo "Setting up build directory"
sleep 5
cd ${MAKEDIR}

echo "Adding i3 Keyring"
sleep 5
sudo apt-get --allow-unauthenticated install -y sur5r-keyring
sudo apt-get update
sleep 1

echo "Installing i3"
sleep 5
sudo apt-get build-dep -y \
	i3 \
	i3blocks \
	i3lock
sudo apt-get install -y
	libanyevent-i3-perl \
	libjson-xs-perl

echo "Installing i3 Gaps Deps"
sudo apt-get update
sudo apt-get install -y \
	libxcb1-dev \
	libxcb-keysyms1-dev \
	libpango1.0-dev \
	libxcb-util0-dev \
	libxcb-icccm4-dev \
	libyajl-dev \
	libstartup-notification0-dev \
	libxcb-randr0-dev \
	libev-dev \
	libxcb-cursor-dev \
	libxcb-xinerama0-dev \
	libxcb-xkb-dev \
	libxkbcommon-dev \
	libxkbcommon-x11-dev \
	libx11-dev \
	libxfixes-dev \
	libxi-dev \
	asciidoc \
	libxrandr-dev \
	libxcb1-dev \
	libxcb-util-dev \
	libxcb-util0-dev \
	libx11-xcb-dev \
	libxcb-ewmh-dev \
	libxcb-dpms0-dev

cd ${MAKEDIR}
git clone https://github.com/Airblader/i3.git
cd i3
git checkout gaps
sleep 1
git pull
sleep 1
make
sleep 1
sudo make install
sleep 1
cd ${MAKEDIR}
git clone https://github.com/Airblader/unclutter-xfixes.git
sleep 1
cd ${MAKEDIR}/unclutter-xfixes
make
sudo make install
sleep 1
cd ${MAKEDIR}
git clone https://github.com/Airblader/xedgewarp.git
sleep 1
cd ${MAKEDIR}/xedgewarp
make
sudo make install
sleep 1
cd ${MAKEDIR}
git clone https://github.com/baskerville/xtitle.git
sleep 1
cd ${MAKEDIR}/xtitle
make
sudo make install
sleep 1
echo "Installing i3 Gaps"
sleep 3
cd ${MAKEDIR}
git clone https://github.com/Airblader/i3blocks-gaps.git
sleep 1
cd ${MAKEDIR}/i3blocks-gaps
make clean debug
sleep 1
make
sudo make install
sleep 1
cd ${MAKEDIR}
git clone https://github.com/Airblader/i3status.git
sleep 1
sudo apt-get install -y \
	libconfuse-dev \
	libyajl-dev \
	libasound2-dev \
	libiw-dev \
	libcap2-bin \
	libpulse-dev
cd ${MAKEDIR}/i3status
make
sudo make install
sleep 1
cd ${MAKEDIR}
git clone https://github.com/Airblader/i3lock.git
sleep 1
cd ${MAKEDIR}/i3lock
sudo apt-get install -y \
	libpam0g-dev \
	libcairo2-dev \
	libx11-dev \
	libx11-xcb-dev
sleep 1
make
sudo make install
echo "i3 Installation Complete!!"
sleep 5
exit
