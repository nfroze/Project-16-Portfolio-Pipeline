resource "aws_cloudfront_distribution" "portfolio" {
  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"
  aliases             = ["noahfrost.co.uk"]

  origin {
    domain_name = "noahfrost-devsecops.s3-website-us-east-1.amazonaws.com"
    origin_id   = "S3-Website-noahfrost-devsecops.s3-website-us-east-1.amazonaws.com"

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-Website-noahfrost-devsecops.s3-website-us-east-1.amazonaws.com"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000
    compress               = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn = "arn:aws:acm:us-east-1:783764606217:certificate/a3268718-8c18-45eb-8478-10bf7d2583a7"
    ssl_support_method  = "sni-only"
  }
}