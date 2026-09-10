# -----------------------------------------------------------------------------
# Terraform State Resource Group
# -----------------------------------------------------------------------------

resource "azurerm_resource_group" "tfstate" {
  name     = local.resource_group_name
  location = var.location

  tags = local.common_tags

  lifecycle {
    prevent_destroy = true
  }
}

# -----------------------------------------------------------------------------
# Terraform State Storage Account
# -----------------------------------------------------------------------------

resource "azurerm_storage_account" "tfstate" {
  name                = local.storage_account_name
  resource_group_name = azurerm_resource_group.tfstate.name
  location            = azurerm_resource_group.tfstate.location

  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = var.storage_replication_type

  https_traffic_only_enabled       = true
  min_tls_version                  = "TLS1_2"
  allow_nested_items_to_be_public  = false
  shared_access_key_enabled        = false
  default_to_oauth_authentication  = true
  cross_tenant_replication_enabled = false

  # Public endpoint remains enabled during the POC so that authenticated
  # developer workstations and GitHub-hosted runners can reach the backend.
  #
  # Access is still protected through Microsoft Entra ID and Azure RBAC.
  #
  # A future hardened architecture can move this behind a Private Endpoint
  # and use self-hosted runners with private network connectivity.
  public_network_access_enabled = true

  blob_properties {
    versioning_enabled = true

    delete_retention_policy {
      days = var.blob_soft_delete_days
    }

    container_delete_retention_policy {
      days = var.container_soft_delete_days
    }
  }

  tags = local.common_tags

  lifecycle {
    prevent_destroy = true
  }
}

# -----------------------------------------------------------------------------
# Terraform State Blob Container
# -----------------------------------------------------------------------------

resource "azurerm_storage_container" "tfstate" {
  name               = local.state_container_name
  storage_account_id = azurerm_storage_account.tfstate.id

  container_access_type = "private"

  lifecycle {
    prevent_destroy = true
  }
}

# -----------------------------------------------------------------------------
# Bootstrap Operator RBAC
# -----------------------------------------------------------------------------
#
# The currently authenticated Azure identity receives data-plane access to
# the Terraform state container so that STEP 01F can migrate local state into
# Azure Blob Storage using Microsoft Entra ID rather than Storage Account keys.
# -----------------------------------------------------------------------------

resource "azurerm_role_assignment" "bootstrap_operator_blob_data" {
  scope                = azurerm_storage_container.tfstate.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
}
