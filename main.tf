provider "aws" {
  region = "${var.regions["tokyo"]}"
}

provider "aws" {
  alias  = "us-west-1"
  region = "${var.regions["virginia"]}"
}
