terraform {
  required_providers {
    boundary = {
      source = "hashicorp/boundary"
      version = "1.0.7"
    }
  }
}

provider "boundary" {}