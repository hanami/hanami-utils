# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Break Versioning](https://www.taoensso.com/break-versioning).

## [Unreleased]

### Added

### Changed

### Deprecated

### Removed

### Fixed

### Security

[Unreleased]: https://github.com/hanami/hanami-utils/compare/v3.0.0...main

## [3.0.0] - 2026-06-30

### Changed

- Require Ruby 3.3 or newer.

[3.0.0]: https://github.com/hanami/hanami-utils/compare/v2.3.0...v3.0.0

## [3.0.0.rc1] - 2026-06-16

### Changed

- Require Ruby 3.3 or newer.

[3.0.0.rc1]: https://github.com/hanami/hanami-utils/compare/v2.3.0...v3.0.0.rc1

## [2.3.0] - 2025-11-12

[2.3.0]: https://github.com/hanami/hanami-utils/compare/v2.3.0.beta2...v2.3.0

## [2.3.0.beta2] - 2025-10-17

### Changed

- Drop support for Ruby 3.1

[2.3.0.beta2]: https://github.com/hanami/hanami-utils/compare/v2.3.0.beta1...v2.3.0.beta2

## [2.3.0.beta1] - 2025-10-03

[2.3.0.beta1]: https://github.com/hanami/hanami-utils/compare/v2.2.0...v2.3.0.beta1

## [2.2.0] - 2024-11-05

[2.2.0]: https://github.com/hanami/hanami-utils/compare/v2.2.0.rc1...v2.2.0

## [2.2.0.rc1] - 2024-10-29

[2.2.0.rc1]: https://github.com/hanami/hanami-utils/compare/v2.2.0.beta2...v2.2.0.rc1

## [2.2.0.beta2] - 2024-09-25

[2.2.0.beta2]: https://github.com/hanami/hanami-utils/compare/v2.2.0.beta1...v2.2.0.beta2

## [2.2.0.beta1] - 2024-07-16

### Changed

- Drop support for Ruby 3.0

[2.2.0.beta1]: https://github.com/hanami/hanami-utils/compare/v2.1.0...v2.2.0.beta1

## [2.1.0] - 2024-02-27

[2.1.0]: https://github.com/hanami/hanami-utils/compare/v2.1.0.rc3...v2.1.0

## [2.1.0.rc3] - 2024-02-16

[2.1.0.rc3]: https://github.com/hanami/hanami-utils/compare/v2.1.0.rc2...v2.1.0.rc3

## [2.1.0.rc2] - 2023-11-08

[2.1.0.rc2]: https://github.com/hanami/hanami-utils/compare/v2.1.0.beta1...v2.1.0.rc2

## [2.1.0.beta1] - 2023-06-29

### Changed

