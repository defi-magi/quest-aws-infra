# EKS Core
Base EKS cluster with node groups.

Please reference the [eks-core module README](https://github.com/defi-magi/quest-eks-modules/tree/main/eks-core) for more details.

## Generated Documentation
<!-- BEGIN_TF_DOCS -->

# Providers

No providers.
# Requirements

No requirements.
# Modules

| Name | Source | Version |
|------|--------|---------|
| eks_00 | git::git@github.com:defi-magi/quest-eks-modules.git//eks-core | n/a |
# Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| aws_auth_config | Configure AWS SSO based authentication for EKS clusters | `any` | `null` |
| cluster_log_types | A list of desired control plane logging to enable | `list(string)` | n/a |
| common_tags | Tags applied at the AWS provider level that apply to all resources | `map(string)` | n/a |
| control_plane_api_allow_list_cidrs | The CIDR blocks that are permitted to access the control plane API | `list(string)` | n/a |
| instance_types | A list of instance types for the Managed Node Group | `list(string)` | n/a |
| k8s_version | kubernetes cluster version | `string` | n/a |
| managed_node_groups | The node groups that will be provisioned for the EKS cluster | `map(any)` | n/a |
| subnet_ids | list of private subnets | `list(string)` | `null` |
| tags | Specific tags that apply to the workloads | `map(string)` | `null` |
| vpc_id | vpc ID | `string` | `null` |
# Outputs

| Name | Description |
|------|-------------|
| eks_cluster_endpoint | The endpoint of the cluster |
| eks_cluster_full_outputs | The full ouputs from the eks cluster module |
| eks_cluster_id | The name of the cluster |
| iam_roles_for_service_accounts_arns | The role ARNs that will be bound to K8s service accounts in order to grant least privilaged access to AWS actions |
# Resources

No resources.

<!-- END_TF_DOCS -->