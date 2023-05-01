terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "4.2.0"
    }
  }
}

provider "keycloak" {}
