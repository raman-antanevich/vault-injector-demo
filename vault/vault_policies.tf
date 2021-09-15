data "local_file" "policies" {
  for_each = toset(var.vault_policies)

  filename = "./policies/${each.key}.hcl"
}

resource "vault_policy" "this" {
  for_each = data.local_file.policies

  name   = each.key
  policy = each.value.content
}
