variable "boundary_addr" {
  type        = string
  description = "The address of the Boundary cluster. e.g. https://boundary-cluster.com, no trailing slash"
}

variable "auth_method_id" {
  type        = string
  description = "The ID of the initial authentication method for executing Terraform against the Boudnary cluster"
}

variable "username" {
  type        = string
  description = "Boundary admin username"
}

variable "password" {
  type        = string
  description = "Boundary admin password (provide via environment variables for additional security)"
}

variable "oidc_issuer" {
  type        = string
  description = "URL of the OIDC issuer. Do not include trailing slash"
}

variable "oidc_client_id" {
  type        = string
  description = "The Azure app registration client ID"
}

variable "oidc_client_secret" {
  type        = string
  description = "The Azure app registration client secret value"
}

variable "azure_app_tenant_id" {
  type        = string
  description = "The Azure app registration tenant ID"
}

variable "oidc_user_object_id" {
  type        = string
  description = "The object ID of the user used for OIDC connection"
}

variable "analysts_group_object_id" {
  type        = string
  description = "The object ID of an Azure Active Directory Group for Analysts"
}

variable "operations_group_object_id" {
  type        = string
  description = "The object ID of an Azure Active Directory Group for Operations employees"
}

variable "database_ip" {
  type        = string
  description = "The public IP of an Azure PostgreSQL database"
}

variable "vault_addr" {
  type        = string
  description = "The address of a publicly accessible Vault cluster"
}

variable "vault_token" {
  type        = string
  description = "An auth token for accessing a Vault cluster"
}

variable "vault_namespace" {
  type        = string
  description = "The namespace where the secrets engine is enabled within the Vault cluster"
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription ID where the Azure VMs are created for dynamic host catalog"
}

variable "host_set_filter_key" {
  type        = string
  description = "The key for filtering tags on VMs to add them to the dynamic host set"
}

variable "host_set_filter_value" {
  type        = string
  description = "The value for filtering tags on VMs to add them to the dynamic host set"
}

variable "azure_hosts_ip_cidr" {
  type        = string
  description = "the CIDR range of the IPs where the Azure VMs should be accessed"
}
