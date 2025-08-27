#This module will define an IAM policy that allows VPC creation and management.
resource "aws_iam_policy" "vpc_admin_policy" {
  name        = var.policy_name
  description = "IAM policy for VPC creation and management via Terraform"
  policy      = data.aws_iam_policy_document.vpc_admin.json
}

data "aws_iam_policy_document" "vpc_admin" {
  statement {
    sid    = "AllowVPCManagement"
    effect = "Allow"

    actions = [
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
      "ec2:CreateSecurityGroup",
      "ec2:AuthorizeSecurityGroupIngress",
      "ec2:AuthorizeSecurityGroupEgress"
    ]

    resources = ["*"]
  }
}

