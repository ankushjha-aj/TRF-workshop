terraform {
  backend "s3" {
    bucket = "tf-bucket-tfstate"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
