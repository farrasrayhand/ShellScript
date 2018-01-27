#!/bin/sh
#
#Copyright (C) 2018 Muhammad Farras Rayhand
#
echo "Script ini dibuat untuk ubuntu 16.04"

 read -r -p "Apakah anda ingin menambah Repo Kambing? [Y/n] " input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
echo "Menambah Repository Kambing"
ex -sc '1i|#' -cx /etc/apt/sources.list
ex -sc '1i|deb http://kambing.ui.ac.id/ubuntu xenial-proposed main restricted universe multiverse' -cx /etc/apt/sources.list
ex -sc '1i|deb http://kambing.ui.ac.id/ubuntu xenial-backports main restricted universe multiverse' -cx /etc/apt/sources.list
ex -sc '1i|deb http://kambing.ui.ac.id/ubuntu xenial-security main restricted universe multiverse' -cx /etc/apt/sources.list
ex -sc '1i|deb http://kambing.ui.ac.id/ubuntu xenial-updates main restricted universe multiverse' -cx /etc/apt/sources.list
ex -sc '1i|deb http://kambing.ui.ac.id/ubuntu xenial main restricted universe multiverse' -cx /etc/apt/sources.list
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

####################################################################################################################################

 read -r -p "Apakah anda ingin menambah Repo Buaya? [Y/n] " input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
 echo "Menambah Repository Buaya"
ex -sc '1i|#' -cx /etc/apt/sources.list
ex -sc '1i|deb http://buaya.klas.or.id/ubuntu/ xenial-proposed main restricted universe multiverse' -cx /etc/apt/sources.list
ex -sc '1i|deb http://buaya.klas.or.id/ubuntu/ xenial-backports main restricted universe multiverse' -cx /etc/apt/sources.list
ex -sc '1i|deb http://buaya.klas.or.id/ubuntu/ xenial-security main restricted universe multiverse' -cx /etc/apt/sources.list
ex -sc '1i|deb http://buaya.klas.or.id/ubuntu/ xenial-updates main restricted universe multiverse' -cx /etc/apt/sources.list
ex -sc '1i|deb http://buaya.klas.or.id/ubuntu/ xenial main restricted universe multiverse' -cx /etc/apt/sources.list
ex -sc '1i|#REPO BUAYA' -cx /etc/apt/sources.list

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

####################################################################################################################################
 read -r -p "Apakah anda ingin Menginstall Packet SSH? [Y/n] " input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
apt-get install ssh
 echo -n "Masukkan IP Address anda [contoh 192.168.1.1] : "
read aipi
 echo -n "Masukkan Port SSH [default = 22] : "
read port
sed -i "s/Port 22/$port/g" /etc/ssh/sshd_config

echo "Installasi SSH Selesai, Connect menggunakan PUTTY atau aplikasi SSH lainnya dengan format $aipi:$port"
 ;;
 
     [nN][oO]|[nN])
 echo "No"
        ;;
 
     *)
 echo "Invalid input..."
 ;;
 esac
 
 #####################################################################################################################################
read -r -p "Apakah anda ingin menginstall packet untuk zimbra [Y/n] " input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
 echo "Installasi Packet yang dibutuhkan oleh zimbra"
apt-get install libgmp10 wget libperl5.22 unzip pax sysstat sqlite3 libaio1 -y
echo "Proses Installasi Selesai..."
 ;;
 
     [nN][oO]|[nN])
 echo "No"
        ;;
 
     *)
 echo "Invalid input..."
 ;;
 esac
####################################################################################################################################
read -r -p "Apakah anda ingin menginstall packet bind9 [Y/n] " input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
 echo "Installasi Packet bind9"
apt-get install bind9 -y
echo "Proses Installasi Selesai..."

read -r -p "Apakah anda ingin membuat domain? [Y/n] " input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
 echo -n "Masukkan ip address anda [contoh 192.168.1.1] : "
read ipadd

echo -n "Masukkan domain yang akan dibuat [contoh = domain.net] : "
read domain

echo -n "Masukkan network id untuk domain yang dibuat [contoh 192.168.1.1 = 1.168.192] : "
read ip

echo -n "Masukkan host id untuk domain yang dibuat [contoh 192.168.1.1/24 = 1] : "
read host

echo -n "Masukkan nama db untuk domain yang akan dibuat [contoh = db.forward] : "
read forward

echo -n "Masukkan nama db untuk ip [contoh = db.reverse] : "
read reverse

ex -sc "i|zone =$domain= {" -cx /etc/bind/named.conf.default-zones
ex -sc "i| type master;" -cx /etc/bind/named.conf.default-zones
ex -sc "i| file =/etc/bind/$forward=;" -cx /etc/bind/named.conf.default-zones
ex -sc "i|};" -cx /etc/bind/named.conf.default-zones
cp /etc/bind/db.local /etc/bind/$forward
sed -i "s/127.0.0.1/$ipadd/g" /etc/bind/$forward
sed -i "s/localhost/$domain/g" /etc/bind/$forward

ex -sc "i|zone =$ip.in-addr.arpa= {" -cx /etc/bind/named.conf.default-zones
ex -sc "i| type master;" -cx /etc/bind/named.conf.default-zones
ex -sc "i| file =/etc/bind/$reverse=;" -cx /etc/bind/named.conf.default-zones
ex -sc "i|};" -cx /etc/bind/named.conf.default-zones
cp /etc/bind/db.127 /etc/bind/$reverse
sed -i "s/localhost/$domain/g" /etc/bind/$reverse
sed -i "s/1.0.0/$host/g" /etc/bind/$reverse

sed -i 's/=/"/g' /etc/bind/named.conf.default-zones

service bind9 restart
 ;;
 
     [nN][oO]|[nN])
 echo "No"
        ;;
 
     *)
 echo "Invalid input..."
 ;;
 esac
 ;;


     [nN][oO]|[nN])
 echo "No"
        ;;
 
     *)
 echo "Invalid input..."
 ;;
 esac
echo "Created BY : Muhammad Farras Rayhand"
