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

sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2

cat /etc/system-release

sudo yum install -y httpd mariadb-server

sudo systemctl start httpd

sudo systemctl enable httpd

sudo systemctl is-enabled httpd

7. cd into apache directory root

cd /var/www/html

8. Setting file permissions

sudo usermod -a -G apache ec2-user

9. Remove PHP info file in the apache document root

rm /var/www/html/phpinfo.php

10. log out and then log back in again 

exit
 
11. verify group membership in apache group

groups

12. change the group ownership of /var/www and its contents to the apache group

sudo chown -R ec2-user:apache /var/www

13. to add group write permissions and to set the group ID

sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;


14. create php file in apache doc root

echo "<?php index(); ?>" > /var/www/html/index.php

