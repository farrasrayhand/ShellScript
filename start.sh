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
______________________________________________________________________________
read -r -p "Apakah anda ingin membuat domain? [Y/n] " input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
 echo -n "Masukkan ip address anda [contoh 192.168.1.1] : "
read ipadd

echo -n "Masukkan domain yang akan dibuat [contoh = domain.net] : "
read domain

echo -n "Masukkan ip address untuk domain yang dibuat [contoh 192.168.1.1 = 1.168.192] : "
read ip

echo -n "Masukkan nama db untuk domain yang akan dibuat [contoh = db.forward] : "
read forward

echo -n "Masukkan nama db untuk ip [contoh = db.reverse] : "
read reverse

echo "zone ~$domain~ {" >> /etc/bind/named.conf.default-zones
echo "	type master;" >> /etc/bind/named.conf.default-zones
echo "	file ~/etc/bind/$forward~;" >> /etc/bind/named.conf.default-zones
echo "};" >> /etc/bind/named.conf.default-zones
cp /etc/bind/db.local /etc/bind/$forward
ex -sc '%s/127.0.0.1/$ipadd/g|x' /etc/bind/$forward
ex -sc '%s/localhost/$domain/g|x' /etc/bind/$forward

echo "zone ~$ip~ {" >> /etc/bind/named.conf.default-zones
echo "	type master;" >> /etc/bind/named.conf.default-zones
echo "	file ~/etc/bind/$reverse~;" >> /etc/bind/named.conf.default-zones
echo "};" >> /etc/bind/named.conf.default-zones
cp /etc/bind/db.127 /etc/bind/$reverse

ex -sc '%s/~/"/g|x' /etc/bind/named.conf.default.zones
 ;;
 
     [nN][oO]|[nN])
 echo "No"
        ;;
 
     *)
 echo "Invalid input..."
 ;;
 esac
 ;;
 ________________________________________________________________________
 
     [nN][oO]|[nN])
 echo "No"
        ;;
 
     *)
 echo "Invalid input..."
 ;;
 esac
echo "Created BY : Muhammad Farras Rayhand"
