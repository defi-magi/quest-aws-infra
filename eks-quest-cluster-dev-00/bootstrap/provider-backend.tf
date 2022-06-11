terraform {
  backend "s3" {
    bucket         = "quest-terraform-remote-state"
    key            = "quest-infra/eks/quest/dev/00/bootstrap/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    kms_key_id     = "fd69cf79-218c-4a9e-8c56-90a25802ffa3"
    dynamodb_table = "tf-remote-state-lock"
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
    bucket     = "quest-terraform-remote-state"
    key        = "quest-infra/eks/quest/dev/00/terraform.tfstate"
    region     = "us-east-1"
    kms_key_id = "fd69cf79-218c-4a9e-8c56-90a25802ffa3"
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
