#!/bin/sh
# the first argument shell be the disk i.e. /dev/sdc
# the second shell be the language: EN / PL
# the third shell be the installation type: NORM/USB
if [ $2 = PL ] then
	loadkeys pl
	setfont Lat2-Terminus16.psfu.gz -m 8859-2
	timedatectl set-ntp true
	#partition the disk
	wipefs $1
	fdisk $1 << EOF
	g
	n
	1

	+260M
	n
	2

	+2G
	n
	3


	t
	1
	4
	t
	2
	19
	A
	1
	w
EOF
	mkfs.ext4 ${1}3
	mkswap ${1}2
	mount ${1}3 /mnt
	swapon ${1}2
	pacstrap /mnt base linux linux-firmware vim man-db
	genfstab -U /mnt >> /mnt/etc/fstab
	arch-chroot /mnt << EOF 
	ln -sf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
	hwclock --systohc
	sed -i "s/#pl_PL.UTF-8/pl_PL.UTF-8" /etc/locale.gen
	sed -i "s/#en_US.UTF-8/en_US.UTF-8" /etc/locale.gen
	locale-gen
	printf "LANG=pl_PL.UTF-8" > /etc/locale.conf
	printf "KEYMAP=pl
	FONT=Lat2-Terminus16.psfu.gz
	FONT_MAP=8859-2" > /etc/vconsole.conf
	printf "jungle" >> /etc/hostname
	printf "127.0.0.1	localhost
	::1		localhost
	127.0.1.1	jungle.localdomain	jungle
	" >> /etc/hosts
	mkinitcpio -P
	passwd
	password
	password
	pacman -S grub amd-ucode
	grub-install --target=i386-pc $1 
	grub-mkconfig -o /boot/grub/grub.cfg
	exit
EOF
else





fi

