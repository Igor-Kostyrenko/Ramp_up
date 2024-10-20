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