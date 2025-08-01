resource "aws_route53_zone" "main" {
  name = "noahfrost.co.uk"
}

resource "aws_route53_record" "root" {
  zone_id = aws_route53_zone.main.zone_id
  name    = ""
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.portfolio.domain_name
    zone_id                = aws_cloudfront_distribution.portfolio.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "root_aaaa" {
  zone_id = aws_route53_zone.main.zone_id
  name    = ""
  type    = "AAAA"

  alias {
    name                   = aws_cloudfront_distribution.portfolio.domain_name
    zone_id                = aws_cloudfront_distribution.portfolio.hosted_zone_id
    evaluate_target_health = false
  }
}