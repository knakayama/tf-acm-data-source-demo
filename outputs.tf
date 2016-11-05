output "fqdn" {
  value = "${aws_route53_record.dns.fqdn}"
}

output "cf_id" {
  value = "${aws_cloudfront_distribution.cf.id}"
}
