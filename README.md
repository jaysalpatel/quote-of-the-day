Documentation and steps on setting up my AWS environment

1. Created IAM Account as a non-root user
    - Create an IAM user with administrator policy to avoid using root user credentials
    
    - Enabled billing alerts on AWS Cloudwatch for anything over a few dollars

    - Configure AWS cli for non-root user 
        - Type command "aws configure" in Linux terminal 
        - Input AWS Access Key ID and AWS Secret Access Key ID as well default region

2. Set up static website hosting
    - Deploy EC2 Virtual Machine and hosting on S3 that will echo "Quote of the day"
    - Created VPC, public/private subnets, associated route table, created/attached internet gateway, NAT gateway, security groups and NACL
    - To SSH into private instances, I install the ec2-instance-connect RPM package
        -   uname srv
        -   sudo yum install ec2-instance-connect
    - Set uup IAM users for ec2 instance connect 
        - 1. in IAM console, choose Policies, Create policy
        - 2. on the Create policy page, choose JSON document
        - {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2-instance-connect:SendSSHPublicKey"
            ],
            "Resource": [
                "arn:aws:ec2:$us-east-1:$536510685689:instance/*"
            ],
            "Condition": {
                "StringEquals": {
                    "ec2:osuser": "ec2-user"
                }
            }
        }
    ]

        - 3. Review policy, name, and create policy 
        - 4. attach policy then add users to group 
        - 5. select users to Add Users
    Connecting to an instance
        -   ssh-keygen -t rsa -f mynewkey

        - 1. use the following AWS CLI command to authorize the user and push the public key to the instance using the send-ssh-public-key command
        -   aws ec2-instance-connect send-ssh-public-key --region us-east-1 --instance-id i-234h5j24k5h --availability-zone us-east-1b --instance-os-user ec2-user --ssh-public-key file://mynewkey.pub

        - 2. after authenication, the public key is made available to the instance through the instance metadata for 60 seconds
        -   ssh -i mynewkey.pub ec2-user@public-ip
        - use sudo if you get a permission denied on linux 
            
    - Take a snapshot of you VM, delete the VM, and deploy a new one from the snapshot. Bascially disk backup + disk restore

3. Auto-scaling
    - Create an AMI from that VM and put it in an autoscaling group so one VM always exists
    - Put a elastic load balancer infront of that VM and load balancer between two Availability zones (one in each AZ)
    
4. External data
    - Create a DynamoDB table and experiment with loading and retrieving data manually, then do the same via script on your local machine
    - Refactor your static page into your Quote-of-the-Day website(PHP)
5. Web static platform as a service
    - Retire that simple website and deploy it on kubernetes
    - Create a S3 Static website bucket, upload some sample static pages/files/images
    - Register a domain(or re-use and existing one)



6. Microservices
    - 

    When building the docker image for the lamp stack, I encountered an error returning command '/bin/sh -c yum update -y' returned a non-zero-code: 127
    This is a path related issue and profile. When you use sh -c or bash -c the profile files are not loaded. But when you use bash -lc it means load the profile and also execute the command. Now your profile may have the necessary path setup the run this command 
        that was solved by including
        ENTRYPOINT [ "/bin/bash", "-lc" ]


7. Serverless 
    - Write a AWS Lambda function to email you a list of all the Quotes in the DynamoDB table every night. Implement least privilage security for the Lambda role. (Hint: Lambda using Python 3, boto3, Amazon SES, and scheduled with AWS Cloudwatch)
    - Refactor the above app into a serverless app. This is where it get's a little more abstract and you'll have to do a lot of research, experimentation on your own
    - Use your SSL enabled bucket as the primary domain landing page with static content
    Create an AWS API Gateway, use it to forward HTTP requests to an AWS Lambda function that queries the same data from DynamoDB as 


8. Packer
    - Building an AMI with packer with Lamp stack components
            -errors
                Failed to initialize build 'amazon-instance': error initializing builder 'amazon-instance': Unrecognized remote plugin message: Error starting plugin server: listen unix /tmp/packer-plugin085158145: listen: operation not permitted
            Solution: Attach IAM policy Roles
            







Installing Nginx docker kubernetes on ec2

sudo yum update -y
sudo amazon-linux-extras install nginx

sudo yum install -y nginx

##After install NGINX, you have to configure worker_processes, Edit the nginx.conf file 

sudo vi /etc/nginx/nginx.conf

###starting nginx
sudo /etc/init.d/nginx start


sudo yum install -y docker

sudo service docker start

###include ec2-user on your docker set 

sudo usermod -a -G docker ec2-user

exit


###install apache
sudo yum -y install httpd
sudo systemctl start httpd.service
sudo systemctl enable httpd.service

echo "hello world $(hostname -f) > /var/www/html/home.html



###log out and log back in so that your group membership is reevaulated

sudo su
sudo chmod 777 /var/docker.sock


#####FOR JENKINS

sudo usermod -a -G docker jenkins

sudo service jenkins stop 

sudo service jenkins start

Remove test page after install apache on EC2 instance


mv /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf_backup

sudo systemctl restart httpd

sudo cd /etc/httpd

sudo rmdir conf.d


###git error: failed to push some refs to 'https://github.com/jaysalpatel/quote-of-the-day.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally

git push -f origin master




