resource "boundary_auth_method_oidc" "azure_oidc_auth_method" {
  name                 = "Azure OIDC Auth Method"
  description          = "OIDC authentication method for Azure"
  scope_id             = boundary_scope.org.id
  is_primary_for_scope = true
  issuer               = var.oidc_issuer
  client_id            = var.oidc_client_id
  client_secret        = var.oidc_client_secret
  signing_algorithms   = ["RS256"]
  api_url_prefix       = var.boundary_addr
}

resource "boundary_account_oidc" "azure_oidc_account" {
  name           = "Azure OIDC Account"
  description    = "OIDC account for Azure"
  auth_method_id = boundary_auth_method_oidc.azure_oidc_auth_method.id
  issuer         = var.oidc_issuer
  subject        = var.oidc_user_object_id
}
