# Gatus Helm Chart

> Installs the automated service health dashboard [Gatus](https://github.com/TwiN/gatus)

**THIS REPOSITORY IS NO LONGER MAINTAINED.**

The gatus chart has been moved to the https://github.com/TwiN/helm-charts repo, and the new gatus chart version 1.0.0
from TwiN/helm-charts is a drop-in replacement for 3.4.5 from minicloudlabs/helm-charts.

To migrate your helmfile to the new repo, please replace


```
repositories:
- name: minicloudlabs
    url: https://minicloudlabs.github.io/helm-charts
---
releases:
- name: gatus
    chart: minicloudlabs/gatus
    version: 3.4.5
```

with

```
repositories:
- name: twin
    url: https://twin.github.io/helm-charts
---
releases:
- name: gatus
    chart: twin/gatus
    version: 1.0.0
```
