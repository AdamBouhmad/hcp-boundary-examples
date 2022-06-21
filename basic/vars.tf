variable "origin_url" {
    type = string
    description = "Boundary environment's origin URL"
    # You can find your origin once you've enabled Boundary at https://portal.cloud.hashicorp.com/
    # Note: cannot have a terminating '/' character
    default = ""
}

variable "auth_method_id" {
    type = string
    description = "Boundary auth method to authenticate TF"
    # For new Boundary environments, login to your Boundary environment and copy the "password" auth method ID that was created at deployment
    # IN HCP Portal Login -> Auth methods -> "password"
    default = "ampw_1234567890"
}

variable "bootstrap_user_login_name" {
    type = string
    description = "Service account username for TF"
    # the username chosen of the user created when you enabled Boundary
    sensitive = true
}

variable "bootstrap_user_password" {
    type = string
    description = "Service account password for TF"
    # the password chosen of the user created when you enabled Boundary
    sensitive = true
}

variable "target_ips" {
  type    = set(string)
  # Add in IPs for any targets you would like to add
  default = ["127.0.0.1"]
}
