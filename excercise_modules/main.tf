terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    region = "us-east-1"
    bucket = "tf-state-agh-lab-mj"
    key    = "tf-state-agh-lab-mj/terraform-modules.tfstate"
  }

}

provider "aws" {
  region = var.regions[0]
}


provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}


provider "aws" {
  alias  = "us-west-2"
  region = "us-west-2"
}
