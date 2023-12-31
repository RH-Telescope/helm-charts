# telescope-argocd

![Version: 0.4.0](https://img.shields.io/badge/Version-0.4.0-informational?style=flat-square)

Chart to deploy Argo CD Applications Supporting Telescope

**Homepage:** <https://project-telescope.com>

## Source Code

* <https://github.com/RH-Telescope/helm-charts>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| chartVersion | string | `"x"` |  |
| charts.postgresql.enabled | bool | `true` |  |
| charts.telescope-backend.enabled | bool | `true` |  |
| charts.telescope-frontend.enabled | bool | `true` |  |
| defaultSyncPolicy.automated.prune | bool | `false` |  |
| defaultSyncPolicy.automated.selfHeal | bool | `true` |  |
| defaultSyncPolicy.retry.backoff.duration | string | `"15s"` |  |
| defaultSyncPolicy.retry.backoff.factor | int | `2` |  |
| defaultSyncPolicy.retry.backoff.maxDuration | string | `"5m"` |  |
| defaultSyncPolicy.retry.limit | int | `5` |  |
| destinationServer | string | `"https://kubernetes.default.svc"` |  |
| gitOpsNamespace | string | `"openshift-gitops"` |  |
| path | string | `"."` |  |
| repoURL | string | `"https://rh-telescope.github.io/helm-charts"` |  |
| sourceType | string | `"helm"` |  |
| targetRevision | string | `"main"` |  |

----------------------------------------------
