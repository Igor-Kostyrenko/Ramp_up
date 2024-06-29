# Install and Configure a Private BIND DNS Server on Ubuntu

### 1.  _Install the latest updates_

```sh
sudo apt update -y && apt upgrade -y
```

### 2.  _Install BIND 9 on the DNS server_

```sh
sudo apt install bind9 bind9utils bind9-doc -y
```

 Check the status BIND 9 service

```sh
sudo systemctl status bind9
```

 <p align="left">
 <img width="600px" src="status_dns.png" alt="qr"/>
</p>

### 3.  _Setting Up DNS Forwarding_

Edit `/etc/bind/named.conf`

```javascript
options {
        directory "/var/cache/bind"; // default directory
        allow-query { any; };
        forwarders { 1.1.1.1; };
        recursion yes;
        dnssec-validation auto;
};
```

### 4.  _Setting Up DNS Zones (Domain Names)_

Edit `/etc/bind/named.conf.local`

```javascript
zone "example.com" {
    type master;
    file "/etc/bind/zones/db.example.com";
};
```
Create the `/etc/bind/zones/` directory.
```sh
sudo mkdir /etc/bind/zones
```

Create our new zone file by copying an existing template file
```sh
cd /etc/bind/zones
sudo cp ../db.local ./db.example.com
```
Edit `/etc/bind/zones/db.example.com`
```javascript
zone "example.com" {
    type master;
    file "/etc/bind/zones/db.example.com";
};
```
