#!/bin/bash
sudo yum update -y

sudo yum install -y httpd php php-mysqlnd

sudo systemctl start httpd

sudo chkconfig httpd on

sudo yum install -y nano

sudo yum install -y mysql

sudo yum install -y wget

echo "welcome to my page brought you by terraform" > /var/html/index.html