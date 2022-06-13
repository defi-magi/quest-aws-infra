#---------------------------------------------------------------------------------------------------
# Example variables file, please review each of these variables and update as necessary
#---------------------------------------------------------------------------------------------------
common_tags = {
  application-id = "eks"
  project        = "quest"
  index          = "00"
  team           = "For the Horde"
  environment    = "dev"
  automated-by   = "terraform"
  created-by     = "Alex"
}

# Argo expects the admin password in the secret to be bcrypt hashed. You can create this hash with
# `htpasswd -nbBC 10 "" $ARGO_PWD | tr -d ':\n' | sed 's/$2y/$2a/'`
# The secret is pre-populated and stored in AWS Secrets Manager
argocd_admin_password_secret_name = "eks-quest-cluster-dev-00-argocd-admin-password"

argocd_applications = {
  core_bootstrap = {
    name            = "bootstrap"
    path            = "environments"
    repo_url        = "git@github.com:defi-magi/quest-eks-cluster-state.git"
    project         = "default" # don't change unless you know what you're doing
    release_name    = "core-bootstrap"
    target_revision = "HEAD"                           # don't change unless you know what you're doing
    destination     = "https://kubernetes.default.svc" # don't change unless you know what you're doing
    # AWS Secret Manager secret name which contains the SSH key used to access the repo, this secret is pre-populated and should be created per repository
    repo_secret_name = "quest-eks-cluster-state-repo-ssh-key"
    # See all possible ArgoCD values here: https://github.com/argoproj/argo-helm/blob/main/charts/argo-cd/values.yaml
    helm_values = {}
  }
}

external_dns_irsa = {
  hosted_zone_arns     = ["arn:aws:route53:::hostedzone/Z04406002J0F1ZZMSCXJW"]
  k8s_service_accounts = ["external-dns:external-dns-irsa"]
}

cert_manager_irsa = {
  hosted_zone_arns     = ["arn:aws:route53:::hostedzone/Z04406002J0F1ZZMSCXJW"]
  k8s_service_accounts = ["cert-manager:cert-manager-irsa"]
}

external_secrets_irsa = {
  deploy_role          = true
  ssm_parameter_arns   = ["*"]
  secrets_manager_arns = ["arn:aws:secretsmanager:us-east-1:092467136106:secret:quest-node-app-rearc-secret-pV8V17"]
  k8s_service_accounts = ["external-secrets:external-secrets-irsa"]
}
