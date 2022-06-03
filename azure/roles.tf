resource "boundary_role" "admins_role" {
  name          = "Admin Role"
  description   = "Role for Boundary Admins"
  principal_ids = [boundary_managed_group.admins_managed_group.id]
  grant_strings = ["id=*;type=*;actions=*"]
  scope_id      = boundary_scope.org.id
}

resource "boundary_role" "analysts_users_role" {
  name          = "Analysts Users Role"
  description   = "Overarching role to allow db analysts to see db resources"
  principal_ids = [boundary_managed_group.analysts_managed_group.id]
  grant_strings = [
    "id=*;type=*;actions=read,list",
    "id=${boundary_target.database_target.id};actions=authorize-session"
  ]
  scope_id = boundary_scope.analysts_scope.id
}

resource "boundary_role" "operations_users_role" {
  name          = "Operations Users Role"
  description   = "Overarching role to allow ops users to see ops resources"
  principal_ids = [boundary_managed_group.operations_managed_group.id]
  grant_strings = [
    "id=*;type=*;actions=read,list",
    "id=${boundary_target.operations_target.id};actions=authorize-session"
  ]
  scope_id = boundary_scope.operations_scope.id
}