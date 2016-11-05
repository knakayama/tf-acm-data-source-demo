resource "aws_route53_zone" "dns" {
  name    = "${var.domain}."
  comment = "${var.comment}"
}

resource "aws_route53_record" "dns" {
  zone_id = "${aws_route53_zone.dns.zone_id}"
  name    = "${aws_s3_bucket.s3.id}"
  type    = "A"

  alias {
    name                   = "${aws_cloudfront_distribution.cf.domain_name}"
    zone_id                = "${aws_cloudfront_distribution.cf.hosted_zone_id}"
    evaluate_target_health = false
  }
}
