#!/bin/sh
#
#Copyright (C) 2018 Muhammad Farras Rayhand
#

IJO='\e[38;5;82m'
MAG='\e[35m'
RESET='\e[0m'

echo "Script ini dibuat untuk debian 8 (Jessie)"


read -r -p "Apakah anda ingin menambah Repo Kambing? [Y/n] " input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
echo -e "$IJO Menambah Repository Kambing $RESET"
ex -sc '1i|#' -cx /etc/apt/sources.list
ex -sc '1i|deb http://kambing.ui.ac.id/debian-security/ jessie/updates main contrib non-free' -cx /etc/apt/sources.list
ex -sc '1i|deb http://kambing.ui.ac.id/debian/ jessie-updates main contrib non-free' -cx /etc/apt/sources.list
ex -sc '1i|deb http://kambing.ui.ac.id/debian/ jessie main contrib non-free' -cx /etc/apt/sources.list
ex -sc '1i|#REPO KAMBING' -cx /etc/apt/sources.list

echo -e "$IJO Melakukan update repository $RESET"
apt-get update
echo -e "$IJO Penambahan Repository Selesai... $RESET"
 ;;
 
     [nN][oO]|[nN])
 echo -e "$IJO No $RESET"
        ;;
 
     *)
 echo -e "$IJO "Invalid input... $RESET"
 ;;
 esac
 ##############################################################################################################
  read -r -p "Apakah anda ingin Menginstall Packet SSH? [Y/n] " input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
apt-get install ssh -y
 echo -n "Masukkan IP Address anda [contoh 192.168.1.1] : "
read aipi
 echo -n "Masukkan Port SSH [default = 22] : "
read port
sed -i "s/22/$port/g" /etc/ssh/sshd_config
service ssh restart
/etc/init.d/ssh status
echo -e "$MAG Installasi SSH Selesai, Connect menggunakan PUTTY atau aplikasi SSH lainnya dengan format $aipi:$port $RESET"
 ;;
 
     [nN][oO]|[nN])
 echo "No"
        ;;
 
     *)
 echo "Invalid input..."
 ;;
 esac
 
 clear
 echo -e "$IJO Melakukan update repository $RESET"
 echo
 echo
apt-get update
echo -e "$IJO Penambahan Repository Selesai... $RESET"
echo
echo
echo -e "$MAG Installasi SSH Selesai, Connect menggunakan PUTTY atau aplikasi SSH lainnya dengan format $aipi:$port $RESET"
echo
echo
 echo -e "$IJO Created BY FarrasRayhand $RESET"

