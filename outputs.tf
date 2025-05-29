
output "runner_instance_public_ip" {
  description = "Public IP of the GitHub Actions runner instance"
  value       = aws_instance.github_runner.public_ip
}
