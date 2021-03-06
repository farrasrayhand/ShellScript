#!/bin/sh
#
#Copyright (C) 2018 Muhammad Farras Rayhand
#

echo "Script ini dibuat untuk debian 8 (Jessie)"


read -r -p "Apakah anda ingin menambah Repo Kambing? [Y/n] " input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
echo "Menambah Repository Kambing"
ex -sc '1i|#' -cx /etc/apt/sources.list
ex -sc '1i|deb http://kambing.ui.ac.id/debian-security/ jessie/updates main contrib non-free' -cx /etc/apt/sources.list
ex -sc '1i|deb http://kambing.ui.ac.id/debian/ jessie-updates main contrib non-free' -cx /etc/apt/sources.list
ex -sc '1i|deb http://kambing.ui.ac.id/debian/ jessie main contrib non-free' -cx /etc/apt/sources.list
ex -sc '1i|#REPO KAMBING' -cx /etc/apt/sources.list

echo "Melakukan update repository"
apt-get update
echo "Penambahan Repository Selesai..."
 ;;
 
     [nN][oO]|[nN])
 echo "No"
        ;;
 
     *)
 echo "Invalid input..."
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
echo "Installasi SSH Selesai, Connect menggunakan PUTTY atau aplikasi SSH lainnya dengan format $aipi:$port"
 ;;
 
     [nN][oO]|[nN])
 echo "No"
        ;;
 
     *)
 echo "Invalid input..."
 ;;
 esac
 
 clear
echo "Penambahan Repository Selesai..."
echo
echo
echo "Installasi SSH Selesai, Connect menggunakan PUTTY atau aplikasi SSH lainnya dengan format $aipi:$port"
echo
echo
 echo "Created BY FarrasRayhand"

