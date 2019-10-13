# Multi Master Replication
## Outline
- [Multi Master Replication](#multi-master-replication)
  - [Outline](#outline)
    - [1. Desain Infrastruktur](#1-desain-infrastruktur)
      - [1.1 Gambar Infrastruktur](#11-gambar-infrastruktur)
      - [1.2 Detil Server](#12-detil-server)
      - [1.3 Pembagian IP](#13-pembagian-ip)
      - [1.4 Spesifikasi Hardware](#14-spesifikasi-hardware)
    - [2. Implementasi](#2-implementasi)
    - [3. Implementasi Aplikasi Tambahan Kedalam Sistem](#3-implementasi-aplikasi-tambahan-kedalam-sistem)
    - [4. Simulasi Fail-Over](#4-simulasi-fail-over)

###  1. Desain Infrastruktur
#### 1.1 Gambar Infrastruktur
![infra](img/diagram.png)
#### 1.2 Detil Server
1. Server database sejumlah tiga buah
2. Proxy sejumlah satu buah
3. Web Server sebanyak satu buah
#### 1.3 Pembagian IP
1. Server Database
   1. 192.168.16.185
   2. 192.168.16.186
   3. 192.168.16.187
2. Proxy: 192.168.16.184
3. Web Server: 192.168.16.188
#### 1.4 Spesifikasi Hardware
   1. Server Database
       - OS menggunakan `bento/ubuntu-16.04`
       - RAM 512MB
       - MySQL server
   2. Proxy
       - MySQL
       - OS enggunakan `bento/ubuntu-16.04`
       - RAM 512MB
   3. Apache Web server
       - OS menguunakan `ubuntu/xenial64`
       - RAM 512MB
### 2. Implementasi
### 3. Implementasi Aplikasi Tambahan Kedalam Sistem
### 4. Simulasi Fail-Over