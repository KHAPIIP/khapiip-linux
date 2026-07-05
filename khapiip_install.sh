#!/bin/bash
# Khapiip Security Distro - Kali-Style Environment for Termux

echo -e "\e[1;34m[*] Cusboonaysiinta Termux iyo rakibidda Proot-Distro...\e[0m"
pkg update && pkg upgrade -y
pkg install proot-distro git curl wget -y

echo -e "\e[1;32m[*] Rakibidda nidaamka hoose ee Ubuntu...\e[0m"
proot-distro install ubuntu

# 1. Halkan waxaan ku hagaajinaynaa faylka ~/.bashrc ee Ubuntu inta aan la gelin ka hor
echo -e "\e[1;34m[*] Habaynta Kali Linux Prompt iyo Aliases...\e[0m"
UBUNTU_ROOT="/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu"

cat << 'EOF' >> "$UBUNTU_ROOT/root/.bashrc"
export PS1='\[\e[1;31m\]-[\[\e[1;34m\]khapiip@security-os\[\e[1;31m\]]-[\e[0m\]\w\[\e[1;31m\]]\n$\[\e[0m\] '
alias scan='nmap'
alias sql='sqlmap'
alias update='apt update && apt upgrade -y'
EOF

# 2. Sameynta Shortcut-ka Termux ee 'khapiip'
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
echo -e "Amarrada gaarka ah: \e[1;33mscan\e[0m (Nmap), \e[1;33msql\e[0m (SQLmap)"
echo ""
proot-distro login ubuntu
EOF

chmod +x /data/data/com.termux/files/usr/bin/khapiip

# 3. Toos u shubista qalabka Ethical Hacking-ka
echo -e "\e[1;34m[*] Diyaarinta iyo rakibidda agabka amniga...\e[0m"
proot-distro login ubuntu -- bash -c "
apt update && apt upgrade -y
apt install python3 python3-pip git curl wget nmap sqlmap -y
"

echo -e "\e[1;32m\n[+] RAKIBIDDII WAA DHAMMAATAY!\e[0m"
echo -e "Hadda qor \e[1;33m'khapiip'\e[0m si aad u gasho deegaankaaga cusub ee amniga."
