terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}

resource "kubectl_manifest" "production_app" {
  yaml_body = file("${path.module}/applications/production.yaml")
}