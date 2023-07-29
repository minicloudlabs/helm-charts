# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [3.4.0] - 2023-07-29
### Changed
- Bump Gatus image v5.4.0 => v5.5.1

## [3.3.5] - 2023-05-18
### Changed
- Upgrade common lib 0.0.3 => 0.1.0

## [3.3.4] - 2023-05-18
### Changed
- Upgrade common lib 0.0.2 => 0.0.3

## [3.3.3] - 2023-05-17
### Changed
- Upgrade common lib 0.0.1 => 0.0.2

## [3.3.2] - 2023-05-17
### Added
- Migrate to common lib

## [3.3.1] - 2023-05-15
### Added
- Add support for custom ingress names

## [3.3.0] - 2023-05-08
### Changed
- Bump Gatus image v5.3.2 => v5.4.0

## [3.2.0] - 2023-04-10
### Added
- Add support for sidecarContainers
### Changed
- Bump Gatus image v5.3.1 => v5.3.2

## [3.1.5] - 2023-02-28
### Changed
- Bump Gatus image v5.3.0 => v5.3.1

## [3.1.4] - 2023-02-14
### Changed
- Bump Gatus image v5.2.0 => v5.3.0

## [3.1.3] - 2023-02-08
### Added
- Add support for init containers in extraInitContainers

## [3.1.2] - 2023-01-26
### Changed
- Bump Gatus image v5.1.1 => v5.2.0

## [3.1.1] - 2023-01-22
### Changed
- The values for image.tag is now empty by default and the Chart.yaml appVersion field is used instead
### Added
- Add support for image.sha

## [3.1.0] - 2023-01-22
### Added
- Add support for tolerations
- Add support for configMaps in extraVolumeMounts

## [3.0.1] - 2022-12-26
### Changed
- Bump Gatus image v5.1.0 => v5.1.1

## [3.0.0] - 2022-12-21
### Changed
- Bump Gatus image version v4.4.0 => v5.1.0

## [2.6.0] - 2022-12-05
### Added
- Make config checksum annotation configurable
### Fixed
- Fix indentation in pod template spec
### Changed
- Bump Gatus image version v4.3.2 => v4.4.0
- Refactor deploymentStrategy into deployment.strategy

## [2.5.5] - 2022-10-27
### Changed
- Bump Gatus image version v4.3.1 => v4.3.2

## [2.5.4] - 2022-10-20
### Changed
- Bump Gatus image version v4.3.0 => v4.3.1

## [2.5.3] - 2022-10-11
### Changed
- Bump Gatus image version v4.2.0 => v4.3.0

## [2.5.2] - 2022-09-19
### Changed
- Bump Gatus image version v4.1.0 => v4.2.0

## [2.5.1] - 2022-09-07
### Changed
- Bump Gatus image version v4.0.0 => v4.1.0

## [2.5.0] - 2022-06-28
### Changed
- Bump Gatus image version v3.8.0 => v4.0.0

## [2.4.0] - 2022-05-04
### Added
- Allow container's port customization using service.targetPort
- Implement support of ingress rules for NetworkPolicy

## [2.3.1] - 2022-04-27
### Changed
- Bump Gatus image version v3.7.0 => v3.8.0

## [2.3.0] - 2022-04-26
### Added
- Support extra labels
- Support servicemonitor

## [2.2.1] - 2022-03-27
### Changed
- Bump Gatus image version v3.6.0 => v3.7.0

## [2.2.0] - 2022-02-15
### Added
- Support service account
### Changed
- Enhance security context: make container's fs read-only by default

## [2.1.1] - 2022-02-06
### Changed
- Bump Gatus image version v3.5.0 => v3.6.0

## [2.1.0] - 2022-01-20
### Added
- Support extra volumes

## [2.0.2] - 2022-01-10
### Changed
- Bump Gatus image version v3.4.0 => v3.5.0

## [2.0.1] - 2021-12-03
### Changed
- Bump Gatus image version v3.3.0 => v3.4.0

## [2.0.0] - 2021-11-16
### Changed
- Migrate from helm v2 to helm v3
- Bump chart api version v1 => v2
- Upgrade Gatus v2.7.0 => v3.3.0, change persistence config accordingly
- Enhance ingress config, improve api compatibilty across k8s versions

## [1.1.4] - 2021-09-16
### Added
- Support custom pod annotations
- Support custom pod labels

## [1.1.3] - 2021-07-01
### Changed
- Bump Gatus image version v2.6.0 => v2.7.0

## [1.1.2] - 2021-06-08
### Changed
- Bump Gatus image version v2.4.0 => v2.6.0
- Mount /config path as read-only

## [1.1.1] - 2021-04-07
### Changed
- Bump Gatus image version v2.3.0 => v2.4.0

## [1.1.0] - 2021-04-07
### Added
- Support security contexts
- Introduce persistence via PVC

### Changed
- Bump Gatus image version v2.1.0 => v2.3.0

## [1.0.4] - 2021-02-19
### Added
- Integrate artifacthub.io
- readme: add badges
- chart: add maintainers
- ci: add github workflow to lint chart
### Fixed
- chart: fix sources link

## [1.0.3] - 2021-02-18
### Added
- Support `hostNetwork`, disabled by default

