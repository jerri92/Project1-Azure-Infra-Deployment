terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "sttfstatejerri"
    container_name       = "tfstate"
    key                  = "hub-spoke-dev.tfstate"
  }
}
