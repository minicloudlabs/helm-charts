# YouTrack Helm Chart

> Installs powerful project management for all your teams [YouTrack](https://www.jetbrains.com/youtrack)

## Get Repo Info

```console
helm repo add minicloudlabs https://minicloudlabs.github.io/helm-charts
helm repo update
```

_See [helm repo](https://helm.sh/docs/helm/helm_repo/) for command documentation._

## Install Chart

```console
helm install --name [RELEASE_NAME] minicloudlabs/youtrack
```

_See [configuration](#configuration) below._
_See [helm install](https://helm.sh/docs/helm/helm_install/) for command documentation._

## Uninstall Chart

```console
helm delete --purge [RELEASE_NAME]
```

This removes all the Kubernetes components associated with the chart and deletes the release.
_See [helm uninstall](https://helm.sh/docs/helm/helm_uninstall/) for command documentation._

## Configuration

| Parameter                                 | Description                                     | Default                             |
|-------------------------------------------|-------------------------------------------------|-------------------------------------|
| `deployment.strategy`                     | Deployment strategy                             | `RollingUpdate`                     |
| `readinessProbe.enabled`                  | Enable readiness probe                          | `true`                              |
| `livenessProbe.enabled`                   | Enable liveness probe                           | `true`                              |
| `image.repository`                        | Image repository                                | `jetbrains/youtrack`                |
| `image.tag`                               | Overrides the YouTrack image tag                | ``                                  |
| `image.sha`                               | Image sha                                       | ``                                  |
| `image.pullPolicy`                        | Image pull policy                               | `IfNotPresent`                      |
| `image.pullSecrets`                       | Image pull secrets                              | `{}`                                |
| `hostNetwork.enabled`                     | Enable host network mode                        | `false`                             |
| `annotations`                             | Deployment annotations                          | `{}`                                |
| `labels`                                  | Deployment labels                               | `{}`                                |
| `podAnnotations`                          | Pod annotations                                 | `{}`                                |
| `podLabels`                               | Pod labels                                      | `{}`                                |
| `extraLabels`                             | Extra labels for all manifests                  | `{}`                                |
| `serviceAccount.create`                   | Create service account                          | `false`                             |
| `serviceAccount.name`                     | Service account name to use                     | ``                                  |
| `serviceAccount.annotations`              | ServiceAccount annotations                      | `{}`                                |
| `serviceAccount.autoMount`                | Automount the service account token in the pod  | `false`                             |
| `podSecurityContext.fsGroup`              | Pod volume's ownership GID                      | `13001`                             |
| `podSecurityContext.runAsUser`            | Pod volume's ownership UID                      | `13001`                             |
| `service.type`                            | Type of service                                 | `ClusterIP`                         |
| `service.port`                            | Port for kubernetes service                     | `80`                                |
| `service.targetPort`                      | Port for container                              | `8080`                              |
| `service.annotations`                     | Service annotations                             | `{}`                                |
| `service.labels`                          | Custom labels                                   | `{}`                                |
| `ingress.enabled`                         | Enables Ingress                                 | `false`                             |
| `ingress.annotations`                     | Ingress annotations (values are templated)      | `{}`                                |
| `ingress.labels`                          | Custom labels                                   | `{}`                                |
| `ingress.path`                            | Ingress accepted path                           | `/`                                 |
| `ingress.pathType`                        | Ingress type of path                            | `Prefix`                            |
| `ingress.extraPaths`                      | Ingress extra paths to prepend to every host    | `[]`                                |
| `ingress.hosts`                           | Ingress accepted hostnames                      | `["chart-example.local"]`           |
| `ingress.tls`                             | Ingress TLS configuration                       | `[]`                                |
| `env`                                     | Extra environment variables passed to pods      | `{}`                                |
| `extraVolumeMounts`                       | Extra volume mounts                             | `[]`                                |
| `secrets`                                 | Include secret's content in pod environment     | `false`                             |
| `resources`                               | CPU/Memory resource requests/limits             | `{}`                                |
| `nodeSelector`                            | Node labels for pod assignment                  | `{}`                                |
| `tolerations`                             | Tolerations for pod assignment                  | `[]`                                |
| `extraInitContainers`                     | Init containers to add to the youtrack pod      | `[]`                                |
| `persistence.enabled`                     | Use persistent volume to store data             | `false`                             |
| `persistence.size`                        | Size of persistent volume claim                 | `1Gi`                               |
| `persistence.mounthPath`                  | Persistent data volume's mount path             | `/data`                             |
| `persistence.subPath`                     | Mount a sub dir of the persistent volume        | `nil`                               |
| `persistence.accessModes`                 | Persistence access modes                        | `[ReadWriteOnce]`                   |
| `persistence.finalizers`                  | PersistentVolumeClaim finalizers                | `["kubernetes.io/pvc-protection"]`  |
| `persistence.annotations`                 | PersistentVolumeClaim annotations               | `{}`                                |
| `persistence.selectorLabels`              | PersistentVolumeClaim selector labels           | `{}`                                |
| `persistence.existingClaim`               | Use an existing PVC to persist data             | `nil`                               |
| `persistence.storageClassName`            | Type of persistent volume claim                 | `nil`                               |
| `networkPolicy.enabled`                   | Enable creation of NetworkPolicy resources      | `false`                             |
| `networkPolicy.ingress.selectors`         | List of Ingress Rule selectors                  | `[]`                                |

_See [Customizing the Chart Before Installing](https://helm.sh/docs/intro/using_helm/#customizing-the-chart-before-installing)._

To see all configurable options with detailed comments, visit the chart's [values.yaml](./youtrack/values.yaml), or run

```console
helm inspect values minicloudlabs/youtrack
```

### `helmfile.yaml` example

```yaml
---
repositories:
  - name: minicloudlabs
    url: https://minicloudlabs.github.io/helm-charts

releases:
  - name: youtrack
    namespace: youtrack
    chart: minicloudlabs/youtrack
    version: 1.0.3
    values:
      - persistence:
          enabled: true
```
