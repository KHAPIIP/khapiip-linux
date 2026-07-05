​🚀 KHAPIIP SECURITY DISTRO v2.0 (Kali-Style OS for Android) 🛡️
​Ma haysatid kombuyuutar balse waxaad rabtaa inaad barato Ethical Hacking iyo Cyber Security? Wax dhib ah ma jiraan! Hadda waxaad taleefankaaga u beddeli kartaa mashiin awood badan oo u shaqeeya sida Kali Linux oo kale iyadoo la isticmaalayo Termux!
---

## ✨ Features (Waxyaabaha uu qabanayo)

* **Custom Prompt:** Magacaaga `root@Ahmed-Khapiip` oo leh midabada cagaarka iyo buluugga.
* **Professional Banner:** Markasta oo aad gasho nidaamka, waxaa ku soo dhoweynaya Commander Ahmed.
* **Built-in Aliases:** Amarro gaaban oo shaqada kuu fududeynaya:
    * `update`: Si aad nidaamka oo dhan hal mar ugu cusboonaysiiso.
    * `scan`: Si aad si dhakhso ah u isticmaasho `nmap`.
    * `ll`: Si aad u aragto faylasha qarsoon iyo faahfaahintooda.
* **Color Support:** `ls` midabaysan oo kuu kala saaraya faylasha iyo folder-lada.

---

## 🚀 Sida loo rakibo (Installation)

Fadlan nuqul ka samee amarradan hoose oo ku dheji (paste) gudaha **Termux**:

```bash
# 1. Cusboonaysii Termux
pkg update && pkg upgrade -y

# 2. Rakib Git
pkg install git -y

# 3. Soo dejiso nidaamka
git clone [https://github.com/KHAPIIP/khapiip-linux.git](https://github.com/KHAPIIP/khapiip-linux.git)

# 4. Gal folder-ka oo rakib
cd khapiip-linux
chmod +x khapiip_install.sh
./khapiip_install.sh

