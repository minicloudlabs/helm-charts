# Common Library Chart

> A Helm Library Chart for grouping common logic between Minicloud Labs charts

## Usage

```yaml
dependencies:
  - name: common
    version: 0.0.1
    repository: https://minicloudlabs.github.io/helm-charts
```

Note: use `repository: file://../charts/common` for local development.

```console
helm dependency update
```

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "common.names.fullname" . }}
data:
  myvalue: "Hello World"
```
