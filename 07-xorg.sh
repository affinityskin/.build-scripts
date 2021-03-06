#!/bin/bash
#
# i3 profile Setup Script
#
# Distribution: Ubuntu Server 15.10
#
# Author:	loki

echo "Installing Xorg"
sudo apt-get update
sudo apt-get install -y \
	xorg \
	xserver-xorg \
	x11-xserver-utils \
	x11-xfs-utils \
	x11-xkb-utils \
	x11-session-utils \
	x11proto-core-dev \
	mesa-common-dev \
	glew-utils
exit
