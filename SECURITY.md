# Security Policy

PMIP follows a credential-free and least-privilege-first architecture wherever
supported.

## Secrets

Secrets must never be committed to this repository.

Use approved secret-management mechanisms such as:

- Microsoft Entra workload identity
- Azure Managed Identity
- Azure Key Vault
- HashiCorp Vault
- GitHub OIDC federation

## Azure

Prefer role-based access control over shared keys.

Storage account keys must not be used for normal Databricks access.

## Databricks

Use Unity Catalog for governed data access.

CI/CD automation should use service principals and workload identity federation
instead of personal access tokens wherever supported.

## GitHub

Long-lived Azure client secrets should not be stored in GitHub Actions.

Use GitHub Actions OIDC federation.

## Reporting

Potential credential exposure or security configuration errors should be treated as
high priority and remediated before further deployment.
