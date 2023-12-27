# postgresql

![Version: 0.4.0](https://img.shields.io/badge/Version-0.4.0-informational?style=flat-square)

Postgresql Helm Chart

**Homepage:** <https://project-telescope.com>

## Source Code

* <https://github.com/RH-Telescope/helm-charts>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| postgresql.autogenImage | string | `"docker.io/bitnami/kubectl:latest"` |  |
| postgresql.autogenPassword | bool | `true` |  |
| postgresql.database | string | `"telescope"` |  |
| postgresql.envVarKeys.database | string | `"POSTGRES_DB"` |  |
| postgresql.envVarKeys.password | string | `"POSTGRES_PASSWORD"` |  |
| postgresql.envVarKeys.user | string | `"POSTGRES_USER"` |  |
| postgresql.external | bool | `false` |  |
| postgresql.image | string | `"docker.io/postgres:13"` |  |
| postgresql.port | int | `5432` |  |
| postgresql.resources.limits.cpu | string | `"400m"` |  |
| postgresql.resources.limits.memory | string | `"596Mi"` |  |
| postgresql.resources.requests.cpu | string | `"100m"` |  |
| postgresql.resources.requests.memory | string | `"128Mi"` |  |
| postgresql.storage.enabled | bool | `true` |  |
| postgresql.storage.mountPath | string | `"/var/lib/postgresql"` |  |
| postgresql.storage.size | string | `"2Gi"` |  |
| postgresql.storage.storageClass | string | `""` |  |
| postgresql.user | string | `"telescope"` |  |
| resources | object | `{}` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |

----------------------------------------------
