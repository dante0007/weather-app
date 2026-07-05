# Global Conventions

Read once, apply everywhere.

## Platform

Flutter (stable channel), pinned via FVM (see `.fvm/fvm_config.json`). State management: **flutter_bloc**.

## Architecture

Clean Architecture + Domain-Driven Design, feature-first folder layout.

```
lib/
  core/{di,router,error,usecase,constants,theme,widgets,location}/
  features/<feature>/
    domain/
    data/
    application/
    presentation/
```

### Layers

| Layer | Path | Rules |
|-------|------|-------|
| **Domain** | `domain/` | Pure Dart. No Flutter imports. No package imports except `freezed_annotation`, `fpdart` (Either), and `equatable` if needed. Entities, value objects, repository interfaces, use cases, pure domain services. |
| **Data** | `data/` | Implements domain. DTOs (`json_serializable`), data sources (Retrofit remote, local sources), mappers (DTO↔entity), repository implementations. |
| **Application** | `application/` | Blocs and Cubits per feature requirement. States and events via Freezed. Calls use cases; propagates `Either<Failure, T>`. No Flutter widgets here. |
| **Presentation** | `presentation/` | Flutter UI only — pages and widgets. Consumes Blocs/Cubits from `application/`. |
| **Core** | `core/` | Cross-cutting: DI (GetIt), router (GoRouter), error types, base use case, constants, theme, shared widgets (`core/widgets/`). |

### Dependency rule

Dependencies point **inward** only:

```
presentation → application → domain ← data
```

Domain knows nothing about the other layers. Never import Flutter or a DTO inside domain.

## Packages

| Purpose | Package |
|---------|---------|
| State management | `flutter_bloc` |
| Immutable models / unions | `freezed`, `freezed_annotation` |
| DTO serialization | `json_serializable`, `json_annotation` |
| HTTP client | `retrofit`, `dio` |
| Routing | `go_router` |
| DI | `get_it` (manual wiring, no injectable) |
| Error handling | `fpdart` — `Either<Failure, T>` |
| Code generation | `build_runner`, `retrofit_generator` |
| Testing | `bloc_test`, `mocktail` |

## Error handling

Every repository method returns `Future<Either<Failure, T>>`. Use cases and Blocs propagate the `Either`. Never throw across a layer boundary — catch exceptions in the data layer and map to `Failure`.

## Naming conventions

| Kind | Pattern | Example |
|------|---------|---------|
| Entity | clean name | `FeatureFlag`, `RemoteConfig`, `WeatherData` |
| DTO | suffix `Dto` | `FeatureFlagDto`, `ForecastResponseDto` |
| Use case | verb-first | `EvaluateFlag`, `GetRemoteConfig`, `GetCurrentWeather` |
| Repository interface | `{Name}Repository` | `RemoteConfigRepository` |
| Repository impl | `{Name}RepositoryImpl` | `RemoteConfigRepositoryImpl` |
| Bloc / Cubit | `{Feature}Bloc` / `{Feature}Cubit` | `RemoteConfigBloc`, `WeatherBloc` |

Place Blocs/Cubits under `application/`, not `presentation/`.

## Vocabulary

- A **flag** is **evaluated** → produces a boolean or a variant.
- A **feature** is **gated** → wrapped in `FeatureGate`.
- The **kill-switch** overrides everything.

## Code generation

After any change to a Freezed, `json_serializable`, or Retrofit file:

```bash
dart run build_runner build --delete-conflicting-outputs
```

With FVM:

```bash
fvm dart run build_runner build --delete-conflicting-outputs
```

## Testing discipline

- Unit test every domain service and use case.
- Exhaustive tests for the flag evaluator (determinism, boundaries, kill-switch).
- One widget test for `FeatureGate`.
- One integration test for config swap.
- Bloc tests live under `test/features/<feature>/application/`.

## Commits

Format: `type(scope): summary`

Example: `feat(remote_config): add deterministic flag evaluator`

Types: `chore`, `feat`, `test`, `docs`, `refactor`.
