locals {
  settings = {
    "injector.externalVaultAddr" = var.vault_address
    "injector.revokeOnShutdown"  = "true"
    "injector.authPath"          = "auth/${var.google_project}"
    "server.enabled"             = "false"
  }
}

resource "helm_release" "vault_injector" {
  name      = var.chart_name
  namespace = kubernetes_namespace.vault.metadata[0].name

  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault"
  version    = var.chart_version

  atomic          = true
  cleanup_on_fail = true

  dynamic "set" {
    for_each = local.settings
    content {
      name  = set.key
      value = set.value
    }
  }
}
