resource "kubernetes_namespace" "vault" {
  metadata {
    name = var.chart_namespace
  }
}