- Remove `Hanami::Utils::Escape` (which was not public as of 2.0.0). (Tim Riley in #410)

[2.1.0.beta1]: https://github.com/hanami/hanami-utils/compare/v2.0.3...v2.1.0.beta1

## [2.0.3] - 2023-02-01

### Fixed

- `Hanami::Utils::Blank.blank?` to check if the current object is non-nil. (hi-tech-jazz)

[2.0.3]: https://github.com/hanami/hanami-utils/compare/v2.0.2...v2.0.3

## [2.0.2] - 2022-12-25

### Added

- Official support for Ruby 3.2. (Luca Guidi)

[2.0.2]: https://github.com/hanami/hanami-utils/compare/v2.0.1...v2.0.2

## [2.0.1] - 2022-12-06

### Fixed

- Make `Hanami::Utils::Callbacks::Chain` and `Hanami::Utils::Callbacks::Callback` comparable via `#==` based on their contents, rather than their object identity. (Tim Riley)

[2.0.1]: https://github.com/hanami/hanami-utils/compare/v2.0.0...v2.0.1

## [2.0.0] - 2022-11-22

[2.0.0]: https://github.com/hanami/hanami-utils/compare/v2.0.0.rc1...v2.0.0

## [2.0.0.rc1] - 2022-11-08

### Fixed

- Ensure `Hanami::Utils::String.underscore` to replace `"."` (dot character) into underscore. (Benjamin Klotz)

### Changed

- Removed `Hanami::Logger` in favor of `Dry::Logger`. (Luca Guidi)

[2.0.0.rc1]: https://github.com/hanami/hanami-utils/compare/v2.0.0.beta1...v2.0.0.rc1

## [2.0.0.beta1] - 2022-07-20

### Changed

- Removed `Hanami::Utils::BasicObject` (moved to `dry-core` as `Dry::Core::BasicObject`). (Luca Guidi)
- Removed `Hanami::Interactor`. (Luca Guidi)

[2.0.0.beta1]: https://github.com/hanami/hanami-utils/compare/v2.0.0.alpha6...v2.0.0.beta1

## [2.0.0.alpha6] - 2022-02-10

### Added

- Official support for Ruby: MRI 3.0 and 3.1. (Luca Guidi)

### Fixed

- Allow `Hanami::Logger#initialize` to accept `File::NULL` as `stream:` argument. (Rob Jacoby)

### Changed

- Drop support for Ruby: MRI 2.6 and 2.7. (Luca Guidi)

[2.0.0.alpha6]: https://github.com/hanami/hanami-utils/compare/v2.0.0.alpha3...v2.0.0.alpha6

## [2.0.0.alpha3] - 2021-11-09

No changes.

[2.0.0.alpha3]: https://github.com/hanami/hanami-utils/compare/v2.0.0.alpha2...v2.0.0.alpha3

## [2.0.0.alpha2] - 2021-05-04

### Changed

- Drop support for Ruby: MRI 2.5. (Luca Guidi)
- Transform `Utils::String` from class to module. (Luca Guidi)

[2.0.0.alpha2]: https://github.com/hanami/hanami-utils/compare/v2.0.0.alpha1...v2.0.0.alpha2

## [2.0.0.alpha1] - 2019-01-30

### Added

- Introduce `Hanami::Middleware` namespace. (Gustavo Caso)
- Introduce `Callbacks::Chain#dup`. (Luca Guidi)

### Changed

- Drop support for Ruby: MRI 2.3, and 2.4. (Luca Guidi)
- Remove `Utils::Duplicable`. (Luca Guidi)
- Remove `Utils::Inflector`. (Luca Guidi)
- Remove `Utils::String.singularize`, and `.pluralize`. (Luca Guidi)
- Remove `Utils::String#singularize`, and `#pluralize`. (Luca Guidi)
- Remove instance level interface for `Utils::Hash`. (Luca Guidi)
- Transform `Utils::Hash` from class to module. (Luca Guidi)
- Remove `Utils.reload!`. (Luca Guidi)
- Remove `Utils::File.rewrite`. (Gustavo Caso)
- Remove `Utils::Class.load_from_pattern!`. (Vladimir Suvorov)

[2.0.0.alpha1]: https://github.com/hanami/hanami-utils/compare/v1.3.8...v2.0.0.alpha1

## [1.3.8] - 2021-05-03

### Fixed

- Ensure `Hanami::Interactor#initialize` to accept keyword arguments while working with Ruby 3. (Hiếu Nguyễn)

[1.3.8]: https://github.com/hanami/hanami-utils/compare/v1.3.7...v1.3.8

## [1.3.7] - 2021-01-04

### Added

- Official support for Ruby: MRI 3.0. (Luca Guidi)
- Allow `Hanami::Logger` to filter sensitive data for an array of hashes. (Khai Le)

### Fixed

- Ensure `Hanami::Logger` to not mutate `Hash` input when filtering sensitive data. (Hiếu Nguyễn)

[1.3.7]: https://github.com/hanami/hanami-utils/compare/v1.3.6...v1.3.7

## [1.3.6] - 2020-01-07

### Added

- Official support for Ruby: MRI 2.7. (Luca Guidi)

### Fixed

- `Utils::Files.append`: don't check breakline if file is empty. (ippachi)

[1.3.6]: https://github.com/hanami/hanami-utils/compare/v1.3.5...v1.3.6

## [1.3.5] - 2019-10-25

### Fixed

- Ensure `Hanami::Logger` filters to not crash when logger stream is a closed tempfile. (Ivan Kabluchkov)
- Ensure `Utils::Files.append` to append contents properly when existing file doesn't end with a newline. (Luca Guidi)

[1.3.5]: https://github.com/hanami/hanami-utils/compare/v1.3.4...v1.3.5

## [1.3.4] - 2019-09-27

### Added

- Let `Utils::BasicObject` to lookup constants at the top-level namespace. (Luca Guidi)

[1.3.4]: https://github.com/hanami/hanami-utils/compare/v1.3.3...v1.3.4

## [1.3.3] - 2019-09-13

### Fixed

- Ensure `Utils::Inflector.pluralize` and `.singularize` to work with words that contain an underscore (`_`). (Mauro Morales)

[1.3.3]: https://github.com/hanami/hanami-utils/compare/v1.3.2...v1.3.3

## [1.3.2] - 2019-06-21

### Added

- Added `Utils::BasicObject#instance_of?`, `#is_a?`, and `#kind_of`. (Vladislav Yashin & Luca Guidi)

[1.3.2]: https://github.com/hanami/hanami-utils/compare/v1.3.1...v1.3.2

## [1.3.1] - 2019-01-18

### Added

- Official support for Ruby: MRI 2.6. (Luca Guidi)
- Support `bundler` 2.0+. (Luca Guidi)

### Fixed

- Fix `Hash` serialization for `Utils::Logger`. (Alfonso Uceda)
- Add missing `pathname` require in `lib/hanami/utils.rb`. (Jeff Dickey)

[1.3.1]: https://github.com/hanami/hanami-utils/compare/v1.3.0...v1.3.1

## [1.3.0] - 2018-10-24

[1.3.0]: https://github.com/hanami/hanami-utils/compare/v1.3.0.beta1...v1.3.0

## [1.3.0.beta1] - 2018-08-08

### Added

- Official support for JRuby 9.2.0.0. (Luca Guidi)
- Add `Utils::Files.inject_line_before_last` and `.inject_line_after_last`. (graywolf)

### Fixed

- Don't show `Fixnum` Ruby warning for 2.4+. (graywolf)
- Fix pluralization of `"fee"`. (Luca Guidi)

### Deprecated

- Deprecate `Utils::String` as Ruby type. Please use `Utils::String` class methods instead of `Utils::String.new("")`. (Luca Guidi & Marion Schleifer)
- Deprecate `Utils::Hash` as Ruby type. Please use `Utils::Hash` class methods instead of `Utils::Hash.new({})`. (Luca Guidi & Marion Schleifer)
- Deprecate `Utils::String.pluralize` and `.singularize`. (Luca Guidi & Marion Schleifer)
- Deprecate `Utils::Class.load_from_pattern!`. (Semyon Pupkov)

[1.3.0.beta1]: https://github.com/hanami/hanami-utils/compare/v1.2.0...v1.3.0.beta1

## [1.2.0] - 2018-04-11

[1.2.0]: https://github.com/hanami/hanami-utils/compare/v1.2.0.rc2...v1.2.0

## [1.2.0.rc2] - 2018-04-06

### Added

- Use different colors for each `Hanami::Logger` level. (Luca Guidi)

[1.2.0.rc2]: https://github.com/hanami/hanami-utils/compare/v1.2.0.rc1...v1.2.0.rc2

## [1.2.0.rc1] - 2018-03-30

### Added

- Colored logging. (Oana Sipos & Sean Collins & Luca Guidi)

### Fixed

- Make `Hanami::Logger` to properly log hash messages. (Luca Guidi)

[1.2.0.rc1]: https://github.com/hanami/hanami-utils/compare/v1.2.0.beta2...v1.2.0.rc1

## [1.2.0.beta2] - 2018-03-23

[1.2.0.beta2]: https://github.com/hanami/hanami-utils/compare/v1.2.0.beta1...v1.2.0.beta2

## [1.2.0.beta1] - 2018-02-28

[1.2.0.beta1]: https://github.com/hanami/hanami-utils/compare/v1.1.2...v1.2.0.beta1

## [1.1.2] - 2018-02-02

### Added

- Official support for Ruby: MRI 2.5. (Luca Guidi)

### Fixed

- Make `Utils::Files.write` idempotent: ensure to truncate the file before to write. (Sean Collins & Luca Guidi)
- Don't erase file contents when invoking `Utils::Files.touch`. (Sean Collins & Luca Guidi)

### Changed

- Deprecate `Utils::Files.rewrite` in favor of `.write`. (Sean Collins & Luca Guidi)

[1.1.2]: https://github.com/hanami/hanami-utils/compare/v1.1.1...v1.1.2

## [1.1.1] - 2017-11-22

### Added

- Introduce `Utils::Hash.deep_stringify` to recursively stringify a hash. (Luca Guidi)

### Fixed

- Ensure `Interactor#call` to accept non-keyword arguments. (Yuta Tokitake)

[1.1.1]: https://github.com/hanami/hanami-utils/compare/v1.1.0...v1.1.1

## [1.1.0] - 2017-10-25

### Added

- Introduce `Utils::Hash.deep_serialize` to recursively serialize input into `::Hash`. (Luca Guidi)

[1.1.0]: https://github.com/hanami/hanami-utils/compare/v1.1.0.rc1...v1.1.0

## [1.1.0.rc1] - 2017-10-16

[1.1.0.rc1]: https://github.com/hanami/hanami-utils/compare/v1.1.0.beta3...v1.1.0.rc1

## [1.1.0.beta3] - 2017-10-04

[1.1.0.beta3]: https://github.com/hanami/hanami-utils/compare/v1.1.0.beta2...v1.1.0.beta3

## [1.1.0.beta2] - 2017-10-03

### Added

- Auto create directory for `Hanami::Logger`. (Alfonso Uceda)

[1.1.0.beta2]: https://github.com/hanami/hanami-utils/compare/v1.1.0.beta1...v1.1.0.beta2

## [1.1.0.beta1] - 2017-08-11

### Added

- Allow `Hanami::Interactor#call` to accept arguments. `#initialize` should be used for Dependency Injection, while `#call` should be used for input. (Marion Duprey)
- Introduce `Utils::Hash.stringify`. (Marion Schleifer)
- Introduce `Utils::String.titleize`, `.capitalize`, `.classify`, `.underscore`, `.dasherize`, `.demodulize`, `.namespace`, `.pluralize`, `.singularize`, and `.rsub`. (Marion Schleifer)
- Introduce `Utils::Files`: a set of utils for file manipulations. (Luca Guidi)
- Introduce `Utils::String.transform` a pipelined transformations for strings. (Luca Guidi)
- Filter sensitive informations for `Hanami::Logger`. (Marion Duprey & Gabriel Gizotti)

[1.1.0.beta1]: https://github.com/hanami/hanami-utils/compare/v1.0.4...v1.1.0.beta1

## [1.0.4] - 2017-10-02

### Fixed

- Make `Hanami::Utils::BasicObject` to be fully compatible with Ruby's `pp` and to be inspected by Pry. (Luca Guidi)
- Fix pluralization/singularization for `"release" => "releases"`. (Thiago Kenji Okada)

[1.0.4]: https://github.com/hanami/hanami-utils/compare/v1.0.3...v1.0.4

## [1.0.3] - 2017-09-06

### Fixed

- Fix pluralization/singularization for `"exercise" => "exercises"`. (Malina Sulca)
- Fix pluralization/singularization for `"area" => "areas"`. (Xavier Barbosa)

[1.0.3]: https://github.com/hanami/hanami-utils/compare/v1.0.2...v1.0.3

## [1.0.2] - 2017-07-10

### Fixed

- Fix pluralization/singularization for `"phrase" => "phrases"`. (Anton Davydov)

[1.0.2]: https://github.com/hanami/hanami-utils/compare/v1.0.1...v1.0.2

## [1.0.1] - 2017-06-23

### Added

- Introduced `Utils::Hash.symbolize` and `.deep_symbolize`. (Luca Guidi)
- Introduced `Utils::Hash.deep_dup`. (Luca Guidi)

### Fixed

- Ensure `Utils::String#classify` to return output identical to the input for already classified strings. (choallin)
- Ensure `Utils::Hash#initialize` to accept frozen `Hash` as argument. (Marion Duprey & Jonas Amundsen)

[1.0.1]: https://github.com/hanami/hanami-utils/compare/v1.0.0...v1.0.1

## [1.0.0] - 2017-04-06

[1.0.0]: https://github.com/hanami/hanami-utils/compare/v1.0.0.rc1...v1.0.0

## [1.0.0.rc1] - 2017-03-31

### Added

- Allow `Hanami::Logger#initialize` to accept arguments to be compliant with Ruby's `Logger`. (Luca Guidi)

[1.0.0.rc1]: https://github.com/hanami/hanami-utils/compare/v1.0.0.beta3...v1.0.0.rc1

## [1.0.0.beta3] - 2017-03-17

### Fixed

- Use `$stdout` instead of `STDOUT` as default stream for `Hanami::Logger`. (Luca Guidi)

### Changed

- Removed `Utils::Attributes`. (Luca Guidi)
- Removed deprecated `Hanami::Interactor::Result#failing?`. (Luca Guidi)
- Removed deprecated `Utils::Json.load` and `.dump`. (Luca Guidi)

[1.0.0.beta3]: https://github.com/hanami/hanami-utils/compare/v1.0.0.beta2...v1.0.0.beta3

## [1.0.0.beta2] - 2017-03-02

### Changed

- Made `Utils::Blank` private API. (Anton Davydov)

[1.0.0.beta2]: https://github.com/hanami/hanami-utils/compare/v1.0.0.beta1...v1.0.0.beta2

## [1.0.0.beta1] - 2017-02-14

### Added

- Official support for Ruby: MRI 2.4. (Luca Guidi)
- Introduced `Utils::Hash#deep_symbolize!` for deep symbolization. (alexd16)
- Introduced `Hanami::Utils.reload!` as a mechanism to force code reloading in development. (Luca Guidi)

### Fixed

- Don't deeply symbolize `Hanami::Interactor::Result` payload. (alexd16 & Alfonso Uceda & Luca Guidi)
- `Hanami::Interactor::Result`: Don't transform objects that respond to `#to_hash` (like entities). (Alfonso Uceda)
- Use `Utils::Json.generate` instead of the deprecated `.dump` for `Hanami::Logger` JSON formatter. (Bhanu Prakash)
- `Hanami::Logger`: when a `Hash` message is passed, don't nest it under `:message` key, but unwrap at the top level. (Luca Guidi)

### Changed

- `Utils::Hash#symbolize!` no longer symbolizes deep structures. (alexd16)
- Improve readability for default logger formatter. (Luca Guidi & Alfonso Uceda)
- Use ISO-8601 time format for JSON logger formatter. (Luca Guidi)

[1.0.0.beta1]: https://github.com/hanami/hanami-utils/compare/v0.9.2...v1.0.0.beta1

## [0.9.2] - 2016-12-19

### Added

- Introduced `Hanami::Interactor::Result#failure?`. (Grachev Mikhail)

### Fixed

- `Utils::Inflector.pluralize` Pluralize -en to -ens instead of -ina. (Paweł Świątkowski)

### Changed

- Deprecate `Hanami::Interactor::Result#failing?` in favor of `#failure?`. (Grachev Mikhail)

[0.9.2]: https://github.com/hanami/hanami-utils/compare/v0.9.1...v0.9.2

## [0.9.1] - 2016-11-18

### Added

- Introduced `Utils::Json.parse` and `.generate`. (Luca Guidi)

### Fixed

- Ensure `Utils::Json` parsing to not eval untrusted input. (Luca Guidi)

### Changed

- Deprecated `Utils::Json.load` in favor of `.parse`. (Luca Guidi)
- Deprecated `Utils::Json.dump` in favor of `.generate`. (Luca Guidi)

[0.9.1]: https://github.com/hanami/hanami-utils/compare/v0.9.0...v0.9.1

## [0.9.0] - 2016-11-15

### Added

- Introduced `Utils.require!` to recursively require Ruby files with an order that is consistent across platforms. (Luca Guidi)
- Introduced `Utils::FileList` as cross-platform ordered list of files, alternative to `Dir.glob`. (Luca Guidi)

- Make `Utils::BasicObject` pretty printable. (Luca Guidi)
- Added `Interactor::Result#successful?` and `#failing?`. (Grachev Mikhail)

### Fixed

- Ensure `Utils::Class.load!` to lookup constant only within the given namespace. (Pascal Betz)

### Changed

- Make `Utils::Hash` only compatible with objects that respond to `#to_hash`. (Luca Guidi)
- Official support for Ruby: MRI 2.3+ and JRuby 9.1.5.0+. (Luca Guidi)

[0.9.0]: https://github.com/hanami/hanami-utils/compare/v0.8.0...v0.9.0

## [0.8.0] - 2016-07-22

### Added

- Introduced `Hanami::Utils::Blank`. (Andrey Morskov)
- Allow to specify a default log level for `Hanami::Logger`. (Anton Davydov)
- Introduced default and JSON formatters for `Hanami::Logger`. (Anton Davydov)
- Allow deep indifferent access for `Hanami::Utils::Attributes`. (Erol Fornoles)
- Introduced `Hanami::Utils::Json` which is a proxy for `MultiJson` (from `multi_json` gem), or fallback to `JSON` from Ruby standard library. (Anton Davydov)

### Fixed

- Ensure `Hanami::Utils::String#classify` to return already classified strings as they are. Eg. `"AwesomeProject"` should return `"AwesomeProject"`, not `"Awesomeproject"`. (Hiếu Nguyễn)
- Fix English pluralization for words ending with `"rses"`. (TheSmartnik)
- Fix English pluralization for words ending with `"ice"`. (Rogério Ramos)

### Changed

- Drop support for Ruby 2.0, 2.1 and Rubinius. Official support for JRuby 9.0.5.0+. (Luca Guidi)

[0.8.0]: https://github.com/hanami/hanami-utils/compare/v0.7.1...v0.8.0

## [0.7.1] - 2016-02-05

### Fixed

- `Hanami::Utils::Escape`: fixed Ruby warning for `String#chars` with a block, which is deprecated. Using `String#each_char` now. (Yuuji Yaginuma)
- Allow non string objects to be escaped by `Hanami::Utils::Escape`. (Sean Collins)

[0.7.1]: https://github.com/hanami/hanami-utils/compare/v0.7.0...v0.7.1

## [0.7.0] - 2016-01-22

### Changed

- Renamed the project. (Luca Guidi)

[0.7.0]: https://github.com/hanami/hanami-utils/compare/v0.6.1...v0.7.0

## [0.6.1] - 2016-01-19

### Fixed

- Ensure `Lotus::Utils::String#classify` to work properly with dashes (eg. `"app-store" => "App::Store"`). (Anton Davydov)

[0.6.1]: https://github.com/hanami/hanami-utils/compare/v0.6.0...v0.6.1

## [0.6.0] - 2016-01-12

### Added

- Official support for Ruby 2.3. (Luca Guidi)
- Custom inflections. (Luca Guidi)
- Introduced `Lotus::Utils::Duplicable` as a safe dup logic for Ruby types. (Luca Guidi)
- Added `Lotus::Utils::String#rsub` replace rightmost occurrence. (Luca Guidi)

### Fixed

- Fix `Lotus::Utils::PathPrefix#join` and `#relative_join` by rejecting arguments that are equal to the separator. (Luca Guidi)
- Fix `Encoding::UndefinedConversionError` in `Lotus::Utils::Escape.encode`. (Karim Kiatlottiavi)

### Changed

- Deprecate Ruby 2.0 and 2.1. (Luca Guidi)
- Removed `Lotus::Utils::Callbacks#add` in favor of `#append`. (Luca Guidi)
- Removed pattern support for `Utils::Class.load!` (eg. `Articles(Controller|::Controller)`). (Luca Guidi)

[0.6.0]: https://github.com/hanami/hanami-utils/compare/v0.5.2...v0.6.0

## [0.5.2] - 2015-09-30

### Added

- Added `Lotus::Utils::String#capitalize`. (Luca Guidi)
- Official support for JRuby 9k+. (Trung Lê)

[0.5.2]: https://github.com/hanami/hanami-utils/compare/v0.5.1...v0.5.2

## [0.5.1] - 2015-07-10

### Fixed

- Ensure `Lotus::Utils::PathPrefix#join` won't remote duplicate entries (eg `/admin/dashboard/admin`). (Thiago Felippe)

[0.5.1]: https://github.com/hanami/hanami-utils/compare/v0.5.0...v0.5.1

## [0.5.0] - 2015-06-23

### Added

- Extracted `Lotus::Logger` from `hanamirb`. (Luca Guidi)

### Changed

- `Lotus::Interactor::Result` contains only objects explicitly exposed via `Lotus::Interactor.expose`. (Luca Guidi)

[0.5.0]: https://github.com/hanami/hanami-utils/compare/v0.4.3...v0.5.0

## [0.4.3] - 2015-05-22

### Added

- Improved `Lotus::Utils::Kernel` messages for `TypeError`. (François Beausoleil)

[0.4.3]: https://github.com/hanami/hanami-utils/compare/v0.4.2...v0.4.3

## [0.4.2] - 2015-05-15

### Fixed

- Ensure `Lotus::Utils::Attributes#to_h` to return `::Hash`. (Luca Guidi)

[0.4.2]: https://github.com/hanami/hanami-utils/compare/v0.4.1...v0.4.2

## [0.4.1] - 2015-05-15

### Added

- Introduced `Lotus::Utils::Inflector`, `Lotus::Utils::String#pluralize` and `#singularize`. (Luca Guidi & Alfonso Uceda Pompa)

### Fixed

- Ensure `Lotus::Utils::Attributes#to_h` to safely return nested `::Hash` instances for complex data structures. (Luca Guidi)
- Let `Lotus::Interactor#error` to return a falsey value for control flow. (eg. `check_permissions or error "You can't access"`). (Luca Guidi)

[0.4.1]: https://github.com/hanami/hanami-utils/compare/v0.4.0...v0.4.1

## [0.4.0] - 2015-03-23

### Added

- Introduced `Lotus::Utils::Escape`. It implements OWASP/ESAPI suggestions for HTML, HTML attribute and URL escape utilities. (Luca Guidi)
- Introduced `Lotus::Utils::String#dasherize`. (Luca Guidi)
- Introduced `Lotus::Utils::String#titleize`. (Luca Guidi)

[0.4.0]: https://github.com/hanami/hanami-utils/compare/v0.3.5...v0.4.0

## [0.3.5] - 2015-03-12

### Added

- Introduced `Lotus::Interactor`. (Luca Guidi)
- Introduced `Lotus::Utils::BasicObject`. (Luca Guidi)

[0.3.5]: https://github.com/hanami/hanami-utils/compare/v0.3.4...v0.3.5

## [0.3.4] - 2015-01-30

### Added

- Aliased `Lotus::Utils::Attributes#get` with `#[]`. (Alfonso Uceda Pompa)
- Introduced `Lotus::Utils::Callbacks::Chain#prepend` and `#append`. (Simone Carletti)

### Deprecated

- Deprecated `Lotus::Utils::Callbacks::Chain#add` in favor of `#append`. (Luca Guidi)

[0.3.4]: https://github.com/hanami/hanami-utils/compare/v0.3.3...v0.3.4

## [0.3.3] - 2015-01-08

### Fixed

- Ensure to return the right offending object if a missing method is called with Utils::String and Hash (eg. `Utils::Hash.new(a: 1).all? {|_, v| v.foo }` blame `v` instead of `Hash`). (Luca Guidi)
- Raise an error if try to coerce non numeric strings into Integer, Float & BigDecimal (eg. `Utils::Kernel.Integer("hello") # => raise TypeError`). (Luca Guidi)

[0.3.3]: https://github.com/hanami/hanami-utils/compare/v0.3.2...v0.3.3

## [0.3.2] - 2014-12-23

### Added

- Official support for Ruby 2.2. (Luca Guidi)
- Introduced `Utils::Attributes`. (Luca Guidi)
- Added `Utils::Hash#stringify!`. (Luca Guidi)

[0.3.2]: https://github.com/hanami/hanami-utils/compare/v0.3.1...v0.3.2

## [0.3.1] - 2014-11-23

### Added

- Allow `Utils::Class.load!` to accept any object that implements `#to_s`. (Luca Guidi)
- Allow `Utils::Class.load!` to accept a class. (Trung Lê)
- Introduced `Utils::Class.load_from_pattern!`. (Luca Guidi)
- Introduced `Utils.jruby?` and `Utils.rubinius?`. (Luca Guidi)
- Introduced `Utils::Deprecation`. (Luca Guidi)
- Official support for Rubinius 2.3+. (Luca Guidi)
- Official support for JRuby 1.7+ (with 2.0 mode). (Luca Guidi)
- Implemented `Utils::PathPrefix` relativness and absolutness. (Janko Marohnić)
- Made `Utils::PathPrefix` `#join` and `#relative_join` to return a new instance of that class. (Luca Guidi)
- Implemented `Utils::Hash#deep_dup`. (Luca Guidi)
- Made `Utils::PathPrefix#join` to accept multiple argument. (Luca Guidi)

### Fixed

- Made `Utils::PathPrefix#join` remove trailing occurrences for `@separator` from the output. (Luca Guidi)
- Made `Utils::PathPrefix#relative_join` to correctly replace all the instances of `@separator` from the output. (Luca Guidi)

### Deprecated

- Deprecated `Utils::Class.load!` with a pattern like `Articles(Controller|::Controller)`, use `Utils::Class.load_from_pattern!` instead. (Luca Guidi)

[0.3.1]: https://github.com/hanami/hanami-utils/compare/v0.3.0...v0.3.1

## [0.3.0] - 2014-10-23

### Added

- Add BigDecimal coercion to Lotus::Utils::Kernel. (Celso Fernandes)
- Define `Boolean` constant, if missing. (Luca Guidi)
- Use composition over inheritance for `Lotus::Utils::PathPrefix`. (Luca Guidi)
- Use composition over inheritance for `Lotus::Utils::Hash`. (Luca Guidi)
- Use composition over inheritance for `Lotus::Utils::String`. (Luca Guidi)

### Fixed

- Improved error message for `Utils::Class.load!`. (Luca Guidi)
- Improved error `NameError` message by passing in the whole constant name to `Utils::Class.load!`. (Tom Kadwill)
- `Utils::Hash#to_h` return instances of `::Hash` in case of nested symbolized data structure. (Luca Guidi)
- Raise `TypeError` if `nil` is passed to `PathPrefix#relative_join`. (Luca Guidi)
- Define `Lotus::Utils::Hash#respond_to_missing?`. (Peter Suschlik)
- Define `Lotus::Utils::String#responds_to_missing?`. (Peter Suschlik)
- Ensure `Utils::Hash#inspect` output to be the same of `::Hash#inspect`. (Luca Guidi)

[0.3.0]: https://github.com/hanami/hanami-utils/compare/v0.2.0...v0.3.0

## [0.2.0] - 2014-06-23

### Added

- Implemented `Lotus::Utils::Kernel.Symbol`. (Luca Guidi)
- Made `Kernel.Pathname` to raise an error when `nil` is passed as argument. (Luca Guidi)
- Implemented `Lotus::Utils::LoadPaths#freeze` in order to prevent modification after the object has been frozen. (Luca Guidi)
- Implemented Lotus::Utils::LoadPaths#push, also aliased as #<<. (Luca Guidi)
- Use composition over inheritance for `Lotus::Utils::LoadPaths`. (Luca Guidi)
- Introduced `Lotus::Utils::LoadPaths`. (Luca Guidi)
- Introduced `Lotus::Utils::String#namespace`, in order to return the top level Ruby namespace for the given string. (Luca Guidi)
- Implemented `Lotus::Utils::Kernel.Pathname`. (Luca Guidi)

### Fixed

- Implemented `Lotus::Utils::LoadPaths#initialize_copy` in order to safely `#dup` and `#clone`. (Luca Guidi)

### Changed

- Implemented `Lotus::Utils::Callbacks::Chain#freeze` in order to prevent modification after the object has been frozen. (Luca Guidi)
- All the `Utils::Kernel` methods will raise `TypeError` in case of failed coercion. (Luca Guidi)
- Made `Kernel.Time` to raise an error when `nil` is passed as argument. (Luca Guidi)
- Made `Kernel.DateTime` to raise an error when `nil` is passed as argument. (Luca Guidi)
- Made `Kernel.Date` to raise an error when `nil` is passed as argument. (Luca Guidi)
- Made `Kernel.Boolean` to return false when `nil` is passed as argument. (Luca Guidi)
- Made `Kernel.String` to return an empty string when `nil` is passed as argument. (Luca Guidi)
- Made `Kernel.Float` to return `0.0` when `nil` is passed as argument. (Luca Guidi)
- Made `Kernel.Integer` to return `0` when `nil` is passed as argument. (Luca Guidi)
- Made `Kernel.Hash` to return an empty `Hash` when `nil` is passed as argument. (Luca Guidi)
- Made `Kernel.Set` to return an empty `Set` when `nil` is passed as argument. (Luca Guidi)
- Made `Kernel.Array` to return an empty `Array` when `nil` is passed as argument. (Luca Guidi)
- Use composition over inheritance for `Lotus::Utils::Callbacks::Chain`. (Luca Guidi)

[0.2.0]: https://github.com/hanami/hanami-utils/compare/v0.1.1...v0.2.0

## [0.1.1] - 2014-04-23

### Added

- Implemented `Lotus::Utils::Kernel.Time`. (Luca Guidi)
- Implemented `Lotus::Utils::Kernel.DateTime`. (Luca Guidi)
- Implemented `Lotus::Utils::Kernel.Date`. (Luca Guidi)
- Implemented `Lotus::Utils::Kernel.Float`. (Luca Guidi)
- Implemented `Lotus::Utils::Kernel.Boolean`. (Luca Guidi)
- Implemented `Lotus::Utils::Kernel.Hash`. (Luca Guidi)
- Implemented `Lotus::Utils::Kernel.Set`. (Luca Guidi)
- Implemented `Lotus::Utils::Kernel.String`. (Luca Guidi)
- Implemented `Lotus::Utils::Kernel.Integer`. (Luca Guidi)
- Implemented `Lotus::Utils::Kernel.Array`. (Luca Guidi)

### Fixed

- Add missing stdlib `Set` require to `Utils::ClassAttribute`. (Christopher Keele)

[0.1.1]: https://github.com/hanami/hanami-utils/compare/v0.1.0...v0.1.1

## 0.1.0 - 2014-01-23

### Added

- Introduced `Lotus::Utils::String#demodulize`. (Luca Guidi)
- Introduced `Lotus::Utils::IO.silence_warnings`. (Luca Guidi)
- Introduced class loading mechanism from a string: `Utils::Class.load!`. (Luca Guidi)
- Introduced callbacks support for classes. (Luca Guidi)
- Introduced inheritable class level attributes. (Luca Guidi)
- Introduced `Utils::Hash`. (Luca Guidi)
- Introduced `Utils::String`. (Luca Guidi)
- Introduced `Utils::PathPrefix`. (Luca Guidi)
- Official support for MRI 2.0+. (Luca Guidi)
