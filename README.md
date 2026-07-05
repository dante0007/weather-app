# weather_app

**Platform:** Flutter (stable, managed via FVM — see `.fvm/fvm_config.json`).

A weather application that loads remote configuration and evaluates feature flags to gate UI capabilities. Built with Clean Architecture and Domain-Driven Design: pure domain logic, data-layer DTO mapping, application-layer state management, and Flutter UI.

**State management:** **flutter_bloc** — Blocs/Cubits live in each feature's `application/` layer; states and events are Freezed unions.

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

In **debug** builds, the static design walkthrough remains at `/design-index` and `/design-gallery` (not linked from the live dashboard).

## Architecture

Feature-first layout under `lib/features/<feature>/`:

| Layer | Path | Contents |
|-------|------|----------|
| Domain | `domain/` | Entities, value objects, repository interfaces, use cases, pure domain services |
| Data | `data/` | DTOs, Retrofit/local sources, mappers, repository implementations |
| Application | `application/` | Blocs and Cubits (Freezed states/events); orchestrates use cases |
| Presentation | `presentation/` | Pages and widgets (Flutter UI only) |

Shared cross-cutting code lives in `lib/core/` (`di`, `router`, `error`, `usecase`, `constants`, `theme`).

Dependencies point inward only:

```
presentation → application → domain ← data
```

Domain knows nothing about Flutter, DTOs, or Blocs. Exceptions are caught in the data layer and mapped to `Failure`; nothing throws across layer boundaries.

See [docs/CONVENTIONS.md](docs/CONVENTIONS.md) for full project conventions.
