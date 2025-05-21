resource_group_name    = "aks-gitops-rg"
location               = "westeurope"
cluster_name           = "aks-gitops-cluster"
dns_prefix             = "aks-gitops"
kubernetes_version     = "1.28.3"
node_count             = 2
vm_size                = "Standard_D2s_v3"

argocd_namespace       = "argocd"
argocd_chart_version   = "5.46.7"

bootstrap_app_name     = "bootstrap-aks"
bootstrap_repo_url     = "git@github.com:rverspaij/ArgoCD-Test.git"
bootstrap_repo_path    = "apps/hello-world"
app_namespace = "app"