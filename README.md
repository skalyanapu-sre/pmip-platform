# Private Markets Intelligence Platform

PMIP is a production-oriented Azure Databricks data and AI platform reference
implementation.

The project demonstrates end-to-end design, provisioning, data engineering,
governance, analytics, machine learning, AI agents, APIs, orchestration,
observability, security, and CI/CD.

## Business Use Case

Investment and private-market analysts require trusted data from multiple sources
to evaluate portfolio companies, fund positions, macroeconomic conditions,
financial performance, and secondary-market activity.

PMIP provides a governed platform for ingesting and standardizing this information
and exposing it through analytics, machine learning, APIs, Databricks Genie, and
AI agents.

## Technology Stack

### Cloud

- Microsoft Azure

### Infrastructure

- Terraform
- Azure Resource Manager
- Microsoft Entra ID
- Managed Identities

### Data Platform

- Azure Databricks
- Unity Catalog
- Delta Lake
- ADLS Gen2
- Lakeflow Spark Declarative Pipelines
- Lakeflow Jobs
- Databricks SQL

### Data Engineering

- Python
- PySpark
- Spark SQL
- Auto Loader
- Structured Streaming
- CDC
- SCD Type 1
- SCD Type 2
- Data quality controls

### Analytics

- Databricks AI/BI Dashboards
- Databricks Genie

### AI / ML

- MLflow
- Vector Search
- RAG
- AI Agents
- Model Context Protocol

### Application Platform

- FastAPI
- Docker
- Azure Kubernetes Service
- Azure Container Registry

### Orchestration

- Databricks Workflows
- Apache Airflow

### Observability

- Azure Monitor
- Databricks System Tables
- Prometheus
- Grafana
- MLflow tracing

### Security

- Microsoft Entra ID
- Azure Managed Identity
- Azure Key Vault
- HashiCorp Vault
- Unity Catalog
- GitHub OIDC

### CI/CD

- Git
- GitHub
- GitHub Actions

## Architecture

Data flow:

    External APIs
         +
    Internal Files
         |
         v
       ADLS
         |
         v
      Bronze
         |
         v
      Silver
         |
         v
       Gold
         |
         +-------------------+
         |                   |
         v                   v
    BI / Genie           ML / Agents
                             |
                             v
                         API / MCP

## Environments

The repository supports:

- dev
- stage
- prod

Initial development is limited to dev.

## Repository Structure

    infrastructure/   Azure infrastructure as code
    databricks/       Databricks workloads and platform code
    airflow/          Cross-platform orchestration
    api/              FastAPI application
    mcp/              MCP servers and tools
    kubernetes/       AKS deployment configuration
    observability/    Monitoring and alerting
    data/             Safe POC seed datasets
    tests/            Automated testing
    docs/             Architecture, ADRs, diagrams, and runbooks
    scripts/          Developer and automation utilities

## Infrastructure Policy

Azure resources must be managed through Terraform once introduced into Terraform
state.

Avoid manual configuration drift.

## Security Policy

Secrets and production credentials must never be committed to Git.

Prefer workload identity, managed identity, RBAC, OIDC, and centralized secret
management.

See SECURITY.md for additional details.

## Project Status

Current phase:

STEP 01 - Repository and Terraform bootstrap
