# variable "kubernetes_roles" {
#   type = map(any)
#   default = {
#     madness = {
#       backend    = "minikube"
#       accounts   = ["golang", "python"]
#       namespaces = ["dev-01", "stg-01", "uat-01"]
#       policies   = ["secret"]
#     }
#   }
# }

# resource "vault_kubernetes_auth_backend_role" "kubernetes" {
#   for_each = var.kubernetes_roles

#   backend                          = each.value.backend
#   role_name                        = each.key
#   bound_service_account_names      = each.value.accounts
#   bound_service_account_namespaces = each.value.namespaces
#   token_policies                   = each.value.policies
# }
