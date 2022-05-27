resource "boundary_role" "admins_role" {
  name          = "Admin Role"
  description   = "Role for Boundary Admins"
  principal_ids = [boundary_managed_group.admins_managed_group.id]
  grant_strings = ["id=*;type=*;actions=*"]
  scope_id      = boundary_scope.org.id
}

resource "boundary_role" "project_users_role" {
  name          = "Demo Project Users Role"
  description   = "Overarching role to allow users to see project resources"
  principal_ids = [boundary_managed_group.users_managed_group.id]
  grant_strings = [
    "id=*;type=*;actions=read,list"
  ]
  scope_id = boundary_scope.project.id
}

resource "boundary_role" "project_users_target_connect_role" {
  name          = "role to allow connections to target"
  description   = ""
  principal_ids = [boundary_managed_group.users_managed_group.id]
  grant_strings = [
    "id=${boundary_target.demo_target.id};actions=authorize-session"
  ]
  scope_id = boundary_scope.project.id
}