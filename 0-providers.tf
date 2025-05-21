terraform {
  required_version = ">=1.4.0"
  required_providers {
    kubectl = {
      source = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">=3.80.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">=2.27.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = ">= 2.13.1"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

provider "kubernetes" {
  host = module.aks.kube_host
  client_certificate = base64decode(module.aks.kube_client_certificate)
  client_key = base64decode(module.aks.kube_client_key)
  cluster_ca_certificate = base64decode(module.aks.kube_cluster_ca)
}

provider "kubectl" {
  load_config_file       = false
  host = module.aks.kube_host
  client_certificate = base64decode(module.aks.kube_client_certificate)
  client_key = base64decode(module.aks.kube_client_key)
  cluster_ca_certificate = base64decode(module.aks.kube_cluster_ca)
}

provider "helm" {
  kubernetes {
    host = module.aks.kube_host
    client_certificate = base64decode(module.aks.kube_client_certificate)
    client_key = base64decode(module.aks.kube_client_key)
    cluster_ca_certificate = base64decode(module.aks.kube_cluster_ca)
    config_path = "~/.kube/config"
  }
}