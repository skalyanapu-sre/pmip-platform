# PMIP Architecture

## Platform Name

Private Markets Intelligence Platform (PMIP)

## Objective

Build a production-oriented Azure Databricks data and AI platform for ingesting,
processing, governing, analyzing, and serving private-market and investment-related
data.

## Core Platform

- Microsoft Azure
- Azure Databricks
- ADLS Gen2
- Unity Catalog
- Delta Lake
- Lakeflow Spark Declarative Pipelines
- Lakeflow Jobs
- Databricks SQL
- MLflow
- Databricks AI/BI
- Genie
- Vector Search
- AI Agents
- Apache Airflow
- FastAPI
- Model Context Protocol (MCP)
- Azure Kubernetes Service (AKS)
- Azure Container Registry
- Azure Key Vault
- HashiCorp Vault
- Azure Monitor
- Prometheus
- Grafana
- Terraform
- GitHub Actions

## Data Architecture

Sources
  -> Landing
  -> Bronze
  -> Silver
  -> Gold
  -> BI / ML / AI / APIs

## Environments

- dev
- stage
- prod

Only the dev environment will initially be deployed.

## Infrastructure Principle

Azure infrastructure is managed through Terraform.

Databricks workloads are deployed through Databricks Declarative Automation Bundles.

Kubernetes workloads are deployed through Kubernetes manifests and/or Helm.

GitHub is the source of truth for platform code and deployment configuration.

## Security Principles

- No credentials committed to Git
- No Azure Storage Account keys for Databricks data access
- Prefer Microsoft Entra workload identities
- Prefer managed identities
- GitHub CI/CD will use OIDC
- Unity Catalog governs Databricks data access
- Azure Key Vault stores Azure-native secrets where required
- HashiCorp Vault supports Kubernetes/application secret use cases
- Least privilege is the target state
