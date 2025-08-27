# configure aws provider
provider "aws" {
  region = "us-east-1"
}

# stores the terraform state file in s3
terraform {
  backend "s3" {
    bucket = "nb-terraform-remote-state"
    key    = "terraform.tfstate.dev"
    region = "us-east-1"

  }
}

#IAM Policy Module for Terraform Provisioning
module "terraform_admin_policy" {
  source      = "./modules/iam-policy-terraform-admin"
  policy_name = "TerraformAdminPolicy"
}

#attaches the generated policy to IAM user (terraform-admin)
resource "aws_iam_user_policy_attachment" "terraform_admin_attachment" {
  user       = "terraform-admin"
  policy_arn = module.terraform_admin_policy.policy_arn
}

#IAM policy that allows VPC creation and management
module "vpc_admin_policy" {
  source      = "./modules/iam-policy-vpc-admin"
  policy_name = "TerraformVPCAdminPolicy"
}

resource "aws_iam_user_policy_attachment" "attach_vpc_policy" {
  user       = "terraform-admin"
  policy_arn = module.vpc_admin_policy.vpc_admin_policy_arn
}



