terraform {
  backend "s3" {
    bucket         = "deepr-terraform-state"
    key            = "github-runner/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}