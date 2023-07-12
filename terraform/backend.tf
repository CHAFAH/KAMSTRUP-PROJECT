terraform {
  backend "s3" {
    bucket = "kops233"
    key    = "terraform/backend"
    region = "us-east-2"
  }
}