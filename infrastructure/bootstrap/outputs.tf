output "resource_group_name" {
  description = "Resource group containing Terraform remote-state infrastructure."
  value       = azurerm_resource_group.tfstate.name
}

output "storage_account_name" {
  description = "Storage Account used by the Terraform AzureRM backend."
  value       = azurerm_storage_account.tfstate.name
}

output "storage_account_id" {
  description = "Resource ID of the Terraform state Storage Account."
  value       = azurerm_storage_account.tfstate.id
}

output "container_name" {
  description = "Blob container used for Terraform state."
  value       = azurerm_storage_container.tfstate.name
}

output "bootstrap_state_key" {
  description = "Blob key that will store bootstrap Terraform state after migration."
  value       = "bootstrap/terraform.tfstate"
}

output "backend_configuration" {
  description = "Non-secret values required to configure the AzureRM backend."
  value = {
    resource_group_name  = azurerm_resource_group.tfstate.name
    storage_account_name = azurerm_storage_account.tfstate.name
    container_name       = azurerm_storage_container.tfstate.name
    key                  = "bootstrap/terraform.tfstate"
    use_azuread_auth     = true
  }
}
