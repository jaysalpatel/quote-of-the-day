Install LAMP Stack on EC2 instance

1. Launch ec2 instance with public IP enabled

2. Security group port rules should be
Type            Port Range
SSH             22
HTTP            80
HTTPS           443
MYSQL/Aurora    3306

3. Create internet-facing load balancer with security group rules and call the security group load-balancer

HTTP        80

4. Change an inbound rule in Security Group on EC2-instance
Type        Port    Source
HTTP        80      Load-balancer-sg


5. SSH into instance ssh -i key.pem ec2-user@123.123.213

sudo yum update -y

6. We have to install LAMP stack dependencies

normal sudo yum install -y  httpd24 php56 mysql55-server php56-mysqlnd will not packages

Use yum search command

yum search httpd 

yum search php

yum search mysql


7. cd into apache directory root

cd /var/www/html

8. Setting file permissions

sudo usermod -a -G apache ec2-user

9. Remove PHP info file in the apache document root

rm /var/www/html/phpinfo.php

10. start mysql service

sudo service mysqld start

sudo mysql_secure_installation
