# telescope-integration-scripts

Integration scripts for the [Telescope Project](https://rh-telescope.github.io/)

## Quick Installation

```shell
helm dependency update .
helm install [RELEASE_NAME] .
```

This command deploys the default configuration for the telescope-integration-scripts chart. The [Parameters] section describes the various ways in which the chart can be configured.

## Uninstallation

```shell
helm uninstall [RELEASE_NAME]
```

The previous command removes the previously installed chart.

## Parameters

The following table lists the configurable parameters of the telescope-backend chart and their default values.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| image | string | `""` |  |
| imagePullPolicy | string | `"Always"` |  |
| nodeSelector | object | `{}` |  |
| pullSecret.enabled | bool | `false` |  |
| pullSecret.secretKey | string | `".dockerconfigjson"` |  |
| pullSecret.secretName | string | `"pull-secret"` |  |
| replicaCount | int | `1` |  |
| resources | string | `nil` |  |
| schedule | string | `"0 * * * *"` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
