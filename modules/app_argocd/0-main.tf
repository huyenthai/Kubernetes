terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}

resource "kubectl_manifest" "staging_app" {
  yaml_body = file("${path.module}/applications/staging.yaml")
}

resource "kubectl_manifest" "production_app" {
  yaml_body = file("${path.module}/applications/production.yaml")
}

resource "kubectl_manifest" "events_app" {
  yaml_body = file("${path.module}/applications/argo_events.yaml")
}

resource "kubectl_manifest" "production_project" {
  yaml_body = file("${path.module}/projects/production.yaml")
}

resource "kubectl_manifest" "staging_project" {
  yaml_body = file("${path.module}/projects/staging.yaml")
}

resource "kubectl_manifest" "events_project" {
  yaml_body = file("${path.module}/projects/argo_events.yaml")
}

resource "kubectl_manifest" "events_logic" {
  yaml_body = file("${path.module}/applications/argo_events_logic.yaml")
}