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
 
 #####################################################################################################################################
 read -r -p "Apakah anda ingin Menginstall Service DHCP Server? [Y/n] " input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "Yes"
apt-get install isc-dhcp-server -y
 echo -n "Masukkan Interface untuk DHCP Server [contoh ens33] : "
read int
 
 echo -n "Masukkan IP Address untuk DHCP Server [contoh 192.168.1.1] : "
read ip

echo -n "Masukkan IP Network untuk DHCP Server [contoh 192.168.1.0] : "
read net

echo -n "Masukkan IP Broadcast untuk DHCP Server [contoh 192.168.1.255] : "
read broad

echo -n "Masukkan NetMask untuk DHCP Server [contoh 255.255.255.0] : "
read mask

echo -n "Masukkan IP Range untuk DHCP Server [contoh 192.168.1.2 192.168.1.254] : "
read range

echo -n "Masukkan Domain untuk DHCP Server [contoh domain.net] : "
read domain

echo -n "Masukkan DNS Server untuk DHCP Server [contoh 192.168.1.1, 8.8.8.8] : "
read dns

echo "subnet $net netmask $mask {" >> /etc/dhcp/dhcpd.conf
echo "range $range;" >> /etc/dhcp/dhcpd.conf
echo "option domain-name-servers $dns;" >> /etc/dhcp/dhcpd.conf
echo "option domain-name =$domain=;" >> /etc/dhcp/dhcpd.conf
echo "option subnet-mask $mask;" >> /etc/dhcp/dhcpd.conf
echo "option routers $ip;" >> /etc/dhcp/dhcpd.conf
echo "option broadcast-address $broad;" >> /etc/dhcp/dhcpd.conf
echo "default-lease-time 600;" >> /etc/dhcp/dhcpd.conf
echo "max-lease-time 7200;" >> /etc/dhcp/dhcpd.conf
echo "}" >> /etc/dhcp/dhcpd.conf

sed -i 's/"/@/g' /etc/default/isc-dhcp-server
sed -i "s/INTERFACES=@@/ INTERFACES=@$int@/g" /etc/default/isc-dhcp-server
sed -i 's/@/"/g' /etc/default/isc-dhcp-server
sed -i 's/=/"/g' /etc/dhcp/dhcpd.conf
service isc-dhcp-server restart
/etc/init.d/isc-dhcp-server status
echo "Installasi Service DHCP Server Selesai..."
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
 
clear
echo "Created BY : Muhammad Farras Rayhand"
