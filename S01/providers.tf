terraform {


  ## backend azure storage =======================
  backend "azurerm" {
    resource_group_name  = "<>"
    storage_account_name = "<>"
    container_name       = "tfstate"
    key                  = "terraform_demo.tfstate"
  }
  ## TFE backend =================
  #  backend "remote" {
  #     hostname = "app.terraform.io"
  #     organization = "<>"

  #     workspaces {
  #       name = "terraform_demo"
  #     }
  #   }


  required_version = ">=0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = var.azurerm_subscription_id
  tenant_id       = var.azurerm_tenant_id
  client_id       = var.azurerm_client_id
  client_secret   = var.azurerm_client_secret
}