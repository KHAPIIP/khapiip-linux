#!/bin/bash
# Ahmed Khapiip Linux - Auto Installer for Termux

echo "Updating Termux packages..."
pkg update && pkg upgrade -y
pkg install proot-distro -y

# Hubi haddii uu jiro container hore oo khaldamay, si xoog ah u tirtir si loo nadiifiyo dhabaha
proot-distro clear ubuntu --force 2>/dev/null || true

echo "Installing Ahmed Khapiip Linux (Ubuntu Base)..."
proot-distro install ubuntu

# CRITICAL STEP: Halkan ayaan u ogolaanaynaa Ubuntu inuu hal mar is-kiciyo (initialize) 
# ka dibna si toos ah uga baxaya, si uu u abuuro galka rootfs iyo faylka .bashrc.
echo "Initializing Ubuntu environment..."
proot-distro login ubuntu -- bash -c "exit"

# 1. Sameynta Shortcut-ka Termux (Amarka 'khapiip')
# Waxaan isticmaalaynaa /data/data/.../bin si uu u noqdo amar rasmi ah halkii laga isticmaali lahaa alias dhib keeni kara
echo "proot-distro login ubuntu" > /data/data/com.termux/files/usr/bin/khapiip
chmod +x /data/data/com.termux/files/usr/bin/khapiip

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

echo -e "\e[1;32mInstallation Finished! Hadda qor 'khapiip' si aad u bilowdo.\e[0m"
