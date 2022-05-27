resource "boundary_host_catalog_static" "demo_catalog" {
  name        = "My Demo Catalog"
  description = "A Host Catalog that holds a PostgreSQL Database"
  scope_id    = boundary_scope.project.id
}

resource "boundary_host_set_static" "demo_host_set" {
  name            = "My Demo Host-Set"
  description     = "a Host-Set that contains a PostgreSQL Database"
  host_catalog_id = boundary_host_catalog_static.demo_catalog.id
  host_ids        = [boundary_host_static.demo_host.id]
}

resource "boundary_host_static" "demo_host" {
  name            = "Demo PostgreSQL Database"
  description     = "A Demo PostgreSQL Database"
  host_catalog_id = boundary_host_catalog_static.demo_catalog.id
  address         = var.database_ip
}