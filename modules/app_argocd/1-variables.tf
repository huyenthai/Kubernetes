variable "app_name" {
  type = string
  description = "The name of the Argo CD bootstrap Application."
}

variable "namespace" {
  type = string
  description = "The namespace in which the Argo CD Application will be created."
  default = "argocd"
}

variable "repo_url" {
  type = string
  description = "The Git repository URL containing Argo CD application definitions."
}

variable "repo_path" {
  type = string
  description = "The path in the Git repository where application manifests are located."
  default = "apps"
}

variable "repo_revision" {
  type = string
  description = "The Git revision (branch, tag, or commit) to track"
  default = "HEAD"
}

variable "app_namespace" {
  type = string
  description = "Namespace where app is being deployed"
  default = "app"
}