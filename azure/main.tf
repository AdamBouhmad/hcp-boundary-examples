terraform {
  required_providers {
    boundary = {
      source  = "hashicorp/boundary"
      version = "1.0.7"
    }
  }
}

provider "boundary" {
  addr                            = var.boundary_addr
  auth_method_id                  = var.auth_method_id
  password_auth_method_login_name = var.username
  password_auth_method_password   = var.password
}

provider "hcp" {
  client_id                       = var.principal_client_id
  client_secret                   = var.principal_key_secret
}

