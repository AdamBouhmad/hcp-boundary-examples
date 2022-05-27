resource "boundary_managed_group" "admins_managed_group" {
  name           = "Admins Managed Group"
  description    = "A sample managed group pulling users from the Boundary Admins Group in AAD"
  auth_method_id = boundary_auth_method_oidc.azure_oidc_auth_method.id
  filter         = "\"${var.admin_group_object_id}\" in \"/token/groups\""
}

resource "boundary_managed_group" "users_managed_group" {
  name           = "Users Managed Group"
  description    = "A sample managed group pulling users from the Boundary Users Group in AAD"
  auth_method_id = boundary_auth_method_oidc.azure_oidc_auth_method.id
  filter         = "\"${var.user_group_object_id}\" in \"/token/groups\""
}