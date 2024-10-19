## Deploy a Multi-Tier PHP Website Using the AWS EC2 & RDS Services

## Steps to Solve:

1. ##### Launch an EC2 Instance
2. ##### Enable Auto Scaling on these instances (minimum 2)
3. ##### Create an RDS Instance
4. ##### Create Database & Table in RDS instance:
    - ##### Database name: intel
    - ##### Table name: data
    - ##### Database password: intel123
5. ##### Change hostname in website
6. ##### Allow traffic from EC2 to RDS instance
7. ##### Allow all-traffic to EC2 instance


## 1. Create an EC2 Instance and Install Apache2 Web Server Over Here
- ####  Create an EC2 Instance `AWS_EC2_PHP_Project`, choose the “Application and OS Images (Amazon Machine Image)” as “Ubuntu”, “Instance Type” as “t2.micro”.
- ####  Create security group, allow SSH, HTTP and MySQL/Aurora (port 3306) inbound trafic
- ####  Update the “AWS_EC2_PHP_Project” machine using the below-given command:
```bash
sudo apt update
```
- ####  Install the “apache2” web server
```bash
sudo apt install apache2 -y
```
- ####  Check that the “Apache2” web server has been successfully installed
 <img width="1738" alt="Screenshot 2024-10-19 at 17 20 12" src="https://github.com/user-attachments/assets/18c6ac42-cbc1-4f16-a9ad-b7f071d9d539">

## 2. Deploy the PHP Website on EC2 Server
- ####  Remove the “index.html” file & create a new “index.php” file
```bash
cd /var/www/html
sudo rm index.html
sudo nano index.php
```
- ####  A file Editor will be opened & paste the “PHP Website Code” from file `index.php`
