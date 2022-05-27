resource "boundary_target" "demo_target" {
  name                     = "Demo Database Target"
  description              = "A Demo Database Target"
  type                     = "tcp"
  default_port             = "5432"
  session_connection_limit = -1
  scope_id                 = boundary_scope.project.id
  host_source_ids = [
    boundary_host_set_static.demo_host_set.id
  ]
}