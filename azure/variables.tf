variable "boundary_addr" {
  type = string
}

variable "auth_method_id" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

variable "oidc_issuer" {
  type        = string
  description = "URL of the OIDC issuer. Do not include trailing slash"
}

variable "oidc_client_id" {
  type = string
}

variable "oidc_client_secret" {
  type = string
}

variable "oidc_user_object_id" {
  type = string
}

variable "analysts_group_object_id" {
  type = string
}

variable "operations_group_object_id" {
  type = string
}

variable "database_ip" {
  type = string
}

variable "vault_addr" {
  type = string
}

variable "vault_token" {
  type = string
}

variable "namespace" {
  type = string
}
variable "subscription_id" {
  type = string
}

variable "azure_app_tenant_id" {
  type = string
}

variable "host_set_filter_key" {
  type = string
}

variable "host_set_filter_value" {
  type = string
}

variable "azure_hosts_ip_cidrs" {
  type = list
}
