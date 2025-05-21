variable "namespace" {
  type = string
  description = "The namespace in which to install Argo CD"
  default = "argocd"
}

variable "chart_version" {
  type = string
  description = "The Helm chart version to use for Argo CD."
  default = "5.46.7"
}

variable "repo_url" {
  type = string
  description = "The URL of the github repo to look at."
  default = "git@github.com:rverspaij/ArgoCD-Test.git"
}