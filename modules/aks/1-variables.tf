variable "resource_group_name" {
  type = string
  description = "The name of the resource group"
}

variable "location" {
  type = string
  description = "The Azure region to deploy to"
}

variable "cluster_name" {
  type = string
  description = "The name of the AKS cluster"
}

variable "dns_prefix" {
  type = string
  description = "The version of Kubernetes to use."
}

variable "kubernetes_version" {
  type = string
  description = "The version of Kubernetes to use."
  default = "1.28.3"
}

variable "node_count" {
  type = number
  description = "The initial number of nodes in the default node pool."
  default = 2
}

variable "vm_size" {
  type = string
  description = "The size of the virtual machines in the default node pool."
  default = "Standard_B2s"
}