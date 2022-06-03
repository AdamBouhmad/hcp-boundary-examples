resource "boundary_host_catalog_static" "demo_catalog" {
  name        = "My Demo Catalog"
  description = "A Host Catalog that holds a PostgreSQL Database"
  scope_id    = boundary_scope.analysts_scope.id
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

resource "boundary_host_catalog_plugin" "azure_host_catalog" {
  name        = "Azure Host Catalog"
  description = "A Dynamic Host Catalog for Microsoft Azure"
  scope_id    = boundary_scope.operations_scope.id
  plugin_name = "azure"
  attributes_json = jsonencode(
    {
      "disable_credential_rotation" : true,
      "tenant_id" : (var.azure_app_tenant_id),
      "subscription_id" : (var.subscription_id),
      "client_id" : (var.oidc_client_id)
    }
  )
  secrets_json = jsonencode(
    {
      "secret_value" : (var.oidc_client_secret)
    }

  )
}

resource "boundary_host_set_plugin" "azure_host_set" {
  name                  = "Azure Host Set"
  description           = "A Dynamic Host Set for Microsoft Azure"
  host_catalog_id       = boundary_host_catalog_plugin.azure_host_catalog.id
  sync_interval_seconds = 10
  preferred_endpoints   = [var.azure_hosts_ip_cidr]
  attributes_json = jsonencode(
    {
      "filter" : "tagName eq '${var.host_set_filter_key}' and tagValue eq '${var.host_set_filter_value}'"
    }
  )
}