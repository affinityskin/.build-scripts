POST-SCRIPT SETUP

Autologin
=========

vim /etc/systemd/system/getty.target.wants/getty\@tty1.service
- ExecStart=-/sbin/agetty --autologin ingo --noclear %I $TERM


NetworkManager
==============

sudo vim /etc/systemd/system/multi-user.target.wants/NetworkManager.service
- Type=simple


UDEV
====

sudo vim /etc/udev/rules.d/50-firmware.rules
- ACTION!="remove",SUBSYSTEM=="firmware",ATTR{loading}="-1"


GRUB2
=====

sudo vim /etc/default/grub
sudo update-grub

GRUB_CMDLINE_LINUX_DEFAULT
- quiet nosplash
- loglevel=3 systemd.log_level=err systemd.show_status=false
- nox2apic

GRUB_HIDDEN_TIMEOUT=1


SYSTEMD
=======

Mask:
- exim4.service
- ModemManager.service
- nfs-common.service
- rpcbind.service
- rpcbind.target
- network-online.target
- binfmt-support.service

## Suspend

1. Create /etc/systemd/system/suspend@.service with below content.
2. sudo systemctl enable suspend@ingo.service

---------------------------------------
[Unit]
Description=Suspend
Before=sleep.target

[Service]
User=%I
Type=simple
Environment=DISPLAY=:0
ExecStart=/home/ingo/.i3/i3exit lock
ExecStartPost=/usr/bin/sleep 1

[Install]
WantedBy=sleep.target
---------------------------------------

