# -------------------------------------------------------------- #
# Domain Delegation
# -------------------------------------------------------------- #
resource "aws_route53_delegation_set" "main" {
  reference_name = "quest"
}

resource "aws_route53_zone" "main" {
  name              = "quest.defimagi.com"
  delegation_set_id = aws_route53_delegation_set.main.id
}

resource "aws_route53_record" "test" {
  allow_overwrite = true
  name            = "test"
  ttl             = 60
  type            = "A"
  records         = ["8.8.8.8"]
  zone_id         = aws_route53_zone.main.zone_id
}