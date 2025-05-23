
provider "github" {
  token = var.github_token
}

terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}


resource "github_repository" "example" {
  name        = var.repository_name
  description = var.repository_description
  visibility  = "private"
  auto_init   = true
}