variable "github_token" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true
}

variable "repository_name" {
  description = "ID_Lab_TF"
  type        = string
  default     = "terraform-managed-repo"
}

variable "repository_description" {
  description = "ID_Lab_TF desc"
  type        = string
  default     = "Repository managed by Terraform"
}


variable "publicly_visible" {
  description = "publicly_visible GH repo"
  type        = bool
  default     = true
}

variable "regions" {
  type    = list(string)
  default = ["us-east-1", "us-west-2", "eu-central-1"]
}

variable "bucket_name_prefix" {
  type    = string
  default = "multi-region-bucket"
}

