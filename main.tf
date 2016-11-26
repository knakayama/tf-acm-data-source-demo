provider "aws" {
  region = "${var.regions["tokyo"]}"
}

provider "aws" {
  alias  = "us-east-1"
  region = "${var.regions["virginia"]}"
}
