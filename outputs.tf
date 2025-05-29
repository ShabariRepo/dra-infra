
output "runner_instance_public_ip" {
  description = "Public IP of the GitHub Actions runner instance"
  value       = aws_instance.github_runner.public_ip
}

output "runner_iam_role_arn" {
  value       = aws_iam_role.runner_role.arn
  description = "IAM Role ARN assigned to the GitHub Actions runner"
}
