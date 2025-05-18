locals {
  visibility = var.publicly_visible ? "public" : "private"
}

provider "github" {
  token = var.github_token
}

resource "random_id" "suffix" {
  byte_length = 4
}

resource "github_repository" "lab_repo" {
  name        = var.repository_name
  description = var.repository_description
  visibility  = local.visibility
  auto_init   = true
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "b1-${random_id.suffix.hex}"
  tags = {
    Name = "b1abc"
  }
}

resource "aws_s3_bucket" "my_bucket_west" {
  bucket   = "b2-${random_id.suffix.hex}"
  provider = aws.us-west-2
  tags = {
    Name = "b2abc"
  }
}