resource "vault_auth_backend" "approle" {
  type = "approle"
}

resource "vault_approle_auth_backend_role" "this" {
  backend        = vault_auth_backend.approle.path
  role_name      = "kubernetes"
  token_policies = ["default", "backend"]
}

resource "vault_approle_auth_backend_role_secret_id" "this" {
  backend   = vault_auth_backend.approle.path
  role_name = vault_approle_auth_backend_role.this.role_name
}

output "role_id" {
  value     = vault_approle_auth_backend_role.this.role_id
  sensitive = true
}

output "secret_id" {
  value     = vault_approle_auth_backend_role_secret_id.this.secret_id
  sensitive = true
}
