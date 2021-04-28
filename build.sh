#!/bin/sh

# This script assembles the PathOS bootloader, kernel and programs
# (If you need to blank the floppy image: 'mkdosfs image/PathOS.flp')
# GNU GENERAL PUBLIC LICENSE


if test "`whoami`" != "root" ; then
	echo "You must be logged in as root to build (for loopback mounting)"
	echo "Enter 'su' or 'sudo bash' to switch to root"
	exit
fi


if [ ! -e image/PathOS.flp ]
then
	echo ">>> Creating new PathOS floppy image..."
	mkdosfs -C image/PathOS.flp 1440 || exit
fi


echo ">>> Assembling bootloader..."

nasm -O0 -w+orphan-labels -f bin -o src/boot/boot.bin src/boot/bootload.asm || exit


echo ">>> Assembling PathOS kernel..."

cd src
nasm -O0 -w+orphan-labels -f bin -o kernel.bin kernel.asm || exit
cd ..

cd clib
nasm -f elf -o ../mlib.a mlib.asm || exit
cp ../mlib.a ../src/mlib.a
cd ..

echo ">>> Assembling programs..."

cd programs

for i in *.asm
do
	nasm -O0 -w+orphan-labels -f bin $i -o `basename $i .asm`.bin || exit
done

cd ..


echo ">>> Adding bootloader to floppy image..."

dd status=noxfer conv=notrunc if=src/boot/boot.bin of=image/PathOS.flp || exit


echo ">>> Copying PathOS kernel and programs..."

rm -rf tmp-loop

mkdir tmp-loop && mount -o loop -t vfat image/PathOS.flp tmp-loop && cp src/kernel.bin tmp-loop/

cp programs/*.bin programs/*.bas programs/sample.pcx tmp-loop

sleep 0.2

echo ">>> Unmounting loopback floppy..."

umount tmp-loop || exit

rm -rf tmp-loop


echo ">>> Creating CD-ROM ISO image..."

rm -f image/PathOS.iso
genisoimage -quiet -V 'PathOS' -input-charset iso8859-1 -o image/PathOS.iso -b PathOS.flp image/ || exit
mkisofs -quiet -V 'PathOS' -input-charset iso8859-1 -o image/PathOS.iso -b PathOS.flp image/ || exit

echo '>>> Done!'

