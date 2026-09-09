mkdir -p \
  docs/architecture \
  docs/decisions \
  docs/runbooks \
  docs/diagrams \
  infrastructure/bootstrap \
  infrastructure/modules \
  infrastructure/environments/dev \
  infrastructure/environments/stage \
  infrastructure/environments/prod \
  databricks/resources \
  databricks/src/ingestion \
  databricks/src/bronze \
  databricks/src/silver \
  databricks/src/gold \
  databricks/src/quality \
  databricks/src/ml \
  databricks/src/agents \
  airflow/dags \
  airflow/plugins \
  airflow/tests \
  api/app \
  api/tests \
  mcp/server \
  mcp/tools \
  mcp/tests \
  kubernetes/base \
  kubernetes/overlays/dev \
  kubernetes/overlays/stage \
  kubernetes/overlays/prod \
  observability/prometheus \
  observability/grafana \
  observability/alerts \
  data/seed \
  tests/unit \
  tests/integration \
  tests/data_quality \
  tests/e2e \
  scripts \
  .github/workflows

find . -maxdepth 3 -type d | sort
