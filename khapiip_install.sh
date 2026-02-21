#!/bin/bash
# Ahmed Khapiip Linux - Auto Installer for Termux

echo "Updating Termux packages..."
pkg update && pkg upgrade -y
pkg install proot-distro -y

echo "Installing Ahmed Khapiip Linux (Ubuntu Base)..."
proot-distro install ubuntu

# 1. Sameynta Shortcut-ka Termux (Amarka 'khapiip')
echo "alias khapiip='proot-distro login ubuntu'" >> ~/.bashrc

# 2. Toos ugu qorista Banner-ka iyo Settings-ka gudaha Ubuntu
UBUNTU_BASHRC="/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/root/.bashrc"

cat << 'EOF' > $UBUNTU_BASHRC
# --- AHMED KHAPIIP LINUX CONFIGURATION ---
export PS1='\[\e[1;32m\]root@Ahmed-Khapiip\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]# '
alias ls='ls --color=auto'
alias ll='ls -alF'
alias update='apt update && apt upgrade -y'
alias scan='nmap'

clear
echo -e "\e[1;36m=========================================\e[0m"
echo -e "   AHMED KHAPIIP LINUX - PUNTLAND DEV    "
echo -e "   (Ethical Hacking & Education)         "
echo -e "\e[1;36m=========================================\e[0m"
echo -e "\e[1;33mWelcome back, Commander Ahmed!\e[0m"
echo -e "System Status: \e[1;32mONLINE\e[0m"
echo -e "\e[1;31mDigniin: U isticmaal qalabka si masuuliyad leh.\e[0m"
echo ""
EOF

source ~/.bashrc
echo -e "\e[1;32mInstallation Finished! Hadda qor 'khapiip' si aad u bilowdo.\e[0m"

