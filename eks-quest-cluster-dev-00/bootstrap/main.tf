module "argocd_bootstrap" {
  source                            = "git::ssh://source.shinra.com/aws-terraform-infra/aws-shinra-k8s-modules//core-bootstrap?ref=v1.0.2"
  common_tags                       = var.common_tags
  tags                              = var.tags
  eks_oidc_provider_arn             = data.terraform_remote_state.cluster_core.outputs.eks_cluster_full_outputs.oidc_provider_arn
  argocd_admin_password_secret_name = var.argocd_admin_password_secret_name
  argocd_applications               = var.argocd_applications
  external_dns_irsa                 = var.external_dns_irsa
  cert_manager_irsa                 = var.cert_manager_irsa
  external_secrets_irsa             = var.external_secrets_irsa
}

#---------------------------------------------------------------------------------------------------
# AWS Vault Service Account IAM & EKS
# This service account will be used to provide least privilaged access to Vault infrastructure from
# the Vault Pods from within the cluster
#---------------------------------------------------------------------------------------------------
locals {
  vault_cluster_role_name = format("%s-%s-%s-%s-%s", var.common_tags.application-id, var.common_tags.project, "cluster", "vault-cluster", var.common_tags.index)
}

data "aws_iam_policy_document" "vault_sa_role_trust_policy_document" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      values   = ["system:serviceaccount:vault:vault-irsa"]
      variable = "${replace(data.terraform_remote_state.cluster_core.outputs.eks_cluster_full_outputs.cluster_oidc_issuer_url, "https://", "")}:sub"
    }

    principals {
      identifiers = [data.terraform_remote_state.cluster_core.outputs.eks_cluster_full_outputs.oidc_provider_arn]
      type        = "Federated"
    }
  }
}

resource "aws_iam_role" "vault_sa_iam_role" {
  name               = "${local.vault_cluster_role_name}-vault-irsa-role" #TODO: DR: Make unique, append -dr to project 
  path               = "/vault/"
  assume_role_policy = data.aws_iam_policy_document.vault_sa_role_trust_policy_document.json
}

resource "kubernetes_namespace" "vault" {
  metadata {
    annotations = {}
    labels = {
      "kubernetes.io/metadata.name" = "vault"
    }
    name = "vault"
  }

  lifecycle {
    ignore_changes = [metadata]
  }
}

resource "kubernetes_service_account" "vault_sa_iam" {
  metadata {
    name      = "vault-irsa"
    namespace = "vault"

    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.vault_sa_iam_role.arn
    }
  }
}
