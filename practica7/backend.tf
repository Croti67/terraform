terraform {
  required_version = ">= 0.12.2"

  backend "s3" {
    region         = "us-east-1"
    bucket         = "ejemplo-us-east-1-prod-terraformvr3-state"
    key            = "terraform.tfstate"
    dynamodb_table = "ejemplo-us-east-1-prod-terraformvr3-state-lock"
    profile        = ""
    encrypt        = "true"
  }
}
