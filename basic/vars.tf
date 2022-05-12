variable "origin_url" {
    type = string
    # Add your origin URL here, 
    # You can find your origin once you've enabled Boundary at https://portal.cloud.hashicorp.com/
    # Note: cannot have a terminating '/' character
    default = ""
}

variable "auth_method_id" {
    type = string
    # Login to your Boundary environment and copy the "password" auth method ID that was created at deployment
    # Login -> Auth methods -> "password"
    default = "ampw_1234567890"
}

variable "bootstrap_user_login_name" {
    type = string
    # the username chosen of the user created when you enabled Boundary
    default = "admin"
}

variable "bootstrap_user_password" {
    type = string
    # the password chosen of the user created when you enabled Boundary
    default = "password"
}

variable "target_ips" {
  type    = set(string)
  # Add in IPs for any targets you would like to add
  default = ["127.0.0.1"]
}