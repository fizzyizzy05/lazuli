#!/bin/bash

set -uexo pipefail

# Install niri & assorted twm tools
pacman -S --noconfirm \
  niri \
  cliphist \
  wl-clipboard \
  foot 

# Enable chaotic AUR
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
  
sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

tee -a /etc/pacman.conf <<EOL
[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist
EOL

pacman -Syu --noconfirm

# Install DMS
pacman -S --noconfirm \
  dms-shell-git

# Install some DMS stuff
pacman -S --noconfirm \
  matugen \
  cava \
  kimageformats

# Enable DMS to run under niti
systemctl --user add-wants niri.service dms
