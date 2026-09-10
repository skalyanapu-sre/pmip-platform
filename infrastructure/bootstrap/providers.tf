provider "azurerm" {
  features {}

  subscription_id = var.subscription_id

  # AzureRM 5.x no longer needs automatic resource-provider registration
  # for our controlled bootstrap workflow.
  resource_provider_registrations = "none"

  # Prefer Microsoft Entra ID authentication for Azure Storage data-plane
  # operations rather than Storage Account shared keys.
  storage_use_azuread = true
}

data "azurerm_client_config" "current" {}
