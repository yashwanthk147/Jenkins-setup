terraform {
  backend "s3" {
    bucket = "tf-userbkt"
    key    = "Jenkins-State-files/terraform.tfstate"
    region = "us-east-1"
  }
}