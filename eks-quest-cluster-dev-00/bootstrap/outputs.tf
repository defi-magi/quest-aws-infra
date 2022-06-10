output "iam_roles_for_service_accounts_arns" {
  description = "The role ARNs that will be bound to K8s service accounts in order to grant least privilaged access to AWS actions"
  value       = module.argocd_bootstrap.iam_roles_for_service_accounts_arns
}

output "vault_cluster_irsa_role_name" {
  description = "The Vault role that will be used by a EKS ServiceAccount to communicate with AWS Infrastruture"
  value       = aws_iam_role.vault_sa_iam_role.name
}