#!/bin/bash
# LOG version 1.4.8
# author: Keper#6769
# YouTube - https://www.youtube.com/c/Lintech8
#--------------------------------------------------------------------------------------
# - Добавленные пакеты gpm
# - Добавлен выбор установки zsh
#--------------------------------------------------------------------------------------
echo "Version 1.4.8
██╗░░░░░██╗███╗░░██╗████████╗███████╗░█████╗░██╗░░██╗
██║░░░░░██║████╗░██║╚══██╔══╝██╔════╝██╔══██╗██║░░██║
██║░░░░░██║██╔██╗██║░░░██║░░░█████╗░░██║░░╚═╝███████║
██║░░░░░██║██║╚████║░░░██║░░░██╔══╝░░██║░░██╗██╔══██║
███████╗██║██║░╚███║░░░██║░░░███████╗╚█████╔╝██║░░██║
╚══════╝╚═╝╚═╝░░╚══╝░░░╚═╝░░░╚══════╝░╚════╝░╚═╝░░╚═╝
"

echo "update key"
sudo pacman -Sy archlinux-keyring

echo "install update" 
sudo pacman -Syu nano

echo "miltulib"
sudo nano /etc/pacman.conf

echo "install soft"
sudo pacman -Sy discord m4 git wget curl flameshot zsh mpv telegram-desktop pavucontrol chromium neofetch python-gobject noto-fonts-cjk noto-fonts-emoji ttf-joypixels libmtp fuse3 mtpfs gvfs-mtp gpm

echo "вы хотите установить pipewire?
1 - Yes
Если нет, то установится pulseaudio
2 - no"
echo -n "введите цифру: "
read VAR
if [[ "$VAR" == 1 ]]; then
  sudo pacman -S pipewire pipewire-alsa pipewire-jack lib32-pipewire lib32-pipewire-jack
elif [[ "$VAR" == 2 ]]; then
  sudo pacman -S pulseaudio pulseaudio-alsa alsa-utils
  pulseaudio -D
fi

echo "install yay"
mkdir file
cd file
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

echo "вы хотите установить zsh и ol my zsh?
1 - Yes
Если нет, то не будет установлен
2 - no"
echo -n "введите цифру: "
read VAR
if [[ "$VAR" == 1 ]]; then
  curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
  chsh -s /bin/zsh

fi

echo "вы хотите установить графический pamac (pacman)?
1 - Yes
Если нет, то не будет установлен
2 - no"
echo -n "введите цифру: "
read VAR
if [[ "$VAR" == 1 ]]; then
  yay -S pamac-aur archlinux-appstream-data

fi