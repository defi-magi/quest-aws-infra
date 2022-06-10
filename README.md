# Quest AWS Infra
This repository contains the Terraform code that's used to host the Quest application stack.

![Terraform Kubernetes](./static/terraform-kubernetes.png)

## Inventory
| Name | Description |
|---|---|
| [core-bootstrap](./core-bootstrap/README.md) | Bootstraps the cluster with ArgoCD and IRSA config |
| [argocd](./argocd/README.md) | Uses Helm and YAML manifests to provision ArgoCD and Apps |
| [eks-core](./eks-core/README.md) | Deploys EKS, Node Groups, and ArgoCD |
| [helm](./helm/README.md) | Helm helper module |