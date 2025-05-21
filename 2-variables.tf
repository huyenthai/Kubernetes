variable "resource_group_name" {
  type = string
  description = "The name of the Azure resource group."
}

variable "location" {
  type = string
  description = "The Azure region to deploy resources in."
  default = "wewsteurope"
}

variable "cluster_name" {
  type = string
  description = "The name of the AKS cluster."
}

variable "dns_prefix" {
  type = string
  description = "DNS prefix for the AKS cluster."
}

variable "kubernetes_version" {
  type = string
  description = "The version of Kubernetes to use."
  default = "1.28.3"
}

variable "node_count" {
  type = number
  description = "Number of nodes in the default node pool."
  default = 2
}

variable "vm_size" {
  type = string
  description = "Size of the virtual machines for the node pool."
  default = "Standard_B2s"
}

variable "argocd_namespace" {
  type = string
  description = "Namespace for Argo CD."
  default = "argocd"
}

variable "argocd_chart_version" {
  type = string
  description = "Helm chart version for Argo CD"
  default = "5.46.7"
}

variable "bootstrap_app_name" {
  type = string
  description = "Name of the Argo CD bootstrap Application"
  default = "bootstrap"
}

variable "bootstrap_repo_url" {
  type = string
  description = "Git repository URL for Argo CD bootstrap apps."
}

variable "bootstrap_repo_path" {
  type = string
  description = "Path in the Git repo for bootstrap apps."
  default = "apps"
}

variable "bootstrap_repo_revision" {
  type = string
  description = "Git revision for the bootstrap apps."
  default = "HEAD"
}

variable "subscription_id" {
    type = string
    description = "The subscription ID on which to apply the resources"
    default = "365392ff-b101-4c74-a710-17152ad08a96"
}

variable "app_namespace" {
  type = string
  description = "The namespace for the running application"
  default = "app"
}