# ocp-platform — Platform GitOps for demo-env

Umbrella Helm chart for ongoing cluster-wide configuration on **demo-env**, synced by the Argo CD root `Application` created during bootstrap.

## Subcharts

| Chart | Purpose |
|-------|---------|
| `platform-namespaces` | Shared platform namespaces |
| `cluster-rbac` | Ongoing cluster RBAC bindings |
| `cluster-policies` | Quotas, limits, baseline network policies |
| `shared-operators` | cert-manager and shared operators |
| `platform-routing` | Routing standards and TLS guidance |
| `tenant-onboarding` | AppProjects, NamespaceManagement, ApplicationSet |

## Tenants

Configured in `charts/tenant-onboarding/values.yaml`:

| Tenant | Namespace | Repo |
|--------|-----------|------|
| tenant-a | `tenant-a` | [tenant-a-apps](https://github.com/YOUR_GITHUB_ORG/tenant-a-apps) |
| tenant-b | `tenant-b` | [tenant-b-apps](https://github.com/YOUR_GITHUB_ORG/tenant-b-apps) |

## Local validation

```bash
chmod +x scripts/validate-manifests.sh
./scripts/validate-manifests.sh
```

## Related repositories

- [ocp-bootstrap](https://github.com/YOUR_GITHUB_ORG/ocp-bootstrap) — Ansible bootstrap (creates root Application pointing here)
- [tenant-a-apps](https://github.com/YOUR_GITHUB_ORG/tenant-a-apps)
- [tenant-b-apps](https://github.com/YOUR_GITHUB_ORG/tenant-b-apps)

## Documentation

Platform operational docs live in [ocp-bootstrap/docs](https://github.com/YOUR_GITHUB_ORG/ocp-bootstrap/tree/main/docs).
