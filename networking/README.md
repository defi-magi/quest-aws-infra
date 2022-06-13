# Quest Networking
This module is used to create networking for the Quest project. The high level components are:

- Route53 zone that is delegated for quest.defimagi.com domain
- VPC

## Generated Documentation
<!-- BEGIN_TF_DOCS -->

# Providers

| Name | Version |
|------|---------|
| aws | = 4.18.0 |
# Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.2.2 |
| aws | = 4.18.0 |
# Modules

| Name | Source | Version |
|------|--------|---------|
| vpc | git@github.com:terraform-aws-modules/terraform-aws-vpc.git | v3.14.0 |
# Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| common_tags | Key/value tags that will be applied to the resources. | `map(any)` | `null` |
| region | The AWS region in which resources are set up. | `string` | `"us-east-1"` |
# Outputs

| Name | Description |
|------|-------------|
| cgw_arns | List of ARNs of Customer Gateway |
| cgw_ids | List of IDs of Customer Gateway |
| database_internet_gateway_route_id | ID of the database internet gateway route |
| database_ipv6_egress_route_id | ID of the database IPv6 egress route |
| database_nat_gateway_route_ids | List of IDs of the database nat gateway route |
| database_network_acl_arn | ARN of the database network ACL |
| database_network_acl_id | ID of the database network ACL |
| database_route_table_association_ids | List of IDs of the database route table association |
| database_route_table_ids | List of IDs of database route tables |
| database_subnet_arns | List of ARNs of database subnets |
| database_subnet_group | ID of database subnet group |
| database_subnet_group_name | Name of database subnet group |
| database_subnets | List of IDs of database subnets |
| database_subnets_cidr_blocks | List of cidr_blocks of database subnets |
| database_subnets_ipv6_cidr_blocks | List of IPv6 cidr_blocks of database subnets in an IPv6 enabled VPC |
| default_network_acl_id | The ID of the default network ACL |
| default_route_table_id | The ID of the default route table |
| default_security_group_id | The ID of the security group created by default on VPC creation |
| default_vpc_arn | The ARN of the Default VPC |
| default_vpc_cidr_block | The CIDR block of the Default VPC |
| default_vpc_default_network_acl_id | The ID of the default network ACL of the Default VPC |
| default_vpc_default_route_table_id | The ID of the default route table of the Default VPC |
| default_vpc_default_security_group_id | The ID of the security group created by default on Default VPC creation |
| default_vpc_enable_dns_hostnames | Whether or not the Default VPC has DNS hostname support |
| default_vpc_enable_dns_support | Whether or not the Default VPC has DNS support |
| default_vpc_id | The ID of the Default VPC |
| default_vpc_instance_tenancy | Tenancy of instances spin up within Default VPC |
| default_vpc_main_route_table_id | The ID of the main route table associated with the Default VPC |
| dhcp_options_id | The ID of the DHCP options |
| egress_only_internet_gateway_id | The ID of the egress only Internet Gateway |
| elasticache_network_acl_arn | ARN of the elasticache network ACL |
| elasticache_network_acl_id | ID of the elasticache network ACL |
| elasticache_route_table_association_ids | List of IDs of the elasticache route table association |
| elasticache_route_table_ids | List of IDs of elasticache route tables |
| elasticache_subnet_arns | List of ARNs of elasticache subnets |
| elasticache_subnet_group | ID of elasticache subnet group |
| elasticache_subnet_group_name | Name of elasticache subnet group |
| elasticache_subnets | List of IDs of elasticache subnets |
| elasticache_subnets_cidr_blocks | List of cidr_blocks of elasticache subnets |
| elasticache_subnets_ipv6_cidr_blocks | List of IPv6 cidr_blocks of elasticache subnets in an IPv6 enabled VPC |
| igw_arn | The ARN of the Internet Gateway |
| igw_id | The ID of the Internet Gateway |
| intra_network_acl_arn | ARN of the intra network ACL |
| intra_network_acl_id | ID of the intra network ACL |
| intra_route_table_association_ids | List of IDs of the intra route table association |
| intra_route_table_ids | List of IDs of intra route tables |
| intra_subnet_arns | List of ARNs of intra subnets |
| intra_subnets | List of IDs of intra subnets |
| intra_subnets_cidr_blocks | List of cidr_blocks of intra subnets |
| intra_subnets_ipv6_cidr_blocks | List of IPv6 cidr_blocks of intra subnets in an IPv6 enabled VPC |
| nat_ids | List of allocation ID of Elastic IPs created for AWS NAT Gateway |
| nat_public_ips | List of public Elastic IPs created for AWS NAT Gateway |
| natgw_ids | List of NAT Gateway IDs |
| outpost_network_acl_arn | ARN of the outpost network ACL |
| outpost_network_acl_id | ID of the outpost network ACL |
| outpost_subnet_arns | List of ARNs of outpost subnets |
| outpost_subnets | List of IDs of outpost subnets |
| outpost_subnets_cidr_blocks | List of cidr_blocks of outpost subnets |
| outpost_subnets_ipv6_cidr_blocks | List of IPv6 cidr_blocks of outpost subnets in an IPv6 enabled VPC |
| private_ipv6_egress_route_ids | List of IDs of the ipv6 egress route |
| private_nat_gateway_route_ids | List of IDs of the private nat gateway route |
| private_network_acl_arn | ARN of the private network ACL |
| private_network_acl_id | ID of the private network ACL |
| private_route_table_association_ids | List of IDs of the private route table association |
| private_route_table_ids | List of IDs of private route tables |
| private_subnet_arns | List of ARNs of private subnets |
| private_subnets | List of IDs of private subnets |
| private_subnets_cidr_blocks | List of cidr_blocks of private subnets |
| private_subnets_ipv6_cidr_blocks | List of IPv6 cidr_blocks of private subnets in an IPv6 enabled VPC |
| public_internet_gateway_ipv6_route_id | ID of the IPv6 internet gateway route |
| public_internet_gateway_route_id | ID of the internet gateway route |
| public_network_acl_arn | ARN of the public network ACL |
| public_network_acl_id | ID of the public network ACL |
| public_route_table_association_ids | List of IDs of the public route table association |
| public_route_table_ids | List of IDs of public route tables |
| public_subnet_arns | List of ARNs of public subnets |
| public_subnets | List of IDs of public subnets |
| public_subnets_cidr_blocks | List of cidr_blocks of public subnets |
| public_subnets_ipv6_cidr_blocks | List of IPv6 cidr_blocks of public subnets in an IPv6 enabled VPC |
| quest_defi_magi_delegation_set | DNS |
| quest_route53_zone | n/a |
| redshift_network_acl_arn | ARN of the redshift network ACL |
| redshift_network_acl_id | ID of the redshift network ACL |
| redshift_public_route_table_association_ids | List of IDs of the public redshidt route table association |
| redshift_route_table_association_ids | List of IDs of the redshift route table association |
| redshift_route_table_ids | List of IDs of redshift route tables |
| redshift_subnet_arns | List of ARNs of redshift subnets |
| redshift_subnet_group | ID of redshift subnet group |
| redshift_subnets | List of IDs of redshift subnets |
| redshift_subnets_cidr_blocks | List of cidr_blocks of redshift subnets |
| redshift_subnets_ipv6_cidr_blocks | List of IPv6 cidr_blocks of redshift subnets in an IPv6 enabled VPC |
| this_customer_gateway | Map of Customer Gateway attributes |
| vgw_arn | The ARN of the VPN Gateway |
| vgw_id | The ID of the VPN Gateway |
| vpc_arn | The ARN of the VPC |
| vpc_cidr_block | The CIDR block of the VPC |
| vpc_enable_dns_hostnames | Whether or not the VPC has DNS hostname support |
| vpc_enable_dns_support | Whether or not the VPC has DNS support |
| vpc_flow_log_cloudwatch_iam_role_arn | The ARN of the IAM role used when pushing logs to Cloudwatch log group |
| vpc_flow_log_destination_arn | The ARN of the destination for VPC Flow Logs |
| vpc_flow_log_destination_type | The type of the destination for VPC Flow Logs |
| vpc_flow_log_id | The ID of the Flow Log resource |
| vpc_id | The ID of the VPC |
| vpc_instance_tenancy | Tenancy of instances spin up within VPC |
| vpc_ipv6_association_id | The association ID for the IPv6 CIDR block |
| vpc_ipv6_cidr_block | The IPv6 CIDR block |
| vpc_main_route_table_id | The ID of the main route table associated with this VPC |
| vpc_owner_id | The ID of the AWS account that owns the VPC |
| vpc_secondary_cidr_blocks | List of secondary CIDR blocks of the VPC |
# Resources

| Name | Type |
|------|------|
| [aws_route53_delegation_set.main](https://registry.terraform.io/providers/hashicorp/aws/4.18.0/docs/resources/route53_delegation_set) | resource |
| [aws_route53_record.test](https://registry.terraform.io/providers/hashicorp/aws/4.18.0/docs/resources/route53_record) | resource |
| [aws_route53_zone.main](https://registry.terraform.io/providers/hashicorp/aws/4.18.0/docs/resources/route53_zone) | resource |

<!-- END_TF_DOCS -->