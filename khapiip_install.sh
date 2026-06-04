#!/bin/bash
# Ahmed Khapiip Linux - Auto Installer for Termux

echo "Updating Termux packages..."
pkg update && pkg upgrade -y
pkg install proot-distro -y

# Nadiifi wixii hore
echo "[*] Nadiifinta haraadigii hore..."
proot-distro remove ubuntu --force 2>/dev/null || true

echo "Installing Ahmed Khapiip Linux (Ubuntu Base)..."
proot-distro install ubuntu

# Kici Ubuntu si galka rootfs u diyaasmo
echo "Initializing Ubuntu environment..."
proot-distro login ubuntu -- bash -c "exit"

# 1. Sameynta Shortcut-ka Termux
echo "proot-distro login ubuntu" > /data/data/com.termux/files/usr/bin/khapiip
chmod +x /data/data/com.termux/files/usr/bin/khapiip

# 2. Toos ugu qorista Banner-ka iyo Settings-ka gudaha Ubuntu
UBUNTU_ROOT="/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/root"
UBUNTU_BASHRC="$UBUNTU_ROOT/.bashrc"

# CLIMAX FIX: Halkan haddii galku jiro faylkuna maqan yahay, force-fully ayaan u abuureynaa
mkdir -p $UBUNTU_ROOT
touch $UBUNTU_BASHRC

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
