# Gatus Helm Chart

* Installs the automated service health dashboard [Gatus](https://github.com/TwinProduction/gatus)

## Get Repo Info

```console
helm repo add gatus https://avakarev.github.io/gatus-chart
helm repo update
```

_See [helm repo](https://helm.sh/docs/helm/helm_repo/) for command documentation._

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release gatus/gatus
```

## Uninstalling the Chart

To uninstall/delete the my-release deployment:

```console
helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

| Parameter                                 | Description                                   | Default                        |
|-------------------------------------------|-----------------------------------------------|--------------------------------|
| `replicas`                                | Number of nodes                               | `1`                            |
| `deploymentStrategy`                      | Deployment strategy                           | `{ "type": "RollingUpdate" }`  |
| `readinessProbe.enabled`                  | Enable readiness probe                        | `true`                         |
| `livenessProbe.enabled`                   | Enable liveness probe                         | `true`                         |
| `image.repository`                        | Image repository                              | `twinproduction/gatus`         |
| `image.tag`                               | Image tag                                     | `v2.1.0`                       |
| `image.pullPolicy`                        | Image pull policy                             | `IfNotPresent`                 |
| `image.pullSecrets`                       | Image pull secrets                            | `{}`                           |
| `service.type`                            | Type of service                               | `ClusterIP`                    |
| `service.port`                            | Port for kubernetes service                   | `80`                           |
| `service.annotations`                     | Service annotations                           | `{}`                           |
| `service.labels`                          | Custom labels                                 | `{}`                           |
| `ingress.enabled`                         | Enables Ingress                               | `false`                        |
| `ingress.annotations`                     | Ingress annotations (values are templated)    | `{}`                           |
| `ingress.labels`                          | Custom labels                                 | `{}`                           |
| `ingress.path`                            | Ingress accepted path                         | `/`                            |
| `ingress.hosts`                           | Ingress accepted hostnames                    | `["chart-example.local"]`      |
| `ingress.tls`                             | Ingress TLS configuration                     | `[]`                           |
| `env`                                     | Extra environment variables passed to pods    | `{}`                           |
| `resources`                               | CPU/Memory resource requests/limits           | `{}`                           |
| `nodeSelector`                            | Node labels for pod assignment                | `{}`                           |
| `config`                                  | [Gatus configuration][gatus-config]           | `{}`                           |

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
    version: 1.0.1
    values:
      - config:
          services:
            - name: Example
              url: https://example.com
              conditions:
                - '[STATUS] == 200'
```


[gatus-config]: https://github.com/TwinProduction/gatus#configuration
