resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
  path = var.google_project
}

resource "vault_kubernetes_auth_backend_config" "kubernetes" {
  backend            = vault_auth_backend.kubernetes.path
  kubernetes_host    = var.kubernetes_endpoint
  kubernetes_ca_cert = data.kubernetes_secret.vault_injector_token.data["ca.crt"]
  token_reviewer_jwt = data.kubernetes_secret.vault_injector_token.data["token"]

  depends_on = [
    helm_release.vault_injector,
    data.kubernetes_secret.vault_injector_token,
  ]
}
