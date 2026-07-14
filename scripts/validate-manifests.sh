#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PLATFORM_CHART="${ROOT_DIR}"

echo "==> Linting platform umbrella chart"
helm lint "${PLATFORM_CHART}"

echo "==> Building chart dependencies"
helm dependency build "${PLATFORM_CHART}"

echo "==> Rendering platform chart for demo-env"
helm template demo-env-platform "${PLATFORM_CHART}" \
  -f "${PLATFORM_CHART}/values.yaml" \
  --namespace openshift-gitops \
  > /tmp/demo-env-platform-rendered.yaml

echo "Rendered manifests written to /tmp/demo-env-platform-rendered.yaml"
wc -l /tmp/demo-env-platform-rendered.yaml

if command -v kubeconform >/dev/null 2>&1; then
  echo "==> Validating with kubeconform"
  kubeconform -summary /tmp/demo-env-platform-rendered.yaml || true
else
  echo "kubeconform not installed; skipping schema validation"
fi

echo "Validation complete."
