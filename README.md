# Gatus Helm Chart

[![CI Status](https://img.shields.io/github/workflow/status/avakarev/gatus-chart/Test%20Workflow/master?longCache=tru&label=CI%20Status&logo=github%20actions&logoColor=fff)](https://github.com/avakarev/gatus-chart/actions?query=branch%3Amaster+workflow%3A%22Test+Workflow%22)
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/gatus)](https://artifacthub.io/packages/helm/gatus/gatus)
[![License: MIT](https://img.shields.io/github/license/avakarev/gatus-chart)](https://github.com/avakarev/gatus-chart/blob/master/LICENSE)

> Installs the automated service health dashboard [Gatus](https://github.com/TwinProduction/gatus)

## Get Repo Info

```console
helm repo add gatus https://avakarev.github.io/gatus-chart
helm repo update
```

_See [helm repo](https://helm.sh/docs/helm/helm_repo/) for command documentation._

## Install Chart

```console
helm install --name [RELEASE_NAME] gatus/gatus
```

_See [configuration](#configuration) below._
_See [helm install](https://helm.sh/docs/helm/helm_install/) for command documentation._

## Uninstall Chart

```console
helm delete --purge [RELEASE_NAME]
```

This removes all the Kubernetes components associated with the chart and deletes the release.
_See [helm uninstall](https://helm.sh/docs/helm/helm_uninstall/) for command documentation._

## Upgrade Chart

```console
helm upgrade [RELEASE_NAME] gatus --install
```

_See [helm upgrade](https://helm.sh/docs/helm/helm_upgrade/) for command documentation._

## Configuration

| Parameter                                 | Description                                   | Default                              |
|-------------------------------------------|-----------------------------------------------|--------------------------------------|
| `deploymentStrategy`                      | Deployment strategy                           | `RollingUpdate`                      |
| `readinessProbe.enabled`                  | Enable readiness probe                        | `true`                               |
| `livenessProbe.enabled`                   | Enable liveness probe                         | `true`                               |
| `image.repository`                        | Image repository                              | `twinproduction/gatus`               |
| `image.tag`                               | Image tag                                     | `v2.7.0`                             |
| `image.pullPolicy`                        | Image pull policy                             | `IfNotPresent`                       |
| `image.pullSecrets`                       | Image pull secrets                            | `{}`                                 |
| `hostNetwork.enabled`                     | Enable host network mode                      | `false`                              |
| `podSecurityContext.fsGroup`              | Pod volume's ownership GID                    | `65534`                              |
| `securityContext.runAsUser`               | Container processes' user id                  | `65534`                              |
| `securityContext.runAsGroup`              | Container processes' group id                 | `65534`                              |
| `service.type`                            | Type of service                               | `ClusterIP`                          |
| `service.port`                            | Port for kubernetes service                   | `80`                                 |
| `service.annotations`                     | Service annotations                           | `{}`                                 |
| `service.labels`                          | Custom labels                                 | `{}`                                 |
| `ingress.enabled`                         | Enables Ingress                               | `false`                              |
| `ingress.annotations`                     | Ingress annotations (values are templated)    | `{}`                                 |
| `ingress.labels`                          | Custom labels                                 | `{}`                                 |
| `ingress.path`                            | Ingress accepted path                         | `/`                                  |
| `ingress.hosts`                           | Ingress accepted hostnames                    | `["chart-example.local"]`            |
| `ingress.tls`                             | Ingress TLS configuration                     | `[]`                                 |
| `env`                                     | Extra environment variables passed to pods    | `{}`                                 |
| `resources`                               | CPU/Memory resource requests/limits           | `{}`                                 |
| `nodeSelector`                            | Node labels for pod assignment                | `{}`                                 |
| `persistence.enabled`                     | Use persistent volume to store data           | `false`                              |
| `persistence.accessModes`                 | Persistence access modes                      | `[ReadWriteOnce]`                    |
| `persistence.size`                        | Size of persistent volume claim               | `50Mi`                               |
| `persistence.mounthPath`                  | Persistent data volume's mount path           | `/data`                              |
| `persistence.storage.file`                | File path to persist the data in              | `/data/persistent-storage.file`      |
| `config`                                  | [Gatus configuration][gatus-config]           | `{}`                                 |

_See [Customizing the Chart Before Installing](https://helm.sh/docs/intro/using_helm/#customizing-the-chart-before-installing)._

To see all configurable options with detailed comments, visit the chart's [values.yaml](./gatus/values.yaml), or run

```console
helm inspect values gatus/gatus
```

### `helmfile.yaml` example

```yaml
---
repositories:
  - name: gatus
    url: https://avakarev.github.io/gatus-chart

releases:
  - name: gatus
    namespace: gatus
    chart: gatus/gatus
    version: 1.1.3
    values:
      - config:
          services:
            - name: Example
              url: https://example.com
              conditions:
                - '[STATUS] == 200'
```

## License

`gatus-chart` is licensed under MIT license. (see [LICENSE](./LICENSE))


[gatus-config]: https://github.com/TwinProduction/gatus#configuration
