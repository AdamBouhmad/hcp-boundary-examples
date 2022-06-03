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

resource "boundary_scope" "analysts_scope" {
  name                   = "Analysts Project"
  description            = "This scope houses database targets"
  scope_id               = boundary_scope.org.id
  auto_create_admin_role = true
}

resource "boundary_scope" "operations_scope" {
  name                   = "Operations Project"
  description            = "This scope houses operations targets"
  scope_id               = boundary_scope.org.id
  auto_create_admin_role = true
}

resource "boundary_credential_store_vault" "cred_store" {
  name        = "Cred Store1"
  description = "Northwind Credential Store"
  address     = var.vault_addr
  token       = var.vault_token
  scope_id    = boundary_scope.project.id
  namespace   = var.namespace
}

resource "boundary_credential_library_vault" "database" {
  name                = "northwind_analyst"
  description         = "Northwind Credential Library for DBAs"
  credential_store_id = boundary_credential_store_vault.cred_store.id
  path                = "database/"
}