## [1.0.2] - 2021-02-18
### Added
- Add missing docs to install/uninstall chart
- Support `revisionHistoryLimit`, default to 3
### Changed
- Simplify service configuration

## [1.0.1] - 2021-02-17
### Changed
- Simplify readiness/liveness probes configuration
- Refactor Gatus config gocs reference

## [1.0.0] - 2021-02-17
### Added
- Initial implementation

[Unreleased]: https://github.com/minicloudlabs/helm-charts/compare/gatus-3.4.0...HEAD
[3.4.0]: https://github.com/minicloudlabs/helm-charts/compare/gatus-3.3.4...gatus-3.4.0
[3.3.4]: https://github.com/minicloudlabs/helm-charts/compare/gatus-3.3.3...gatus-3.3.4
[3.3.3]: https://github.com/minicloudlabs/helm-charts/compare/gatus-3.3.2...gatus-3.3.3
[3.3.2]: https://github.com/minicloudlabs/helm-charts/compare/gatus-3.3.1...gatus-3.3.2
[3.3.1]: https://github.com/minicloudlabs/helm-charts/compare/gatus-3.3.0...gatus-3.3.1
[3.3.0]: https://github.com/minicloudlabs/helm-charts/compare/gatus-3.2.0...gatus-3.3.0
[3.2.0]: https://github.com/minicloudlabs/helm-charts/compare/gatus-3.1.5...gatus-3.2.0
[3.1.5]: https://github.com/minicloudlabs/helm-charts/compare/gatus-3.1.4...gatus-3.1.5
[3.1.4]: https://github.com/minicloudlabs/helm-charts/compare/gatus-3.1.3...gatus-3.1.4
[3.1.3]: https://github.com/minicloudlabs/helm-charts/compare/gatus-3.1.2...gatus-3.1.3
[3.1.2]: https://github.com/minicloudlabs/helm-charts/compare/gatus-3.1.1...gatus-3.1.2
[3.1.1]: https://github.com/minicloudlabs/helm-charts/compare/gatus-3.1.0...gatus-3.1.1
[3.1.0]: https://github.com/minicloudlabs/helm-charts/compare/gatus-3.0.1...gatus-3.1.0
[3.0.1]: https://github.com/minicloudlabs/helm-charts/compare/gatus-3.0.0...gatus-3.0.1
[3.0.0]: https://github.com/minicloudlabs/helm-charts/compare/2.6.0...gatus-3.0.0
[2.6.0]: https://github.com/minicloudlabs/helm-charts/compare/2.5.5...2.6.0
[2.5.5]: https://github.com/minicloudlabs/helm-charts/compare/2.5.4...2.5.5
[2.5.4]: https://github.com/minicloudlabs/helm-charts/compare/2.5.3...2.5.4
[2.5.3]: https://github.com/minicloudlabs/helm-charts/compare/2.5.2...2.5.3
[2.5.2]: https://github.com/minicloudlabs/helm-charts/compare/2.5.1...2.5.2
[2.5.1]: https://github.com/minicloudlabs/helm-charts/compare/2.5.0...2.5.1
[2.5.0]: https://github.com/minicloudlabs/helm-charts/compare/2.4.0...2.5.0
[2.4.0]: https://github.com/minicloudlabs/helm-charts/compare/2.3.1...2.4.0
[2.3.1]: https://github.com/minicloudlabs/helm-charts/compare/2.3.0...2.3.1
[2.3.0]: https://github.com/minicloudlabs/helm-charts/compare/2.2.1...2.3.0
[2.2.1]: https://github.com/minicloudlabs/helm-charts/compare/2.2.0...2.2.1
[2.2.0]: https://github.com/minicloudlabs/helm-charts/compare/2.1.1...2.2.0
[2.1.1]: https://github.com/minicloudlabs/helm-charts/compare/2.1.0...2.1.1
[2.1.0]: https://github.com/minicloudlabs/helm-charts/compare/2.0.2...2.1.0
[2.0.2]: https://github.com/minicloudlabs/helm-charts/compare/2.0.1...2.0.2
[2.0.1]: https://github.com/minicloudlabs/helm-charts/compare/2.0.0...2.0.1
[2.0.0]: https://github.com/minicloudlabs/helm-charts/compare/1.1.4...2.0.0
[1.1.4]: https://github.com/minicloudlabs/helm-charts/compare/1.1.3...1.1.4
[1.1.3]: https://github.com/minicloudlabs/helm-charts/compare/1.1.2...1.1.3
[1.1.2]: https://github.com/minicloudlabs/helm-charts/compare/1.1.1...1.1.2
[1.1.1]: https://github.com/minicloudlabs/helm-charts/compare/1.1.0...1.1.1
[1.1.0]: https://github.com/minicloudlabs/helm-charts/compare/1.0.4...1.1.0
[1.0.4]: https://github.com/minicloudlabs/helm-charts/compare/1.0.3...1.0.4
[1.0.3]: https://github.com/minicloudlabs/helm-charts/compare/1.0.2...1.0.3
[1.0.2]: https://github.com/minicloudlabs/helm-charts/compare/1.0.1...1.0.2
[1.0.1]: https://github.com/minicloudlabs/helm-charts/compare/1.0.0...1.0.1
[1.0.0]: https://github.com/minicloudlabs/helm-charts/releases/tag/1.0.0
