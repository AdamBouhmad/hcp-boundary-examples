resource "boundary_target" "database_target" {
  name                     = "Demo Database Target"
  description              = "A Demo Database Target"
  type                     = "tcp"
  default_port             = "5432"
  session_connection_limit = -1
  scope_id                 = boundary_scope.analysts_scope.id
  host_source_ids = [
    boundary_host_set_static.demo_host_set.id
  ]
}

resource "boundary_target" "operations_target" {
  name                     = "Demo Operations Target"
  description              = "A Dynamic Set of Targets for SSH"
  type                     = "tcp"
  default_port             = "22"
  session_connection_limit = -1
  scope_id                 = boundary_scope.operations_scope.id
  host_source_ids = [
    boundary_host_set_plugin.azure_host_set.id
  ]
}