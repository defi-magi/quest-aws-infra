output "iam_roles_for_service_accounts_arns" {
  description = "The role ARNs that will be bound to K8s service accounts in order to grant least privilaged access to AWS actions"
  value       = module.argocd_bootstrap.iam_roles_for_service_accounts_arns
}
