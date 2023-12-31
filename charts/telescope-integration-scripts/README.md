# telescope-integration-scripts

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Generic charts to support the tooling to integrate external tooling into Telescope.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| image | string | `""` |  |
| imagePullPolicy | string | `"Always"` |  |
| nodeSelector | object | `{}` |  |
| postgresql.database | string | `"telescope"` |  |
| postgresql.host | string | `"postgresql"` |  |
| postgresql.port | int | `5432` |  |
| postgresql.secretName | string | `"postgresql"` |  |
| pullSecret.enabled | bool | `false` |  |
| pullSecret.secretKey | string | `".dockerconfigjson"` |  |
| pullSecret.secretName | string | `"pull-secret"` |  |
| replicaCount | int | `1` |  |
| resources | string | `nil` |  |
| schedule | string | `"0 * * * *"` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
