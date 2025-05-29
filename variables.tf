
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "github_repo" {
  description = "GitHub repo in format org/repo"
  type        = string
  default     = "ci-sandbox"
}

variable "ghub_token" {
  description = "GitHub PAT for runner registration"
  type        = string
  sensitive   = true
  default     = ""
}

variable "gh_pat" {
  description = "GitHub Personal Access Token for runner registration"
  sensitive   = true
  default     = ""
}

variable "gh_owner" {
  description = "GitHub organization or user name"
  type        = string
  default     = "deepr-devsecops"
}
