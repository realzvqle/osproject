all:
	cd kernel && xmake
	mkdir -p isodir/boot/grub
	cp kernel/os.bin isodir/boot/os.bin
	cp grub.cfg isodir/boot/grub/grub.cfg
	grub-mkrescue -o os.iso isodir
	qemu-system-i386 -m 512M -cdrom os.iso -display gtk


clean:
	rm os.iso
	cd kernel && make clean
	rm -rf isodir
