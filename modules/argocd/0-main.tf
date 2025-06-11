terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}

resource "kubernetes_namespace" "argocd" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "argocd" {
  name = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart = "argo-cd"
  namespace = kubernetes_namespace.argocd.metadata[0].name
  version = var.chart_version

  values = [
    templatefile("${path.module}/3-values.yaml", {
      repo_url        = var.repo_url
      ssh_private_key = file("${path.module}/my-ssh-key")
    })
  ]

  depends_on = [ kubernetes_namespace.argocd ]
}

resource "kubectl_manifest" "argocd_ingress" {
  yaml_body = file("${path.module}/4-ingress.yaml")
  depends_on = [ helm_release.argocd ]
}

output "rendered_yaml" {
  value = templatefile("${path.module}/3-values.yaml", {
    repo_url        = var.repo_url
    ssh_private_key = indent(8, file("${path.module}/my-ssh-key"))
  })
}