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

## Configure the Correct Database Settings in PHP file & Insert Dependencies to Remove the Error from PHP Web Page

- #### Open the “index.php” file using the below-given command:
```mysql
  sudo nano index.php
```
- #### right database connection:

servername = “Real Database Endpoint" (example  - application-database.calupg2c7sxe.ap-south-1.rds.amazonaws.com)

- #### Install the PHP MySQL Database Dependencies to Remove the Error from WebPage
```mysql
  sudo add-apt-repository -y ppa:ondrej/php
```
- #### Install the mysql-client over the “EC2 Machine [AWS_EC2_PHP_Project]” using the below-given command:
```mysql
  sudo apt install php5.6 mysql-client php5.6-mysqli
```
##### The PHP & MySQL dependencies will be successfully installed

- #### Open the web page by typing the public IP address

<img width="1763" alt="Screenshot 2024-10-19 at 19 12 14" src="https://github.com/user-attachments/assets/e2222087-09d7-4d47-a5e5-cdb4a91c8b5e">

##### No Database Dependencies Show Here & Error Resolved

- #### Test the Database Connection with PHP Web Page Again
 Insert the “Name” and “Email” through the web page. Click on the “Submit” button.

<img width="1632" alt="Screenshot 2024-10-19 at 19 20 40" src="https://github.com/user-attachments/assets/0a8ce875-b79a-4b97-a4b4-ff8ad3ee22d2">

- #### Notice that other record will be successfully inserted

<img width="1015" alt="Screenshot 2024-10-19 at 19 24 07" src="https://github.com/user-attachments/assets/edc3fb73-44c8-4872-8193-211cf4a39092">

## 4. Create the AMI (Amazon Machine Image) for Launch Template
- #### Select the Instance (“AWS_EC2_PHP_Project1) & Go to the “Actions>Image and templates>Create image”

