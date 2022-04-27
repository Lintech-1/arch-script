#!/bin/bash
# LOG version 1.5.1
# author: Keper#6769
# YouTube: https://www.youtube.com/c/Lintech8
# Codeberg: https://codeberg.org/Lintech
# github: https://github.com/Lintech-1/arch-script/
#--------------------------------------------------------------------------------------
# - Добавлен пакет xdg-desktop-portal для pipewire
# - Добавлена fix для pipewire в виде команды 
# - Добавлены пакеты libpulse lib32-libpulse для pipewire
# - 
#--------------------------------------------------------------------------------------
echo "Version 1.5.1
░██████╗███████╗████████╗██╗░░░██╗██████╗░
██╔════╝██╔════╝╚══██╔══╝██║░░░██║██╔══██╗
╚█████╗░█████╗░░░░░██║░░░██║░░░██║██████╔╝
░╚═══██╗██╔══╝░░░░░██║░░░██║░░░██║██╔═══╝░
██████╔╝███████╗░░░██║░░░╚██████╔╝██║░░░░░
╚═════╝░╚══════╝░░░╚═╝░░░░╚═════╝░╚═╝░░░░░
"

echo "update key"
sleep 3
sudo pacman -Sy archlinux-keyring

echo "install update"
sleep 3 
sudo pacman -Syu

echo "вы хотите установить консольный редактор nano?
1 - Yes
Если нет, то установится vim
2 - no"
echo -n "введите цифру: "
read VAR
if [[ "$VAR" == 1 ]]; then
  sudo pacman -S nano

elif [[ "$VAR" == 2 ]]; then
   sudo pacman -S vim
  
fi

echo "miltulib"
sleep 3
sudo sed '95,96s/^#//' -i /etc/pacman.conf

echo "install soft"
sleep 3
sudo pacman -Sy discord m4 git wget curl flameshot zsh mpv telegram-desktop pavucontrol chromium neofetch python-gobject noto-fonts-cjk noto-fonts-emoji ttf-joypixels libmtp fuse3 mtpfs gvfs-mtp gpm

echo "вы хотите установить pipewire?
1 - Yes
Если нет, то установится pulseaudio
2 - no"
echo -n "введите цифру: "
read VAR
if [[ "$VAR" == 1 ]]; then
  sudo pacman -S pipewire pipewire-alsa pipewire-jack lib32-pipewire lib32-pipewire-jack libpulse lib32-libpulse xdg-desktop-portal
  systemctl --user enable pipewire
elif [[ "$VAR" == 2 ]]; then
  sudo pacman -S pulseaudio pulseaudio-alsa alsa-utils
  pulseaudio -D
fi

echo "вы хотите установить yay?
1 - Yes
Если нет, то установится pikaur
2 - no"
echo -n "введите цифру: "
read VAR
if [[ "$VAR" == 1 ]]; then
  mkdir file
  cd file
  sudo pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin
  makepkg -si

elif [[ "$VAR" == 2 ]]; then
  mkdir file
  cd file
  sudo pacman -S --needed base-devel git
  git clone https://aur.archlinux.org/pikaur.git
  cd pikaur
  makepkg -fsri
fi

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