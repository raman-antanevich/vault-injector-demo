variable "vault_address" {
  type    = string
  default = "http://localhost:8200"
}

variable "vault_role_id" {
  type = string
}

variable "vault_secret_id" {
  type = string
}

variable "google_project" {
  type    = string
  default = "minikube"
}

variable "chart_name" {
  type    = string
  default = "vault-injector"
}

variable "chart_version" {
  type    = string
  default = "0.15.0"
}

variable "chart_namespace" {
  type    = string
  default = "vault"
}

variable "kubernetes_endpoint" {
  type    = string
  default = "https://localhost:8443"
}

variable "kubectl_context" {
  type    = string
  default = "minikube"
}
