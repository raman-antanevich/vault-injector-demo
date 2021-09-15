variable "vault_address" {
  type    = string
  default = "http://localhost:8200"
}

variable "vault_token" {
  type    = string
  default = "root"
}

variable "vault_policies" {
  type = list(string)
  default = [
    "default",
    "backend",
    "secret",
  ]
}
