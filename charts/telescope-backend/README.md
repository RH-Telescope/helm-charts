# telescope-backend

![Version: 0.4.0](https://img.shields.io/badge/Version-0.4.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A helm chart for Kubernetes to deploy the 'telescope-backend' application.

**Homepage:** <https://project-telescope.com>

## Source Code

* <https://github.com/RH-Telescope/helm-charts>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| image | string | `"quay.io/telescope/telescope-backend:latest"` |  |
| imagePullPolicy | string | `"Always"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `true` |  |
| ingress.host | string | `""` |  |
| ingress.labels | object | `{}` |  |
| ingress.name | string | `"telescope-backend"` |  |
| ingress.path | string | `"/"` |  |
| ingress.tls.enabled | bool | `false` |  |
| ingress.tls.secretName | string | `""` |  |
| nodeSelector | object | `{}` |  |
| postgresql.adminPassword | string | `""` |  |
| postgresql.database | string | `"telescope"` |  |
| postgresql.external | bool | `false` |  |
| postgresql.host | string | `"postgresql"` |  |
| postgresql.image | string | `"docker.io/postgres:13"` |  |
| postgresql.init | bool | `true` |  |
| postgresql.password | string | `""` |  |
| postgresql.port | int | `5432` |  |
| postgresql.secretName | string | `"postgresql"` |  |
| postgresql.username | string | `""` |  |
| probe.livepath | string | `"/domains"` |  |
| probe.readypath | string | `"/domains"` |  |
| pullSecret.enabled | bool | `false` |  |
| pullSecret.secretKey | string | `".dockerconfigjson"` |  |
| pullSecret.secretName | string | `"pull-secret"` |  |
| replicaCount | int | `1` |  |
| resources | string | `nil` |  |
| service.name | string | `"telescope-backend"` |  |
| service.port | int | `80` |  |
| service.targetport | int | `8080` |  |
| service.type | string | `"ClusterIP"` |  |
| tolerations | list | `[]` |  |
| vault.registry2.host.key | string | `"secret/registry2"` |  |
| vault.registry2.host.property | string | `"host"` |  |
| vault.registry2.password.key | string | `"secret/registry2"` |  |
| vault.registry2.password.property | string | `"password"` |  |
| vault.registry2.user.key | string | `"secret/registry2"` |  |
| vault.registry2.user.property | string | `"user"` |  |
| vaultKey | string | `"token"` |  |
| vaultSecret | string | `"vault-secret"` |  |
| vaultStorage | string | `"vault-backend"` |  |

----------------------------------------------
