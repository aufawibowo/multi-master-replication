# Multi Master Replication
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
3. Web Server: `localhost`
#### 1.4 Spesifikasi Hardware
   1. Server Database
       - OS menggunakan `bento/ubuntu-16.04`
       - RAM 512MB
       - MySQL server
   2. Proxy
       - MySQL
       - Menggunakan `bento/ubuntu-16.04`
       - RAM 512MB
   3. Apache Webserver
       - Windows 10
       - RAM 4096MB