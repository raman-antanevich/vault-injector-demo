terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "= 2.23.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "= 2.1.0"
    }
  }
}

provider "vault" {
  address = var.vault_address
  token   = var.vault_token
}
