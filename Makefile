build: torcx.tgz torcx.squashfs


qemu.tar.xz:
	wget -q https://download.qemu.org/qemu-5.2.0.tar.xz -O qemu.tar.xz

qemu: qemu.tar.xz
	tar -xJf qemu.tar.xz

qemu-ga: qemu
	cd qemu-* && ./configure && make qemu-ga


torcx: qemu-ga
	mkdir -p rootfs/bin
	cp -a qemu-*/build/qga/qemu-ga rootfs/bin/

torcx.tgz: torcx
	tar -C rootfs -czf torcx.tgz .

torcx.squashfs: torcx
	mksquashfs rootfs torcx.squashfs
