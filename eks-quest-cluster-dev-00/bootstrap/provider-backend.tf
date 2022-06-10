terraform {
  backend "s3" {
    role_arn       = "arn:aws:iam::0000000000:role/1111111111-terraform-state-access"
    acl            = "bucket-owner-full-control"
    bucket         = "shinra-terraform-remote-state"
    dynamodb_table = "shinra-terraform-remote-state"
    encrypt        = true
    key            = "1111111111/security-tooling/dev/kubernetes/cluster-00/bootstrap/terraform.tfstate"
    kms_key_id     = "arn:aws:kms:us-east-1:0000000000:alias/shinra-terraform-remote-state-backend-1111111111"
    region         = "us-east-1"
  }
}

provider "aws" {
  default_tags {
    tags = var.common_tags
  }
}

data "terraform_remote_state" "cluster_core" {
  backend = "s3"
  config = {
    role_arn   = "arn:aws:iam::0000000000:role/1111111111-terraform-state-access"
    bucket     = "shinra-terraform-remote-state"
    key        = "1111111111/security-tooling/dev/kubernetes/cluster-${var.common_tags.Index}/terraform.tfstate"
    kms_key_id = "arn:aws:kms:us-east-1:0000000000:alias/shinra-terraform-remote-state-backend-1111111111"
    region     = "us-east-1"
  }
}

#---------------------------------------------------------------------------------------------------
# EKS Cluster Data
# This is used for provider configurations
#---------------------------------------------------------------------------------------------------
data "aws_eks_cluster_auth" "cluster" {
  name = data.terraform_remote_state.cluster_core.outputs.eks_cluster_full_outputs.cluster_id
}

provider "kubernetes" {
  host                   = data.terraform_remote_state.cluster_core.outputs.eks_cluster_full_outputs.cluster_endpoint
  cluster_ca_certificate = base64decode(data.terraform_remote_state.cluster_core.outputs.eks_cluster_full_outputs.cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

provider "helm" {
  kubernetes {
    host                   = data.terraform_remote_state.cluster_core.outputs.eks_cluster_full_outputs.cluster_endpoint
    cluster_ca_certificate = base64decode(data.terraform_remote_state.cluster_core.outputs.eks_cluster_full_outputs.cluster_certificate_authority_data)
    exec {
      api_version = "client.authentication.k8s.io/v1alpha1"
      args        = ["eks", "get-token", "--cluster-name", data.terraform_remote_state.cluster_core.outputs.eks_cluster_full_outputs.cluster_id]
      command     = "aws"
    }
  }
}