data "aws_route53_zone" "zone" {
  name = "${var.domain}."
  private_zone = false
}

resource "aws_acm_certificate" "example" {
  domain_name               = var.gateway_domain
  validation_method         = "DNS"
}

resource "aws_route53_record" "example" {
  for_each = {
    for dvo in aws_acm_certificate.example.domain_validation_options : dvo.domain_name => {
      name    = dvo.resource_record_name
      record  = dvo.resource_record_value
      type    = dvo.resource_record_type
      zone_id = data.aws_route53_zone.zone.zone_id
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = each.value.zone_id
}

resource "aws_acm_certificate_validation" "example" {
  certificate_arn         = aws_acm_certificate.example.arn
  validation_record_fqdns = [for record in aws_route53_record.example : record.fqdn]
}

resource "aws_route53_record" "record" {
  name    = aws_api_gateway_domain_name.gateway_domain_name.domain_name
  type    = "A"
  zone_id = data.aws_route53_zone.zone.id

  alias {
    evaluate_target_health = true
    name                   = aws_api_gateway_domain_name.gateway_domain_name.regional_domain_name
    zone_id                = aws_api_gateway_domain_name.gateway_domain_name.regional_zone_id
  }
}