
resource "aws_instance" "github_runner" {
  ami                  = "ami-08c40ec9ead489470" # Amazon Linux 2
  instance_type        = "t3.micro"
  subnet_id            = aws_subnet.runner_subnet.id
  security_groups      = [aws_security_group.runner_sg.id]
  iam_instance_profile = aws_iam_instance_profile.runner_profile.name
  user_data = templatefile("${path.module}/user_data.sh", {
    GITHUB_TOKEN   = var.github_token
    GH_PAT         = var.gh_pat
    GITHUB_REPO    = var.github_repo
    GH_REPO        = var.github_repo
    GH_OWNER       = var.gh_owner
    RUNNER_VERSION = "2.317.0"
    PLATFORM       = "linux"
    ARCH           = "x64"
  })


  tags = {
    Name = "GitHub Actions Runner"
  }
}
