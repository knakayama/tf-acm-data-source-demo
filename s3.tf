data "aws_iam_policy_document" "s3" {
  statement {
    sid    = "AddPerm"
    effect = "Allow"

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "arn:aws:s3:::static.${var.domain}/*",
    ]

    principals = {
      type        = "AWS"
      identifiers = ["${aws_cloudfront_origin_access_identity.cf.iam_arn}"]
    }
  }
}

resource "aws_s3_bucket" "s3" {
  bucket        = "static.${var.domain}"
  acl           = "public-read"
  policy        = "${data.aws_iam_policy_document.s3.json}"
  force_destroy = true

  website {
    index_document = "${var.s3_objects[0]}.html"
    error_document = "${var.s3_objects[1]}.html"
  }
}

resource "aws_s3_bucket_object" "s3" {
  count        = "${length(var.s3_objects)}"
  bucket       = "${aws_s3_bucket.s3.id}"
  key          = "${var.s3_objects[count.index]}.html"
  source       = "${path.module}/objects/${var.s3_objects[count.index]}.html"
  content_type = "text/html"
}
