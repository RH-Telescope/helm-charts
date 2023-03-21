# telescope-toggle

The telescope-toggle for the [Telescope Project](https://rh-telescope.github.io/)

## Quick Installation

```shell
helm dependency update .
helm install [RELEASE_NAME] .
```

This command deploys the default configuration for the telescope-toggle chart. The [Parameters] section describes the various ways in which the chart can be configured.

## Uninstallation

```shell
helm uninstall [RELEASE_NAME]
```

The previous command removes the previously installed chart.

## Parameters

The following table lists the configurable parameters of the telescope-toggle chart and their default values.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| image | string | `"quay.io/telescope/telescope-toggle:latest"` |  |
| imagePullPolicy | string | `"Always"` |  |
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
| route.annotations | object | `{}` |  |
| route.enabled | bool | `true` |  |
| route.hostname | string | `""` |  |
| route.name | string | `"telescope-toggle"` |  |
| route.path | string | `"/"` |  |
| service.name | string | `"telescope-toggle"` |  |
| service.port | int | `80` |  |
| service.targetport | int | `8080` |  |
| service.type | string | `"ClusterIP"` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
