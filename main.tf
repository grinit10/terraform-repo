terraform {

  cloud {
    organization = "Xxeleton"

    workspaces {
      name = "dev"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

module "dev" {
  count = var.environment == "dev" ? 1 : 0
  source = "./environments/dev"
}