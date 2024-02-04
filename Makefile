build: sysext.raw


qemu.tar.xz:
	wget -q https://download.qemu.org/qemu-8.2.1.tar.xz -O qemu.tar.xz

qemu: qemu.tar.xz
	tar -xJf qemu.tar.xz

qemu-ga: qemu
	cd qemu-* && ./configure && make qemu-ga


sysext: qemu-ga
	mkdir -p rootfs/usr/bin
	cp -a qemu-*/build/qga/qemu-ga rootfs/usr/bin/

sysext.raw: sysext
	mksquashfs rootfs sysext.raw -all-root
