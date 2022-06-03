resource "boundary_credential_store_vault" "cred_store" {
  name        = "Cred Store1"
  description = "Northwind Credential Store"
  address     = var.vault_addr
  token       = var.vault_token
  scope_id    = boundary_scope.analysts_scope.id
  namespace   = var.namespace
}

resource "boundary_credential_library_vault" "database" {
  name                = "northwind_analyst"
  description         = "Northwind Credential Library for DBAs"
  credential_store_id = boundary_credential_store_vault.cred_store.id
  path                = "database/"
}