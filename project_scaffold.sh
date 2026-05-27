#!/bin/bash

# Create project root
mkdir -p observashop
cd observashop || exit

# ----------------------------
# GitHub Actions
# ----------------------------
mkdir -p .github/workflows

# ----------------------------
# Services
# ----------------------------
for service in api-gateway order-service product-service user-service
do
  mkdir -p services/$service/app/routes
  mkdir -p services/$service/app/models
  mkdir -p services/$service/app/db
  mkdir -p services/$service/tests
done

# ----------------------------
# Notification service
# ----------------------------
mkdir -p services/notification-service/app/routes
mkdir -p services/notification-service/app/models
mkdir -p services/notification-service/tests

# API Gateway middleware
mkdir -p services/api-gateway/app/middleware

# ----------------------------
# Helm Charts
# ----------------------------
mkdir -p helm/observashop/charts
for chart in api-gateway order-service product-service user-service
do
  mkdir -p helm/$chart/templates
done

# ----------------------------
# Infrastructure
# ----------------------------
mkdir -p infra/kind
mkdir -p infra/terraform
mkdir -p infra/argocd/applications

# ----------------------------
# Observability
# ----------------------------
mkdir -p observability/prometheus/rules
mkdir -p observability/grafana/dashboards
mkdir -p observability/grafana/provisioning/datasources
mkdir -p observability/grafana/provisioning/dashboards
mkdir -p observability/loki
mkdir -p observability/promtail
mkdir -p observability/alertmanager

# ----------------------------
# Load Testing & Chaos
# ----------------------------
mkdir -p load-testing/k6/scenarios
mkdir -p chaos/scenarios

# ----------------------------
# Documentation & Scripts
# ----------------------------
mkdir -p runbooks
mkdir -p docs
mkdir -p scripts

# ----------------------------
# Preserve empty directories
# ----------------------------
find . -type d -empty -exec touch {}/.gitkeep \;
echo "✅ ObservaShop scaffold created successfully"
tree -L 3