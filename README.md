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
      - [1. Menginstall OS dan MySQL](#1-menginstall-os-dan-mysql)
      - [2. Mengeluarkan `uuidgen`](#2-mengeluarkan-uuidgen)
      - [3. Membuat Group Replication didalam file konfigurasi MySQL](#3-membuat-group-replication-didalam-file-konfigurasi-mysql)
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
Implementasi berikut akan diterjemahkan kedalam perintah automasi disetiap akhir segmen.
#### 1. Menginstall OS dan MySQL
   1. Install OS
   2. Install MySQL 

Hasil terjemahan untuk file perintah automasi didalam vagrant
```
# Changing the APT sources.list to kambing.ui.ac.id
sudo cp '/vagrant/sources.list' '/etc/apt/sources.list'

# Updating the repo with the new sources
sudo apt-get update -y

# Install required library
sudo apt-get install libaio1
sudo apt-get install libmecab2

# Get MySQL binaries
curl -OL https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-common_5.7.23-1ubuntu16.04_amd64.deb
curl -OL https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-community-client_5.7.23-1ubuntu16.04_amd64.deb
curl -OL https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-client_5.7.23-1ubuntu16.04_amd64.deb
curl -OL https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-community-server_5.7.23-1ubuntu16.04_amd64.deb

# Setting input for installation
sudo debconf-set-selections <<< 'mysql-community-server mysql-community-server/root-pass password admin'
sudo debconf-set-selections <<< 'mysql-community-server mysql-community-server/re-root-pass password admin'

# Install MySQL Community Server
sudo dpkg -i mysql-common_5.7.23-1ubuntu16.04_amd64.deb
sudo dpkg -i mysql-community-client_5.7.23-1ubuntu16.04_amd64.deb
sudo dpkg -i mysql-client_5.7.23-1ubuntu16.04_amd64.deb
sudo dpkg -i mysql-community-server_5.7.23-1ubuntu16.04_amd64.deb
```

#### 2. Mengeluarkan `uuidgen` 
ketik `uuidgen` pada terminal UNIX (dalam hal ini, menggunakan ubuntu).
```
> uuidgen
```
output
```
keluaran uuidgen
```
#### 3. Membuat Group Replication didalam file konfigurasi MySQL

1. Konfigurasi umum group replication
    Bagian berikut mengandung konfigurasi umum untuk group replication.
    ```
    # General replication settings
    gtid_mode = ON
    enforce_gtid_consistency = ON
    master_info_repository = TABLE
    relay_log_info_repository = TABLE
    binlog_checksum = NONE
    log_slave_updates = ON
    log_bin = binlog
    binlog_format = ROW
    transaction_write_set_extraction = XXHASH64
    loose-group_replication_bootstrap_group = OFF
    loose-group_replication_start_on_boot = OFF
    loose-group_replication_ssl_mode = REQUIRED
    loose-group_replication_recovery_use_ssl = 1
    ```
2. Konfigurasi shared group replication
3. Konfigurasi untuk Multi-Primary 

### 3. Implementasi Aplikasi Tambahan Kedalam Sistem
### 4. Simulasi Fail-Over