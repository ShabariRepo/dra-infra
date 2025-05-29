
resource "aws_vpc" "runner_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "runner_subnet" {
  vpc_id                  = aws_vpc.runner_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

resource "aws_security_group" "runner_sg" {
  name        = "runner-sg"
  description = "Allow SSH & GitHub Actions traffic"
  vpc_id      = aws_vpc.runner_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
