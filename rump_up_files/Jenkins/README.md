<p align="left">
 <img width="500px" src="jenkins-logo.png" alt="qr"/>
</p>

# Install and Configure Jenkins

 #### Prerequisites
 1. Java Development Kit (JDK)
 2. Git

 ## Step 1: Install Jenkins For Linux Systems (Ubuntu/Debian)

```sh
    sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
     https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
    echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
     https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null
    sudo apt-get update
    sudo apt-get install jenkins
```