variable "name" {
  default = "tf-acm-data-source-demo"
}

variable "regions" {
  default = {
    tokyo    = "ap-northeast-1"
    virginia = "us-east-1"
  }
}

variable "domain" {}

variable "comment" {}

variable "s3_objects" {
  default = [
    "index",
    "error",
  ]
}

data "aws_acm_certificate" "acm" {
  provider = "aws.us-west-1"
  domain   = "*.${var.domain}"
}
