# Architecture

Weather Flags is a Flutter app that gates weather UI behind on-device feature-flag evaluation. Configuration is loaded from bundled JSON assets (with a repository seam ready for a remote source), and weather data comes from the Open-Meteo APIs.

## Layered structure

![Clean architecture layers](architecture-layers.png)

```
┌─────────────────────────────────────────────────────────────┐
│  presentation/   pages, widgets, FeatureGate, GoRouter    │
└────────────────────────────┬────────────────────────────────┘
                             │ reads Bloc state
┌────────────────────────────▼────────────────────────────────┐
│  application/      WeatherBloc, RemoteConfigBloc, use cases   │
└────────────────────────────┬────────────────────────────────┘
                             │ calls
┌────────────────────────────▼────────────────────────────────┐
│  domain/           entities, FlagEvaluator, repo interfaces   │
└────────────────────────────▲────────────────────────────────┘
                             │ implements
┌────────────────────────────┴────────────────────────────────┐
│  data/             DTOs, mappers, Retrofit, local JSON      │
└─────────────────────────────────────────────────────────────┘
```

**Dependency rule:** `presentation → application → domain ← data`. Domain has no Flutter, DTO, or Bloc imports.

| Layer | Responsibility |
|-------|----------------|
| **Presentation** | Renders UI; `FeatureGate` / `FlagVariant` read `RemoteConfigBloc` evaluations. |
| **Application** | Orchestrates use cases; holds user id, active config, and weather fetch state. |
| **Domain** | Pure flag evaluation (`FlagEvaluator`), entities, repository contracts. |
| **Data** | Loads `assets/config/*.json`, calls Open-Meteo, maps DTOs to entities. |

Shared infrastructure lives in `lib/core/` (GetIt DI, GoRouter, theme, `Failure` types, shared widgets in `core/widgets/`, device location in `core/location/`).

## Flag evaluation order

For each flag, `FlagEvaluator.evaluate(flag, userId)` applies checks in this order:

1. **Kill-switch** — if `killSwitch` is true, result is `false` (reason: killed).
2. **Enabled** — if `enabled` is false, result is `false` (reason: disabled).
3. **Rollout bucket** — compute `bucket = fnv1a32("$userId:$flagKey") % 100`; include when `bucket < rolloutPercentage`.
4. **Variant** — if the flag defines a `variant` string, it is carried through on the `FlagEvaluation` regardless of inclusion (used by `layout_variant`).

Route-level gates (e.g. `/forecast`) use the same evaluations via a GoRouter `redirect` that reads `RemoteConfigBloc.state.isEnabled(flagKey)`.

## Determinism

Rollout bucketing uses **FNV-1a 32-bit** over UTF-8 `"$userId:$flagKey"`, reduced modulo 100. The same user and flag always land in the same bucket across app restarts and devices — no server round-trip, no randomness at evaluation time. Unit tests assert determinism (1 000 repeated calls) and distribution sanity (10 000 synthetic users at 50% rollout).

## Key decisions

- **On-device evaluation** — flags are evaluated locally from the active config plus a client-held user id; no network call per widget rebuild.
- **Mocked config with a real seam** — configs ship as JSON assets today, but `RemoteConfigRepository` is an interface; swapping in a remote fetcher does not touch presentation or `FlagEvaluator`.
- **Deterministic hashing** — FNV-1a bucketing keeps rollouts stable and testable without a backend assignment service.
- **In-place UI + repository swap** — presentation widgets live in `features/*/presentation/` and consume real blocs. Dev-time sample weather is provided by `FakeWeatherRepository` at the data boundary (`test/fixtures/weather_bundle_fixture.dart`). Shared primitives live in `core/widgets/`.

See also [CONVENTIONS.md](CONVENTIONS.md) for coding standards.
