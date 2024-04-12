#!/bin/bash

set -e

./create_splash.sh
cd image_root
lb clean
lb config \
	--apt apt \
	--apt-recommends false \
	--tasksel none \
	--apt-indices false \
	--distribution bookworm \
	--memtest none \
	--mirror-binary http://mirror.yandex.ru/debian/ \
	--mirror-bootstrap http://mirror.yandex.ru/debian/ \
	--architectures amd64 \
	--mirror-chroot http://mirror.yandex.ru/debian/ \
	--linux-flavours "amd64" \
	--debian-installer false \
	--firmware-binary true \
	--system live \
	--compression xz \
	--bootappend-live "boot=live components username=urbackup" \
	--iso-application "UrBackup Restore" \
	--iso-preparer="Martin Raiber <martin@urbackup.org>" \
	--iso-publisher="Martin Raiber <martin@urbackup.org>" \
	--zsync false \
	--iso-volume "UrBackup Restore" \
	--archive-areas "main contrib non-free non-free-firmware" \
	--parent-archive-areas "main contrib non-free non-free-firmware" \
	--parent-distribution bookworm \
	--initsystem systemd \
	--firmware-chroot true \
	--security false
lb build
