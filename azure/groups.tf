resource "boundary_managed_group" "analysts_managed_group" {
  name           = "Analysts Managed Group"
  description    = "A sample managed group pulling users from the Analysts group in AAD"
  auth_method_id = boundary_auth_method_oidc.azure_oidc_auth_method.id
  filter         = "\"${var.analysts_group_object_id}\" in \"/token/groups\""
}

resource "boundary_managed_group" "operations_managed_group" {
  name           = "Operations Managed Group"
  description    = "A sample managed group pulling users from the Operations group in AAD"
  auth_method_id = boundary_auth_method_oidc.azure_oidc_auth_method.id
  filter         = "\"${var.operations_group_object_id}\" in \"/token/groups\""
}

