output "policy_arn" {
  description = "ARN of the created IAM policy"
  value       = aws_iam_policy.terraform_admin_policy.arn
}
