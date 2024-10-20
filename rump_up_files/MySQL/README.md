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

- ####  Paste the “Public IP Address EC2 in the “Browser Address Bar” & press “enter” . A “PHP Web Page” will be shown.

<img width="1787" alt="Screenshot 2024-10-19 at 17 22 36" src="https://github.com/user-attachments/assets/89d9f4d6-45e8-4422-8e0e-74759fbe4565">

## 3. Create a MySQL Database & Set Up Connection Over EC2 Server with Proper Tesing
- ####  Go to the “Services” section & Search the “RDS” over Here. Put the cursor over “RDS” & click on the “Databases”
- #### Create MySQL database, write the “Master username” as “admin” & the “Master Password” as “intel123”.
- #### In the “Connectivity” section, choose the “Compute resource” as “Connect to an EC2 compute resource”. Choose  “EC2 Instance (AWS_EC2_PHP_Project)” here
- #### Choose the “VPC security group (firewall)” as the “Choose existing”, while the “Additional VPC security group” as the “AWS_EC2_PHP_Project”
![Screenshot 2024-10-19 at 17 34 11](https://github.com/user-attachments/assets/776fe970-a21a-41bd-832b-b2892252c8e3)

## Set Up Database Connection with EC2 Server & Test the Created Database
- #### Install the “MySQL” over “EC2” server using the below-given command:
```bash
  sudo apt install mysql-server -y
```
- #### Set up the MySQL database connection with the EC2 server using the below-given command:

```bash
  sudo mysql -h << Endpoint your database >>  -u admin -pintel123
```
- #### View all the created databases here
```mysql
  show databases;
```
- #### Go to the “intel” database using the below-given command:
```mysql
  use intel;
```
- #### Use the below-given query to create a table
```mysql
  create table data (firstname varchar(20), email varchar(20));
```
- #### Insert the value into the data table using the below-given query:
```mysql
  insert into data values ('AWS', 'support@aws.com');
```
- #### Check that data is successfully inserted or not, type the below-given query:
```mysql
  select * from data;
```
- #### Now, we are exiting from the database using the below-given command:
```mysql
  exit
```
<img width="1022" alt="Screenshot 2024-10-19 at 18 35 30" src="https://github.com/user-attachments/assets/db54f9cb-803e-4298-9345-11aa03a00699">









































