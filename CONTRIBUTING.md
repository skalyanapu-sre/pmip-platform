# Contributing to PMIP

## Branching

Do not develop directly on main.

Use feature branches:

feature/<description>

Examples:

feature/terraform-bootstrap
feature/networking
feature/databricks-workspace
feature/bronze-ingestion
feature/data-quality
feature/ai-agent

## Commit Messages

Use clear, scoped commit messages.

Examples:

feat(terraform): add Azure network module

feat(databricks): add bronze ingestion pipeline

fix(quality): correct transaction validation

docs(architecture): document managed identity design

test(api): add portfolio endpoint tests

## Pull Requests

Changes should be submitted through pull requests.

Pull requests should include:

- What changed
- Why it changed
- Testing performed
- Security impact
- Infrastructure impact
- Rollback considerations

## Infrastructure

Do not manually create production infrastructure when Terraform manages that resource.

## Secrets

Never commit:

- passwords
- API tokens
- client secrets
- private keys
- certificates containing private keys
- Terraform state
- production data
- personal data

## Testing

Code should pass the appropriate automated checks before merge.

Planned checks include:

- terraform fmt
- terraform validate
- Python linting
- unit tests
- data quality tests
- Databricks bundle validation
- container scanning
- infrastructure security scanning
