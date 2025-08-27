# vpc variables
variable "vpc_cidr" {
    default      = "10.0.0.0/16"
    description  = "vpc cidr block"
    type         = string
  
}
variable "public_subnet_az1_cidr" {
    default      = "10.0.0.0/24"
    description  = "public subnet az1 cidr block"
    type         = string
  
}

variable "public_subnet_az2_cidr" {
    default      = "10.0.1.0/24"
    description  = "public subnet az2 cidr block"
    type         = string
  
}

variable "private_app_subnet_az1_cidr" {
    default      = "10.0.2.0/24"
    description  = "private app subnet az1 cidr block"
    type         = string
  
}

variable "private_app_subnet_az2_cidr" {
    default      = "10.0.3.0/24"
    description  = "private app subnet az2 cidr block"
    type         = string
  
}

variable "private_data_subnet_az1_cidr" {
    default      = "10.0.4.0/24"
    description  = "private data subnet az1 cidr block"
    type         = string
  
}

variable "private_data_subnet_az2_cidr" {
    default      = "10.0.5.0/24"
    description  = "private data subnet az2 cidr block"
    type         = string
  
}

# ALB variables
variable "ssl_certificate_arn" {
  default     = "arn:aws:acm:us-east-1:478253497479:certificate/b391ec4a-c207-41a3-b89e-d5ce079f9954"
  description = "ssl certificate arn"
  type        = string
}

# Database Variables
variable "ssh_location" {
    default      = "0.0.0.0/0"
    description  = "IP Address that can SSH into the EC2 instance "
    type         = string
  
}

variable "database_snapshot_identifier" {
    default      = "arn:aws:rds:us-east-1:70706812456:/snapshot:mysql-final-snapshot"
    description  = "The Database Snapshot ARN "
    type         = string
  
}

variable "db_identifier" {
    default      = "terraform-rds-instance"
    description  = "database identifier "
    type         = string
  
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  default = "securepassword123"
  sensitive = true
}

variable "instance_class" {
  default = "db.t3.micro"
}

variable "allocated_storage" {
  default = 20
}

#Route-53 variables
variable "domain_name" {
    default      = "nb-cloud-architect.com"
    description  = "domain name "
    type         = string
  
}

variable "record_name" {
    default      = "www"
    description  = "sub domain name"
    type         = string
  
}



