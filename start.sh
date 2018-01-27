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


############################################################################################################################
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
########################################################################
echo "Created BY : Muhammad Farras Rayhand"
