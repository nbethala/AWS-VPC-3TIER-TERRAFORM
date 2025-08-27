output "vpc_admin_policy_arn" {
  description = "ARN of the VPC admin IAM policy"
  value       = aws_iam_policy.vpc_admin_policy.arn
}