![Screenshot 2024-10-19 at 19 27 54](https://github.com/user-attachments/assets/49943605-aa63-453a-bfad-4ff93b8b99a7)

<img width="1737" alt="Screenshot 2024-10-19 at 19 29 40" src="https://github.com/user-attachments/assets/36afe65e-9287-40ac-a01a-07404b94fadf">

## 5. Create the Launch Template for Auto Scaling Groups
- #### Go to the “Launch Template” and Create launch template:
   - Launch template name — AWS_EC2_PHP_Project_Template
   - Template version description — AWS_EC2_PHP_Project_Template
- #### Enable the option “Provide guidance to help me set up a template that  can use with EC2 Auto Scaling” by clicking in the “Auto Scaling guidance” option.
- #### In the “Application and OS Images (Amazon Machine Image)- required”, choose the “My AMI” option. Select our created AMI here

<img width="1275" alt="Screenshot 2024-10-19 at 19 46 55" src="https://github.com/user-attachments/assets/bbf168c5-8571-4513-b6e1-7152eddd95fc">

<img width="1597" alt="Screenshot 2024-10-19 at 19 51 03" src="https://github.com/user-attachments/assets/069c4ff0-1757-415a-aceb-2ee7a0ffc10d">

## 6. Create an Auto Scaling Group for this PHP website
- #### Go to the left side & click on the “Auto Scaling Groups” in the “Auto Scaling”. Click on the “Create Auto Scaling group”.
- #### Choose the “Auto Scaling group name” as “AWS_EC2_PHP_Project_ASG”.
- #### Choose the “Launch Template” as “AWS_EC2_PHP_Project_Template”. All the “launch template” configuration will be automatically fetched

<img width="1260" alt="Screenshot 2024-10-19 at 19 52 09" src="https://github.com/user-attachments/assets/f1889d58-e2c8-493b-8aba-2acdd2e018ed">

- #### In the “group size” choose the following metrics:
  - Desired capacity — 2
  - Minimum capacity — 1
  - Maximum capacity — 3
<img width="1146" alt="Screenshot 2024-10-19 at 20 02 44" src="https://github.com/user-attachments/assets/6f159126-616f-4b54-a570-52a4238056db">

- #### I“Auto Scaling Group” will be created successfully.
  
  <img width="1468" alt="Screenshot 2024-10-19 at 20 04 16" src="https://github.com/user-attachments/assets/3d8b770d-c446-449e-a478-3b5893dad648">
  
- #### Notice that your Auto Scaling Group Instances are successfully running.
  
![Screenshot 2024-10-19 at 20 05 26](https://github.com/user-attachments/assets/c2ef524d-263b-490c-8712-2cba72940b45)

## 7. Create a Target Group for Load Balancer
- #### In the left side, scroll down. Click on the “Target Groups” in the “Load Balancing”.
- #### Create target group, choose the “instances” as “Choose a target type”.
- #### Choose the “Target Group Name” as the “EC2-Project-Target-Group”. Leave the other settings as by default

<img width="1227" alt="Screenshot 2024-10-19 at 20 06 22" src="https://github.com/user-attachments/assets/f3d7ccf1-524f-428f-a1c3-34f32a43633a">
<img width="1735" alt="Screenshot 2024-10-19 at 20 08 42" src="https://github.com/user-attachments/assets/ad9f8893-404c-4e3e-bf99-85349586b317">

## 8. Create a Load Balancer for Balancing the Traffic
- #### Create Application load balancer
- #### In the “Basic Configuration”, choose the “Load balancer name” as the “AWS-EC2-PHP-Project-LB”. While leave the “scheme address” as the “Internet-facing” & the “IP address type” as “IPv4”
<img width="1193" alt="Screenshot 2024-10-19 at 20 09 52" src="https://github.com/user-attachments/assets/1e676180-058a-475b-a85f-3463d8865904">

- #### Notice that the “Load Balancer” will be successfully created & it will be in the “Active” state

<img width="1729" alt="Screenshot 2024-10-19 at 20 12 36" src="https://github.com/user-attachments/assets/e107bd1c-ee09-4392-aa1b-970cb9948e3e">

## 9. Attach the Load Balancer to Auto Scaling Group

<img width="1220" alt="Screenshot 2024-10-19 at 20 14 20" src="https://github.com/user-attachments/assets/a8085402-c0e8-4b1f-97ae-2c7205b3bb3b">

<img width="1688" alt="Screenshot 2024-10-19 at 20 15 47" src="https://github.com/user-attachments/assets/4e4dfc0c-ba44-4210-bcb9-f937cc6d9da8">

## 10. Test the Load Balancer Will Working Fine

- #### Copy the “DNS Name of AWS-EC2-PHP_Project-LB
- #### Paste the “DNS Name” into the “Browser Address Bar”. 

<img width="1677" alt="Screenshot 2024-10-19 at 20 15 58" src="https://github.com/user-attachments/assets/8c286bc9-cc5d-484c-9aef-22d17f756218">

## 11. Route Traffic from Load Balancer to A Specific Domain

- #### Go to the “Services” section & search the “Route 53”. Click on the “Hosted Zones”.
- #### Create record
- Enable the “Alias” option. Choose the following options here:
  - Choose endpoint: — Alias to Application and Classic Load Balancer
  - Choose Region: — < You Region > 
  - Choose load balancer: — < You LB  >
  
<img width="1217" alt="Screenshot 2024-10-19 at 21 46 15" src="https://github.com/user-attachments/assets/c4ce1a93-2d93-42ea-a424-461832532a40">
<img width="1608" alt="Screenshot 2024-10-19 at 22 21 09" src="https://github.com/user-attachments/assets/a1277ad6-3f59-452e-b45d-9ea6b77386bb">

- #### Notice that same PHP website will be visible on the registered domain (ikostyrenko.site).


<img width="1475" alt="Screenshot 2024-10-19 at 22 31 49" src="https://github.com/user-attachments/assets/6a860524-8b80-4821-9459-8942bbc4fe76">

## 12. Test the Auto Scaling is Working Properly 
- #### Select both the “asg-autoscaling-grp” Instances & click on the “Instance State”. Terminate the instance by clicking on the Terminate instance.

<img width="1446" alt="Screenshot 2024-10-19 at 22 39 21" src="https://github.com/user-attachments/assets/6f3b219d-1bbb-4056-a3e0-b8c19e8eca3e">

- #### Wait for some time & refresh the instances. We will notice that the two new instances (asg-autoscaling-grp) is successfully created & in the “Running” state.

<img width="1456" alt="Screenshot 2024-10-19 at 22 43 16" src="https://github.com/user-attachments/assets/8c352088-71e8-4ed5-8645-8888deb1f1fc">

- #### Go to the “Activity” fo ASG  and notice that instance has been successfully terminated & again created.

<img width="1321" alt="Screenshot 2024-10-19 at 22 43 36" src="https://github.com/user-attachments/assets/03259dcc-0071-48e4-b0db-0120ab7518fd">

## 13. Test the Database is Working Properly
### Fill the following entries in the name:
  - Name — Google
  - Email — support@google.com

##### Click on the “Submit”.

<img width="1135" alt="Screenshot 2024-10-19 at 22 56 04" src="https://github.com/user-attachments/assets/99e399ff-ca0a-45b1-b1d7-9fb1804eafa7">

- #### Go to the “EC2” Machine, connect the machine with the database & go to the “intel” database

<img width="941" alt="Screenshot 2024-10-19 at 22 57 15" src="https://github.com/user-attachments/assets/72d78974-05c1-4579-ad9a-e8fe6498f57e">

## 13. Use Amazaon Secret Manager to store credential

- #### Go to the ASM and create Secrets for RDS database

![Screenshot 2024-10-20 at 10 41 07](https://github.com/user-attachments/assets/ebf7d263-c198-4d5c-9861-24f138db1495)

![Screenshot 2024-10-20 at 10 41 07](https://github.com/user-attachments/assets/f3dda690-d960-4551-b6b7-af9955b03e31)

- #### Installing the AWS SDK for PHP
```bash
 curl -sS https://getcomposer.org/installer | php
 sudo mv composer.phar /usr/local/bin/composer
 curl -sS https://getcomposer.org/installer | php
 sudo mv composer.phar /usr/local/bin/composer
```

- #### Updating PHP code to use Secrets Manager
#### paste the “index with ASM.php”  to file `index.php` in `/var/www/html`
  
```bash
 // Enable autoload via Composer
    require 'vendor/autoload.php';

    use Aws\SecretsManager\SecretsManagerClient;
    use Aws\Exception\AwsException;

    // Configuring the AWS Secrets Manager client
    $client = new SecretsManagerClient([
        'version' => 'latest',
        'region' => 'eu-north-1', // Замените на ваш регион AWS
    ]);

    $secretName = "myDatabaseSecret"; // Имя вашего секрета в AWS Secrets Manager

    try {
        // Getting the secret value
        $result = $client->getSecretValue([
            'SecretId' => $secretName,
        ]);

        if (isset($result['SecretString'])) {
            $secret = $result['SecretString'];
        } else {
            $secret = base64_decode($result['SecretBinary']);
        }

        $secretArray = json_decode($secret, true);

        // Getting data for connecting to the database from the secret
        $servername = $secretArray['host'];
        $username = $secretArray['username'];
        $password = $secretArray['password'];
        $db = $secretArray['dbname'];

    } catch (AwsException $e) {
        echo "Error retrieving secret: " . $e->getAwsErrorMessage();
        exit();
    }

    // Creating a connection to a MySQL database
    $conn = new mysqli($servername, $username, $password, $db);

    // Checking the connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    if (isset($_POST['firstname']) && isset($_POST['email'])) {
        $firstname = $conn->real_escape_string($_POST['firstname']);
        $email = $conn->real_escape_string($_POST['email']);

        $sql = "INSERT INTO data (firstname, email) VALUES ('$firstname', '$email')";

        if ($conn->query($sql) === TRUE) {
            echo "<div class='alert alert-success'>New record created successfully</div>";
        } else {
            echo "<div class='alert alert-danger'>Error: " . $sql . "<br>" . $conn->error . "</div>";
        }
    }

    // Closing the database connection
    $conn->close();
    ?>
</body>
</html>

```
- #### Test the Database is Working Properly

<img width="1492" alt="Screenshot 2024-10-20 at 11 09 42" src="https://github.com/user-attachments/assets/09be7da3-88f5-4f52-b138-3057219fb55b">

<img width="1015" alt="Screenshot 2024-10-20 at 11 09 57" src="https://github.com/user-attachments/assets/105cd5d1-e666-43ae-b04c-f760a13acdf7">

<img width="1005" alt="Screenshot 2024-10-20 at 11 11 36" src="https://github.com/user-attachments/assets/f1aeba72-df0f-4237-aa4d-8617175849f1">

## 14. Backup MySQL Databases to Amazon S3

- #### Create S3 bucket

![Screenshot 2024-10-20 at 13 46 44](https://github.com/user-attachments/assets/6087fe07-719b-4f59-82ab-84f341b02557)

![Screenshot 2024-10-20 at 13 46 56](https://github.com/user-attachments/assets/91b9e8a8-9ab8-446c-bffe-d1637223343e)

- #### Create or configure an IAM role for your EC2 instance to access S3 and Secrets Manager

![Screenshot 2024-10-20 at 14 11 29](https://github.com/user-attachments/assets/682ee4e2-0885-4bc8-a111-890ef6d8809e)

- #### Create bash script for database backup `backup_db_to_s3.sh`:
```bash
 #!/bin/bash

# Secret name in AWS Secrets Manager
SECRET_NAME="myDatabaseSecret"
REGION="eu-north-1"

# Date to create a unique backup name
BACKUP_DATE=$(date +'%Y-%m-%d')

# Path to temporarily save the database dump
BACKUP_PATH="/tmp/db_backup_$BACKUP_DATE.sql"

# Name S3
S3_BUCKET="your-s3-bucket-name"
S3_PATH="s3://$S3_BUCKET/mysql_backups/db_backup_$BACKUP_DATE.sql"

# Get secrets from AWS Secrets Manager
SECRET=$(aws secretsmanager get-secret-value --secret-id $SECRET_NAME --region $REGION --query SecretString --output text)

# Extracting credentials from the secret
DB_HOST=$(echo $SECRET | jq -r .host)
DB_USERNAME=$(echo $SECRET | jq -r .username)
DB_PASSWORD=$(echo $SECRET | jq -r .password)
DB_NAME=$(echo $SECRET | jq -r .dbname)

# Dump the database using mysqldump
mysqldump -h $DB_HOST -u $DB_USERNAME -p$DB_PASSWORD $DB_NAME > $BACKUP_PATH

# Check if the dump was successful
if [ $? -eq 0 ]; then
    echo "Backup created successfully: $BACKUP_PATH"
    
    # Upload the dump to S3
    aws s3 cp $BACKUP_PATH $S3_PATH
    
    if [ $? -eq 0 ]; then
        echo "Backup uploaded to S3: $S3_PATH"
        
        # Delete the temporary file
        rm $BACKUP_PATH
    else
        echo "Failed to upload backup to S3"
    fi
else
    echo "Failed to create database backup"
fi
```

- #### Test the script
```bash
  chmod +x backup_db_to_s3.sh 
  ./backup_db_to_s3.sh
```
##### should be installed aws cli

<img width="1527" alt="Screenshot 2024-10-20 at 14 34 58" src="https://github.com/user-attachments/assets/1ba8dac0-38be-4cd2-aa3e-188381785765">


- #### Notice that еhe backup was successfully copied to S3
![Screenshot 2024-10-20 at 14 35 13](https://github.com/user-attachments/assets/5339084e-40fa-44e2-bda7-df15f9bbb804)

  
