# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
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

[Unreleased]: https://github.com/avakarev/gatus-chart/compare/2.1.0...HEAD
[2.1.0]: https://github.com/avakarev/gatus-chart/compare/2.0.2...2.1.0
[2.0.2]: https://github.com/avakarev/gatus-chart/compare/2.0.1...2.0.2
[2.0.1]: https://github.com/avakarev/gatus-chart/compare/2.0.0...2.0.1
[2.0.0]: https://github.com/avakarev/gatus-chart/compare/1.1.4...2.0.0
[1.1.4]: https://github.com/avakarev/gatus-chart/compare/1.1.3...1.1.4
[1.1.3]: https://github.com/avakarev/gatus-chart/compare/1.1.2...1.1.3
[1.1.2]: https://github.com/avakarev/gatus-chart/compare/1.1.1...1.1.2
[1.1.1]: https://github.com/avakarev/gatus-chart/compare/1.1.0...1.1.1
[1.1.0]: https://github.com/avakarev/gatus-chart/compare/1.0.4...1.1.0
[1.0.4]: https://github.com/avakarev/gatus-chart/compare/1.0.3...1.0.4
[1.0.3]: https://github.com/avakarev/gatus-chart/compare/1.0.2...1.0.3
[1.0.2]: https://github.com/avakarev/gatus-chart/compare/1.0.1...1.0.2
[1.0.1]: https://github.com/avakarev/gatus-chart/compare/1.0.0...1.0.1
[1.0.0]: https://github.com/avakarev/gatus-chart/releases/tag/1.0.0
