resource "boundary_scope" "global" {
  global_scope = true
  scope_id     = "global"
}

resource "boundary_scope" "org" {
  name                     = "Demo Organization"
  description              = "Scope for the demo organization"
  scope_id                 = boundary_scope.global.id
  auto_create_admin_role   = true
  auto_create_default_role = true
}

resource "boundary_scope" "project" {
  name                   = "Demo Project"
  description            = "Scope for the Demo project within the Demo Organization"
  scope_id               = boundary_scope.org.id
  auto_create_admin_role = true
}

resource "boundary_credential_store_vault" "cred_store" {
  name        = "Cred Stores"
  description = "Northwind Credential Store"
  address     = var.vault_addr
  token       = var.vault_token
  scope_id    = boundary_scope.project.id
  namespace   = "admin"
  tls_skip_verify = true
}

resource "boundary_credential_library_vault" "database" {
  name                = "northwind_analyst"
  description         = "Northwind Credential Library for DBAs"
  credential_store_id = boundary_credential_store_vault.cred_store.id
  path                = "database/"
}
