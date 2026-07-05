# weather_app

**Platform:** Flutter (stable, managed via FVM — see `.fvm/fvm_config.json`).

A weather application that loads remote configuration and evaluates feature flags to gate UI capabilities. Built with Clean Architecture and Domain-Driven Design: pure domain logic, data-layer DTO mapping, and presentation via **flutter_bloc**.

## Setup

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

With FVM:

```bash
fvm flutter pub get
fvm dart run build_runner build --delete-conflicting-outputs
fvm flutter run
```
