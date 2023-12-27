# telescope-frontend

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A helm chart for Kubernetes to deploy the 'telescope-frontend' application.

**Homepage:** <https://project-telescope.com>

## Source Code

* <https://github.com/RH-Telescope/helm-charts>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| backendUrl | string | `""` |  |
| env | list | `[]` |  |
| image | string | `"quay.io/telescope/dashboard-react-app:latest"` |  |
| imagePullPolicy | string | `"Always"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `true` |  |
| ingress.host | string | `""` |  |
| ingress.labels | object | `{}` |  |
| ingress.name | string | `"telescope-frontend"` |  |
| ingress.path | string | `"/"` |  |
| ingress.tls.enabled | bool | `false` |  |
| ingress.tls.secretName | string | `""` |  |
| nodeBuildDir | string | `"/opt/app-root/src/build"` |  |
| nodeSelector | object | `{}` |  |
| probe.livepath | string | `"/"` |  |
| probe.readypath | string | `"/"` |  |
| pullSecret.enabled | bool | `false` |  |
| pullSecret.secretKey | string | `".dockerconfigjson"` |  |
| pullSecret.secretName | string | `"pull-secret"` |  |
| replicaCount | int | `1` |  |
| resources | string | `nil` |  |
| service.port | int | `80` |  |
| service.targetport | int | `3000` |  |
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
