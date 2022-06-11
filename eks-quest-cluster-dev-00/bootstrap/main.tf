module "argocd_bootstrap" {
  source                            = "git::git@github.com:defi-magi/quest-eks-modules.git//core-bootstrap"
  common_tags                       = var.common_tags
  tags                              = var.tags
  eks_oidc_provider_arn             = data.terraform_remote_state.cluster_core.outputs.eks_cluster_full_outputs.oidc_provider_arn
  argocd_admin_password_secret_name = var.argocd_admin_password_secret_name
  argocd_applications               = var.argocd_applications
  external_dns_irsa                 = var.external_dns_irsa
  cert_manager_irsa                 = var.cert_manager_irsa
  external_secrets_irsa             = var.external_secrets_irsa
}
