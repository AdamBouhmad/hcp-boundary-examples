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