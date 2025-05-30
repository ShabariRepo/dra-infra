
output "runner_instance_public_ip" {
  description = "Public IP of the GitHub Actions runner instance"
  value       = aws_instance.github_runner.public_ip
}

output "runner_iam_role_arn" {
  value       = aws_iam_role.runner_role.arn
  description = "IAM Role ARN assigned to the GitHub Actions runner"
}

# -------

output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.this.name
}

output "eks_cluster_endpoint" {
  description = "EKS API server endpoint"
  value       = aws_eks_cluster.this.endpoint
}

output "eks_cluster_ca_certificate" {
  description = "Base64 encoded certificate data required to communicate with the cluster"
  value       = aws_eks_cluster.this.certificate_authority[0].data
}

output "eks_cluster_region" {
  description = "Region where the EKS cluster is deployed"
  value       = var.aws_region
}

output "eks_node_group_name" {
  description = "EKS managed node group name"
  value       = aws_eks_node_group.this.node_group_name
}
