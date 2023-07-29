# Gatus Helm Chart

> Installs the automated service health dashboard [Gatus](https://github.com/TwiN/gatus)

## Get Repo Info

```console
helm repo add minicloudlabs https://minicloudlabs.github.io/helm-charts
helm repo update
```

_See [helm repo](https://helm.sh/docs/helm/helm_repo/) for command documentation._

## Install Chart

```console
helm install --name [RELEASE_NAME] minicloudlabs/gatus
```

_See [configuration](#configuration) below._
_See [helm install](https://helm.sh/docs/helm/helm_install/) for command documentation._

## Uninstall Chart

```console
helm delete --purge [RELEASE_NAME]
```

This removes all the Kubernetes components associated with the chart and deletes the release.
_See [helm uninstall](https://helm.sh/docs/helm/helm_uninstall/) for command documentation._

## Upgrading an existing Release to a new major version

### To 3.0.0

This version bumps Gatus image from 4.4.0 to 5.1.0, so your config from v4 could potentially have incompatibilities with v5.
Please check corresponding Gatus release changelog: [v5.0.0](https://github.com/TwiN/gatus/releases/tag/v5.0.0) and
[v5.1.0](https://github.com/TwiN/gatus/releases/tag/v5.1.0).

### To 2.0.0

This version requires Helm >= 3
Gatus version is upgraded from 2 to 3. Gatus 3 deprecates `memory` type of storage, supports `sqlite` and `postgres`.
`storage` is not part of `persistence` anymore and is part of `config` now. Check the example below.

## Configuration

| Parameter                                 | Description                                     | Default                             |
|-------------------------------------------|-------------------------------------------------|-------------------------------------|
| `deployment.strategy`                     | Deployment strategy                             | `RollingUpdate`                     |
| `deployment.annotateConfigChecksum`       | Restart pod when config changed                 | `true`                              |
| `readinessProbe.enabled`                  | Enable readiness probe                          | `true`                              |
| `livenessProbe.enabled`                   | Enable liveness probe                           | `true`                              |
| `image.repository`                        | Image repository                                | `twinproduction/gatus`              |
| `image.tag`                               | Overrides the Gatus image tag                   | ``                                  |
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
| `podSecurityContext.fsGroup`              | Pod volume's ownership GID                      | `65534`                             |
| `securityContext.runAsNonRoot`            | Container runs as a non-root user               | `true`                              |
| `securityContext.runAsUser`               | Container processes' UID to run the entrypoint  | `65534`                             |
| `securityContext.runAsGroup`              | Container processes' GID to run the entrypoint  | `65534`                             |
| `securityContext.readOnlyRootFilesystem`  | Container's root filesystem is read-only        | `true`                              |
| `service.type`                            | Type of service                                 | `ClusterIP`                         |
| `service.port`                            | Port for kubernetes service                     | `80`                                |
| `service.targetPort`                      | Port for container                              | `8080`                              |
| `service.annotations`                     | Service annotations                             | `{}`                                |
| `service.labels`                          | Custom labels                                   | `{}`                                |
| `ingress.enabled`                         | Enables Ingress                                 | `false`                             |
| `ingress.ingressClassName`                | Ingress ClassName (for k8s 1.18+)               | ``                                  |
| `ingress.name`                            | Ingress name                                    | ``                                  |
| `ingress.annotations`                     | Ingress annotations (values are templated)      | `{}`                                |
| `ingress.labels`                          | Custom labels                                   | `{}`                                |
| `ingress.path`                            | Ingress accepted path                           | `/`                                 |
| `ingress.pathType`                        | Ingress type of path                            | `Prefix`                            |
| `ingress.extraPaths`                      | Ingress extra paths to prepend to every host    | `[]`                                |
| `ingress.hosts`                           | Ingress accepted hostnames                      | `["chart-example.local"]`           |
| `ingress.tls`                             | Ingress TLS configuration                       | `[]`                                |
| `env`                                     | Extra environment variables passed to pods      | `{}`                                |
| `sidecarContainers`                       | Sidecar containers in the pod                   | `{}`                                |
| `extraVolumeMounts`                       | Extra volume mounts                             | `[]`                                |
| `secrets`                                 | Include secret's content in pod environment     | `false`                             |
| `resources`                               | CPU/Memory resource requests/limits             | `{}`                                |
| `nodeSelector`                            | Node labels for pod assignment                  | `{}`                                |
| `tolerations`                             | Tolerations for pod assignment                  | `[]`                                |
| `extraInitContainers`                     | Init containers to add to the gatus pod         | `[]`                                |
| `persistence.enabled`                     | Use persistent volume to store data             | `false`                             |
| `persistence.size`                        | Size of persistent volume claim                 | `200Mi`                             |
| `persistence.mounthPath`                  | Persistent data volume's mount path             | `/data`                             |
| `persistence.subPath`                     | Mount a sub dir of the persistent volume        | `nil`                               |
| `persistence.accessModes`                 | Persistence access modes                        | `[ReadWriteOnce]`                   |
| `persistence.finalizers`                  | PersistentVolumeClaim finalizers                | `["kubernetes.io/pvc-protection"]`  |
| `persistence.annotations`                 | PersistentVolumeClaim annotations               | `{}`                                |
| `persistence.selectorLabels`              | PersistentVolumeClaim selector labels           | `{}`                                |
| `persistence.existingClaim`               | Use an existing PVC to persist data             | `nil`                               |
| `persistence.storageClassName`            | Type of persistent volume claim                 | `nil`                               |
| `serviceMonitor.enabled`                  | Use servicemonitor from prometheus operator     | `false`                             |
| `serviceMonitor.namespace`                | Namespace this servicemonitor is installed in   | ``                                  |
| `serviceMonitor.interval`                 | How frequently Prometheus should scrape         | `1m`                                |
| `serviceMonitor.path`                     | Path to scrape                                  | `/metrics`                          |
| `serviceMonitor.scheme`                   | Scheme to use for metrics scraping              | `http`                              |
| `serviceMonitor.tlsConfig`                | TLS configuration block for the endpoint        | `{}`                                |
| `serviceMonitor.labels`                   | Labels for the servicemonitor object            | `{}`                                |
| `serviceMonitor.scrapeTimeout`            | Timeout after which the scrape is ended         | `30s`                               |
| `serviceMonitor.relabelings`              | RelabelConfigs for samples before ingestion     | `[]`                                |
| `networkPolicy.enabled`                   | Enable creation of NetworkPolicy resources      | `false`                             |
| `networkPolicy.ingress.selectors`         | List of Ingress Rule selectors                  | `[]`                                |
| `config`                                  | [Gatus configuration][gatus-config]             | `{}`                                |

_See [Customizing the Chart Before Installing](https://helm.sh/docs/intro/using_helm/#customizing-the-chart-before-installing)._

To see all configurable options with detailed comments, visit the chart's [values.yaml](./gatus/values.yaml), or run

```console
helm inspect values minicloudlabs/gatus
```

### `helmfile.yaml` example

```yaml
---
repositories:
  - name: minicloudlabs
    url: https://minicloudlabs.github.io/helm-charts

releases:
  - name: gatus
    namespace: gatus
    chart: minicloudlabs/gatus
    version: 3.4.0
    values:
      - persistence:
          enabled: true
      - config:
          storage:
            type: sqlite
            path: /data/data.db
          endpoints:
            - name: Example
              url: https://example.com
              conditions:
                - '[STATUS] == 200'
```


[gatus-config]: https://github.com/TwiN/gatus#configuration
