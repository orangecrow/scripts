

sudo systemctl start dhcpcd
sudo shcpcd

useradd -m adam
passwd adam
usermod -aG wheel adam

#login as adam

pacman -S sudo xorg bspwm sxhkd dmenu firefox gcc make xclip openssh base-devel

mkdir .config
mkdir .config/bspwm
mkdir .config/sxhkd
#itd do bspwm i sxhkd

git clone https://aur.archlinux.org/st.git
cd st
makepkg -sri
# potem zabawa z configiem 
echo "exec bspwm" > .xinitrc

git clone https://github.com/orangecrow/scripts
git clone https://github.com/orangecrow/dotfiles
cd scripts
sh sshkeyadd.sh
#then add key in gitub

