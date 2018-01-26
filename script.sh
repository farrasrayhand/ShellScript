#!/bin/sh
#
#Copyright (C) 2018 Muhammad Farras Rayhand
#
echo "Script ini dibuat untuk ubuntu 16.04"
echo "script ini akan memulai konfigurasinya secara otomatis..."


echo "Menambah Repository Kambing"
ex -sc '1i|deb http://kambing.ui.ac.id/ubuntu xenial-proposed main restricted universe multiverse' -cx /etc/apt/sources.list
ex -sc '1i|deb http://kambing.ui.ac.id/ubuntu xenial-backports main restricted universe multiverse' -cx /etc/apt/sources.list
ex -sc '1i|deb http://kambing.ui.ac.id/ubuntu xenial-security main restricted universe multiverse' -cx /etc/apt/sources.list
ex -sc '1i|deb http://kambing.ui.ac.id/ubuntu xenial-updates main restricted universe multiverse' -cx /etc/apt/sources.list
ex -sc '1i|deb http://kambing.ui.ac.id/ubuntu xenial main restricted universe multiverse' -cx /etc/apt/sources.list

echo "Menambah Repository Buaya"
ex -sc '1i|deb http://buaya.klas.or.id/ubuntu/ xenial-proposed main restricted universe multiverse' -cx /etc/apt/sources.list
ex -sc '1i|deb http://buaya.klas.or.id/ubuntu/ xenial-backports main restricted universe multiverse' -cx /etc/apt/sources.list
ex -sc '1i|deb http://buaya.klas.or.id/ubuntu/ xenial-security main restricted universe multiverse' -cx /etc/apt/sources.list
ex -sc '1i|deb http://buaya.klas.or.id/ubuntu/ xenial-updates main restricted universe multiverse' -cx /etc/apt/sources.list
ex -sc '1i|deb http://buaya.klas.or.id/ubuntu/ xenial main restricted universe multiverse' -cx /etc/apt/sources.list

echo "Menambah Repository ITB"
ex -sc '1i|deb ftp://ftp.itb.ac.id/pub/ubuntu xenial-proposed main restricted universe multiverse' -cx /etc/apt/sources.list
ex -sc '1i|deb ftp://ftp.itb.ac.id/pub/ubuntu xenial-backports main restricted universe multiverse' -cx /etc/apt/sources.list
ex -sc '1i|deb ftp://ftp.itb.ac.id/pub/ubuntu xenial-security main restricted universe multiverse' -cx /etc/apt/sources.list
ex -sc '1i|deb ftp://ftp.itb.ac.id/pub/ubuntu xenial-updates main restricted universe multiverse' -cx /etc/apt/sources.list
ex -sc '1i|deb ftp://ftp.itb.ac.id/pub/ubuntu xenial main restricted universe multiverse' -cx /etc/apt/sources.list
echo "Penambahan Repository Selesai..."


echo "Melakukan update repository"
apt-get update

echo "Update Repository selesai..."

echo "Installasi Packet yang dibutuhkan oleh zimbra"
apt-get install libgmp10 wget libperl5.22 unzip pax sysstat sqlite3 libaio1 -y
echo "Proses Installasi Selesai..."

echo "Created BY : Muhammad Farras Rayhand"
