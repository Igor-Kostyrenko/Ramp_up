# Install and Configure a Private BIND DNS Server on Ubuntu

## 1.  _Install the latest updates_

```sh
sudo apt update -y && apt upgrade -y
```

## 2.  _Install BIND 9 on the DNS server_

```sh
sudo apt install bind9 bind9utils bind9-doc -y
```

## 3.  _Check the status BIND 9 service_

```sh
sudo systemctl status bind9
```

