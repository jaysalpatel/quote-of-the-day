variable "region" {
  description = "AWS Region"
  default = "us-east-1"
}

variable "key_path" {
  description = "Public key path"
  default = "/home/jaysal/.ssh/id_rsa"
}

variable "ami" {
  description = "AMI"
  default = ""
}

variable "instance_type" {
  description = "EC2 instance type"
  default = "t2.micro"
}