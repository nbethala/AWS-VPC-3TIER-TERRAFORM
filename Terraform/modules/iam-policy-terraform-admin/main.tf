#This module defines a reusable IAM policy that grants Terraform permissions to provision 
#core AWS networking resources, including VPCs, subnets, NAT gateways, and Elastic IPs. 
#It supports modular infrastructure-as-code workflows and aligns with least-privilege principles.
resource "aws_iam_policy" "terraform_admin_policy" {
  name        = var.policy_name
  description = "Policy for Terraform provisioning EC2, VPC, and networking resources"
  policy      = data.aws_iam_policy_document.terraform_admin.json
}

resource "aws_iam_policy" "terraform_execution_policy" {
  name        = "TerraformExecutionPolicy"
  description = "Allows Terraform to manage IAM policies including reading policy versions"
  path        = "/"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowGetPolicyVersion"
        Effect = "Allow"
        Action = [
          "iam:GetPolicyVersion"
        ]
        Resource = "arn:aws:iam::478253497479:policy/TerraformVPCAdminPolicy"
      },
      {
        Sid    = "AllowBasicIAMRead"
        Effect = "Allow"
        Action = [
          "iam:ListPolicies",
          "iam:GetPolicy",
          "iam:ListPolicyVersions"
        ]
        Resource = "*"
      }
    ]
  })
}

#attach AWS IAM user policy to terraform-admin
resource "aws_iam_user_policy_attachment" "attach_terraform_policy" {
  user       = "terraform-admin"
  policy_arn = aws_iam_policy.terraform_execution_policy.arn
}

data "aws_iam_policy_document" "terraform_admin" {
  statement {
    sid    = "EC2Provisioning"
    effect = "Allow"

    actions = [
      "ec2:CreateVpc",
      "ec2:CreateSubnet",
      "ec2:CreateInternetGateway",
      "ec2:AttachInternetGateway",
      "ec2:CreateRouteTable",
      "ec2:AssociateRouteTable",
      "ec2:CreateNatGateway",
      "ec2:AllocateAddress",
      "ec2:Describe*",
      "ec2:ModifyVpcAttribute"
    ]

    resources = ["*"]
  }
}

resource "aws_iam_policy" "vpc_admin_policy" {
  name        = "TerraformVPCAdminPolicyv2"
  description = "Allows VPC creation and NAT Gateway setup"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:CreateVpc",
          "ec2:DeleteVpc",
          "ec2:DescribeVpcs",
          "ec2:CreateSubnet",
          "ec2:DeleteSubnet",
          "ec2:DescribeSubnets",
          "ec2:CreateRouteTable",
          "ec2:AssociateRouteTable",
          "ec2:CreateInternetGateway",
          "ec2:AttachInternetGateway",
          "ec2:CreateNatGateway",
          "ec2:DescribeNatGateways",
          "ec2:AllocateAddress",
          "ec2:DescribeAddresses",
          "ec2:CreateSecurityGroup",
          "ec2:AuthorizeSecurityGroupIngress",
          "ec2:AuthorizeSecurityGroupEgress"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "iam:ListPolicyVersions",
          "iam:GetPolicyVersion"
        ]
        Resource = [
          "arn:aws:iam::478253497479:policy/TerraformAdminPolicy",
          "arn:aws:iam::478253497479:policy/TerraformVPCAdminPolicy"
        ]
      }
    ]
  })
}
