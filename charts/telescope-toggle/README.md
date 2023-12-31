# telescope-toggle

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A helm chart for Kubernetes to deploy the 'telescope-toggle' application.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| image | string | `"quay.io/telescope/telescope-toggle:latest"` |  |
| imagePullPolicy | string | `"Always"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `true` |  |
| ingress.host | string | `""` |  |
| ingress.labels | object | `{}` |  |
| ingress.name | string | `"telescope-toggle"` |  |
| ingress.path | string | `"/"` |  |
| ingress.tls.enabled | bool | `false` |  |
| ingress.tls.secretName | string | `""` |  |
| nodeSelector | object | `{}` |  |
| postgresql.adminPassword | string | `""` |  |
| postgresql.database | string | `"telescope"` |  |
| postgresql.external | bool | `false` |  |
| postgresql.host | string | `"postgresql"` |  |
| postgresql.password | string | `""` |  |
| postgresql.port | int | `5432` |  |
| postgresql.secretName | string | `"postgresql"` |  |
| postgresql.username | string | `""` |  |
| probe.livepath | string | `"/"` |  |
| probe.readypath | string | `"/"` |  |
| pullSecret.enabled | bool | `false` |  |
| pullSecret.secretKey | string | `".dockerconfigjson"` |  |
| pullSecret.secretName | string | `"pull-secret"` |  |
| resources | string | `nil` |  |
| service.name | string | `"telescope-toggle"` |  |
| service.port | int | `80` |  |
| service.targetport | int | `8080` |  |
| service.type | string | `"ClusterIP"` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
