# PMIP Terraform Bootstrap

This Terraform root module creates the Azure infrastructure required to host
Terraform remote state.

## Resources

- Terraform state resource group
- Azure Storage Account
- private Blob container
- bootstrap operator Blob RBAC assignment

## Authentication

Local development uses the authenticated Azure CLI identity.

No Storage Account keys, Azure client secrets, or Terraform credentials should be
stored in this repository.

## Bootstrap Lifecycle

### Phase 1

Terraform initially uses the default local backend.

The local state file is:

terraform.tfstate

This file must never be committed to Git.

### Phase 2

After the Storage Account and Blob container exist, local state is migrated to the
AzureRM backend.

The final bootstrap state key will be:

bootstrap/terraform.tfstate

## Data Protection

The state Storage Account uses:

- HTTPS only
- TLS 1.2 minimum
- Blob versioning
- Blob soft delete
- container soft delete
- private Blob container
- Microsoft Entra ID authentication
- Azure RBAC
- Shared Key disabled
- Terraform prevent_destroy protection

## Important

Do not run terraform destroy against this stack as part of normal application or
environment cleanup.

The backend infrastructure has a lifecycle independent from PMIP workload
environments.
