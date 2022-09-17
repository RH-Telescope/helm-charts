# dashboard-react-app

The dashboard-react-app for the [Telescope Project](https://rh-telescope.github.io/)

## Quick Installation

```shell
helm dependency update .
helm install [RELEASE_NAME] .
```

This command deploys the default configuration for the dashboard-react-app chart. The [Parameters] section describes the various ways in which the chart can be configured.

## Uninstallation

```shell
helm uninstall [RELEASE_NAME]
```

The previous command removes the previously installed chart.

## Parameters

The following table lists the configurable parameters of the dashboard-react-app chart and their default values.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| image | string | `"quay.io/telescope/dashboard-react-app:latest"` |  |
| imagePullPolicy | string | `"Always"` |  |
| nodeSelector | object | `{}` |  |
| probe.livepath | string | `"/"` |  |
| probe.readypath | string | `"/"` |  |
| pullSecret.enabled | bool | `false` |  |
| pullSecret.secretKey | string | `".dockerconfigjson"` |  |
| pullSecret.secretName | string | `"pull-secret"` |  |
| replicaCount | int | `1` |  |
| resources | string | `nil` |  |
| route.annotations | object | `{}` |  |
| route.enabled | bool | `true` |  |
| route.name | string | `"dashboard-react-app"` |  |
| route.path | string | `"/"` |  |
| service.name | string | `"dashboard-react-app"` |  |
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
