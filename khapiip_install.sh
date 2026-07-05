#!/bin/bash
# Khapiip Security Distro - Kali-Style Environment for Termux

echo -e "\e[1;34m[*] Cusboonaysiinta Termux iyo rakibidda Proot-Distro...\e[0m"
pkg update && pkg upgrade -y
pkg install proot-distro git curl wget -y

# Nadiifinta wixii hore
echo -e "\e[1;33m[*] Nadiifinta haraadigii hore ee deegaanka...\e[0m"
proot-distro remove ubuntu --force 2>/dev/null || true

echo -e "\e[1;32m[*] Rakibidda nidaamka hoose ee Ubuntu...\e[0m"
proot-distro install ubuntu

# Kici Ubuntu si galka rootfs u diyaasmo
proot-distro login ubuntu -- bash -c "exit"

# 1. Sameynta Shortcut-ka Termux
echo -e "\e[1;34m[*] Qorista Shortcut-ka rasmiga ah ee 'khapiip'...\e[0m"
cat << 'EOF' > /data/data/com.termux/files/usr/bin/khapiip
#!/bin/bash
clear
echo -e "\e[1;31m##################################################"
echo -e "#                                                #"
echo -e "#         KHAPIIP SECURITY DISTRO v2.0          #"
echo -e "#             (PUNTLAND CYBER LAB)               #"
echo -e "#                                                #"
echo -e "##################################################\e[0m"
echo -e "System Status: \e[1;32mONLINE\e[0m | Environment: \e[1;34mKali-Style\e[0m"
echo -e "Amarrada gaarka ah: \e[1;33mscan\e[0m (Nmap), \e[1;33mexploit\e[0m (Metasploit), \e[1;33msql\e[0m (SQLmap)"
echo ""

# Kicinta Ubuntu iyadoo la raacinayo Custom Prompt iyo Aliases
proot-distro login ubuntu --termux-home -- bash --rcfile <(echo "
export PS1='\[\e[1;31m\]┌──(\[\e[1;34m\]khapiip㉿security-os\[\e[1;31m\])-[\[\e[0m\]\w\[\e[1;31m\]]\n└─\[\e[1;31m\]$\[\e[0m\] ';
alias ls='ls --color=auto';
alias ll='ls -alF';
alias scan='nmap';
alias exploit='msfconsole';
alias sql='sqlmap';
alias update='apt update && apt upgrade -y';
")
EOF

chmod +x /data/data/com.termux/files/usr/bin/khapiip

# 2. Toos u shubista qalabka Ethical Hacking-ka ee gudaha Ubuntu
echo -e "\e[1;34m[*] Diyaarinta iyo rakibidda agabka amniga (Tani waqti ayay qaadan kartaa)...\e[0m"
UBUNTU_ROOT="/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu"

# Amarradan hoose waxay si toos ah ugu dhex dhismi doonaan Ubuntu dhexdeeda mar jidka la kiciyo
proot-distro login ubuntu -- bash -c "
apt update && apt upgrade -y
apt install python3 python3-pip git curl wget nmap sqlmap -y
# Halkan waxaad ku dhex qori kartaa agab kasta oo kale oo aad rabto mustaqbalka
"

echo -e "\e[1;32m\n[+] RAKIBIDDII WAA DHAMMAATAY!\e[0m"
echo -e "Hadda qor \e[1;33m'khapiip'\e[0m si aad u gasho deegaankaaga cusub ee amniga."
