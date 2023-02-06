terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.76.1"
    }
  }

  backend "s3" {
    bucket         = "farruh-tfstate"
    key            = "dev/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "part1locktable"
  }

  required_version = "= 1.3.7"
}

provider "aws" {
  profile = "default"
  region  = "eu-central-1"
}


module "my_s3" {
  source          = "../modules/s3"
  s3_bucket_names = ["dev-farruh1-bucket.app", "dev-farruh2-bucket.app", "dev-farruh3-bucket.app"]
}
