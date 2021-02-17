# Gatus Helm Chart

* Installs the automated service health dashboard [Gatus](https://github.com/TwinProduction/gatus)

## Configuration

| Parameter                                 | Description                                   | Default                                 |
|-------------------------------------------|-----------------------------------------------|-----------------------------------------|
| `replicas`                                | Number of nodes                               | `1`                                     |
| `deploymentStrategy`                      | Deployment strategy                           | `{ "type": "RollingUpdate" }`           |
| `readinessProbe.enabled`                  | Enable readiness probe                        | `true`                                  |
| `livenessProbe.enabled`                   | Enable liveness probe                         | `true`                                  |
| `image.repository`                        | Image repository                              | `twinproduction/gatus`                  |
| `image.tag`                               | Image tag                                     | `v2.1.0`                                |
| `image.pullPolicy`                        | Image pull policy                             | `IfNotPresent`                          |
| `image.pullSecrets`                       | Image pull secrets                            | `{}`                                    |
| `service.port`                            | Kubernetes port where service is exposed      | `80`                                    |
| `service.portName`                        | Name of the port on the service               | `service`                               |
| `service.targetPort`                      | Internal service port                         | `8080`                                  |
| `service.annotations`                     | Service annotations                           | `{}`                                    |
| `service.labels`                          | Custom labels                                 | `{}`                                    |
| `ingress.enabled`                         | Enables Ingress                               | `false`                                 |
| `ingress.annotations`                     | Ingress annotations (values are templated)    | `{}`                                    |
| `ingress.labels`                          | Custom labels                                 | `{}`                                    |
| `ingress.path`                            | Ingress accepted path                         | `/`                                     |
| `ingress.hosts`                           | Ingress accepted hostnames                    | `["chart-example.local"]`               |
| `ingress.tls`                             | Ingress TLS configuration                     | `[]`                                    |
| `env`                                     | Extra environment variables passed to pods    | `{}`                                    |
| `resources`                               | CPU/Memory resource requests/limits           | `{}`                                    |
| `nodeSelector`                            | Node labels for pod assignment                | `{}`                                    |
| `config`                                  | Service configuration https://github.com/TwinProduction/gatus#configuration | `{}`      |
