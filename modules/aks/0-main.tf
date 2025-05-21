resource "azurerm_resource_group" "aks" {
  name = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name = var.cluster_name
  location = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix = var.dns_prefix
  
  default_node_pool {
    name = "default"
    node_count = var.node_count
    vm_size = var.vm_size
    os_disk_size_gb = 30
  }

  identity {
    type = "SystemAssigned"
  }
}

output "kube_host" {
  value = azurerm_kubernetes_cluster.aks.kube_config[0].host
}

output "kube_client_certificate" {
  value = azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
}

output "kube_client_key" {
  value = azurerm_kubernetes_cluster.aks.kube_config[0].client_key
}

output "kube_cluster_ca" {
  value = azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate
}