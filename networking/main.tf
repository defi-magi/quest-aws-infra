# -------------------------------------------------------------- #
# VPC ACLs
# -------------------------------------------------------------- #
locals {
  network_acls = {
    public_inbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number = 110
        rule_action = "allow"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number     = 120
        rule_action     = "allow"
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        ipv6_cidr_block = "::/0"
      },
      {
        rule_number     = 130
        rule_action     = "allow"
        from_port       = 443
        to_port         = 443
        protocol        = "tcp"
        ipv6_cidr_block = "::/0"
      }
    ]
    public_outbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number = 110
        rule_action = "allow"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number = 130
        rule_action = "allow"
        icmp_code   = -1
        icmp_type   = 8
        protocol    = "icmp"
        cidr_block  = "10.0.0.0/22"
      },
    ]
  }
}

# -------------------------------------------------------------- #
# VPC Module
# -------------------------------------------------------------- #
module "vpc" {
  source = "git@github.com:terraform-aws-modules/terraform-aws-vpc.git?ref=v3.14.0"

  name = "quest-vpc-dev-00"
  cidr = "10.0.0.0/16"

  azs             = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  public_dedicated_network_acl = true
  public_inbound_acl_rules     = local.network_acls.public_inbound
  #public_outbound_acl_rules      = local.network_acls.public_outbound

  enable_nat_gateway = true
  single_nat_gateway = false
  create_igw         = true

  manage_default_route_table = true
  enable_dns_hostnames       = true
  enable_dns_support         = true

  public_subnet_tags = {
    "kubernetes.io/role/elb"                         = "1"
    "kubernetes.io/cluster/eks-quest-cluster-dev-00" = "owned"
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb"                = "1"
    "kubernetes.io/cluster/eks-quest-cluster-dev-00" = "owned"
  }
}