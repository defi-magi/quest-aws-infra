module "eks_00" {
  source                             = "git::git@github.com:defi-magi/quest-eks-modules.git//eks-core?ref=v1.0.0"
  common_tags                        = var.common_tags
  tags                               = var.tags
  k8s_version                        = var.k8s_version
  vpc_id                             = var.vpc_id
  subnet_ids                         = var.subnet_ids
  control_plane_api_allow_list_cidrs = var.control_plane_api_allow_list_cidrs
  instance_types                     = var.instance_types
  cluster_log_types                  = var.cluster_log_types
  aws_auth_config                    = var.aws_auth_config
  managed_node_groups                = var.managed_node_groups
}
