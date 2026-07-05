# weather_app

Weather app built with Flutter **3.41.4** (stable), managed via [FVM](https://fvm.app).

## Flutter version (FVM)

This project pins Flutter through FVM. Do not use a global `flutter` install for day-to-day work.

```bash
fvm install          # first-time setup (reads .fvm/fvm_config.json)
fvm flutter pub get
fvm flutter run
fvm dart run build_runner build --delete-conflicting-outputs
```

IDEs should resolve the SDK at `.fvm/flutter_sdk` (see `.vscode/settings.json`).

## Architecture

Clean Architecture + Domain-Driven Design, feature-first layout:

| Layer | Path | Notes |
|-------|------|-------|
| Domain | `lib/<feature>/domain/` | Pure Dart — entities, use cases, repository interfaces |
| Data | `lib/<feature>/data/` | DTOs, Retrofit sources, mappers, repository impls |
| Presentation | `lib/<feature>/presentation/` | Bloc/Cubit, pages, widgets |
| Core | `lib/core/` | DI (GetIt), GoRouter, failures, theme |

Dependencies point inward only: `presentation → domain ← data`.

## State management

**flutter_bloc** — states and events are Freezed unions; blocs propagate `Either<Failure, T>` from use cases.

## Error handling

Repository methods return `Future<Either<Failure, T>>` (via **fpdart**). Exceptions are caught in the data layer and mapped to `Failure`; nothing throws across layer boundaries.

## Testing

- Unit tests for every domain service and use case
- Exhaustive tests for the flag evaluator (determinism, boundaries, kill-switch)
- One widget test for `FeatureGate`
- One integration test for config swap

## Commits

`type(scope): summary` — e.g. `feat(remote_config): add deterministic flag evaluator`

Types: `chore`, `feat`, `test`, `docs`, `refactor`.
