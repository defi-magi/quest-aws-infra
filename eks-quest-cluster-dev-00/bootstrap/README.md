# EKS Core
Bootstraps ArgoCD and IRSA roles to the cluster and points the cluster to a repository for configuration sync using an ArgoCD app of apps pattern.

Please reference the [core-bootstrap module README](https://github.com/defi-magi/quest-eks-modules/tree/main/core-bootstrap) for more details.

## Generated Documentation
<!-- BEGIN_TF_DOCS -->

# Providers

| Name | Version |
|------|---------|
| aws | n/a |
| terraform | n/a |
# Requirements

No requirements.
# Modules

| Name | Source | Version |
|------|--------|---------|
| argocd_bootstrap | git::git@github.com:defi-magi/quest-eks-modules.git//core-bootstrap | n/a |
# Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| argocd_admin_password_secret_name | Name for a secret stored in AWS Secrets Manager that contains the admin password for ArgoCD. | `string` | `""` |
| argocd_applications | Argo CD Applications config to bootstrap the cluster | `any` | `{}` |
| argocd_helm_config | Argo CD Kubernetes add-on config | `any` | `{}` |
| cert_manager_irsa | The hosted zone ARNs that cert manager is allowed to manage in order to create TXT records for domain validation | `map(any)` | `null` |
| common_tags | Tags applied at the AWS provider level that apply to all resources | `map(string)` | n/a |
| external_dns_irsa | The hosted zone ARNs that external DNS is allowed to manage in order to create DNS records | `map(any)` | `null` |
| external_secrets_irsa | Secret mgr or ssm ARNs that external secrets operator is allowed to read in order to create secrets in k8s | `any` | `null` |
| tags | Specific tags that apply to the workloads | `map(string)` | `null` |
# Outputs

| Name | Description |
|------|-------------|
| iam_roles_for_service_accounts_arns | The role ARNs that will be bound to K8s service accounts in order to grant least privilaged access to AWS actions |
# Resources

| Name | Type |
|------|------|
| [aws_eks_cluster_auth.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |
| [terraform_remote_state.cluster_core](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

<!-- END_TF_DOCS -->