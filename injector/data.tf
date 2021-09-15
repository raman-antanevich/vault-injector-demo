data "kubernetes_service_account" "vault_injector" {
  metadata {
    name      = var.chart_name
    namespace = kubernetes_namespace.vault.metadata[0].name
  }

  depends_on = [
    helm_release.vault_injector,
  ]
}

data "kubernetes_secret" "vault_injector_token" {
  metadata {
    name      = data.kubernetes_service_account.vault_injector.default_secret_name
    namespace = kubernetes_namespace.vault.metadata[0].name
  }

  depends_on = [
    helm_release.vault_injector,
  ]
}
