#!/bin/bash
# Ahmed Khapiip Linux - Auto Installer for Termux

echo "Updating Termux packages..."
pkg update && pkg upgrade -y
pkg install proot-distro -y

# Nadiifi wixii hore
echo "[*] Nadiifinta haraadigii hore..."
proot-distro remove ubuntu --force 2>/dev/null || true

echo "Installing Ahmed Khapiip Linux (Ubuntu Base)..."
proid-distro install ubuntu

# Kici Ubuntu si galka rootfs u diyaasmo
echo "Initializing Ubuntu environment..."
proot-distro login ubuntu -- bash -c "exit"

# Sameynta Shortcut-ka Termux oo si toos ah u wada Banner-ka iyo Midabada
echo "Abuurista shortcut-ka rasmiga ah..."
cat << 'EOF' > /data/data/com.termux/files/usr/bin/khapiip
#!/bin/bash
clear
echo -e "\e[1;32m========================================="
echo -e "   AHMED KHAPIIP LINUX - PUNTLAND DEV    "
echo -e "   (Ethical Hacking & Education)         "
echo -e "=========================================\e[0m"
echo -e "\e[1;33mWelcome back, Commander Ahmed!\e[0m"
echo -e "System Status: \e[1;32mONLINE\e[0m"
echo -e "\e[1;31mDigniin: U isticmaal qalabka si masuuliyad leh.\e[0m"
echo ""

# Tani waxay ku galineysaa Ubuntu ayadoo magaca terminal-ka kuu badaleysa
proot-distro login ubuntu --termux-home -- bash --rcfile <(echo "export PS1='\[\e[1;32m\]root@Ahmed-Khapiip\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]# '; alias update='apt update && apt upgrade -y'; alias scan='nmap'")
EOF

chmod +x /data/data/com.termux/files/usr/bin/khapiip

echo -e "\e[1;32mInstallation Finished! Hadda qor 'khapiip' si aad u bilowdo.\e[0m"
