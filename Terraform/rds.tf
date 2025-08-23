# create database subnet group
# terraform aws db subnet group
resource "aws_db_subnet_group" "database_subnet_group" {
  name         = "database subnets"
  subnet_ids   = [aws_subnet.private_data_subnet_az1.id,aws_subnet.private_data_subnet_az2.id]
  description  = "subnets for database instance"

  tags   = {
    Name = "database subnets"
  }
}

# get the latest db snapshot
# terraform aws data db snapshot
data "aws_db_snapshot" "latest_db_snapshot" {
  db_snapshot_identifier = var.database_snapshot_identifier
  most_recent            = true
  snapshot_type          = "manual"
}

# create database instance 
# terraform aws db instance
resource "aws_db_instance" "db_instance" {
  engine                  = "mysql"
  engine_version          = "8.0.40"
  multi_az                = false
  identifier              = var.db_identifier
  username                = var.db_username
  password                = var.db_password
  instance_class          = var.instance_class
  allocated_storage       = var.allocated_storage
  db_subnet_group_name    = [aws_db_subnet_group.database_subnet_group]
  vpc_security_group_ids  = [aws_security_group.database_security_group.id]
  availability_zone       = "us-east-1a"
  db_name                 = "applicationdb"
  skip_final_snapshot     = true
}