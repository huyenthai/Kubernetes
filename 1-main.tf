module "aks" {
    source = "./modules/aks"
    resource_group_name = var.resource_group_name
    location = var.location
    cluster_name = var.cluster_name
    dns_prefix = var.dns_prefix
    kubernetes_version = var.kubernetes_version
    node_count = var.node_count
    vm_size = var.vm_size
}
module "argocd" {
    source = "./modules/argocd"
    providers = {
      kubectl = kubectl
    }
    namespace = var.argocd_namespace
    chart_version = var.argocd_chart_version
    depends_on = [ module.aks ]
}

module "ingress" {
  source = "./modules/nginx"
}


module "argocd_app" {
  source = "./modules/app_argocd"
  app_name = var.bootstrap_app_name
  namespace = var.argocd_namespace
  repo_url = var.bootstrap_repo_url
  repo_path = var.bootstrap_repo_path
  repo_revision = var.bootstrap_repo_revision
  app_namespace = var.app_namespace
  depends_on = [ module.argocd ]
}