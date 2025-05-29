
resource "aws_iam_role" "runner_role" {
  name = "github-actions-runner-rolex"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_instance_profile" "runner_profile" {
  name = "github-actions-runner-profilex"
  role = aws_iam_role.runner_role.name
}
