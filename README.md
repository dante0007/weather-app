# Weather Flags

A Flutter weather dashboard gated by on-device feature flags. Remote configuration controls which cards, banners, layout variants, and routes appear — without redeploying the app.

**Platform:** Flutter (stable, pinned via [FVM](https://fvm.app) — see `.fvm/fvm_config.json`).

### Why Flutter?

Single codebase for iOS, Android, and desktop; fast iteration on custom UI (glassmorphic dashboard); first-class async/state tooling (`flutter_bloc`); and straightforward asset bundling for offline config files during development.

**State management:** `flutter_bloc` with Freezed states/events in each feature's `application/` layer.

## Features

- Live weather via **Open-Meteo** — current conditions, hourly slots, 7-day daily, air quality (device location on startup)
- **Feature-flag gating** — dashboard cards, severe-weather banner, layout variant, and 7-day forecast route
- **Debug panel** (debug builds) — switch Config A/B, change user id, inspect bucket evaluations, toggle kill-switches
- **Config viewer** — raw JSON for both bundled configs
- **Other cities** — top 5 cities for the user's country with live condition + temperature

### Flag matrix

Rollout uses deterministic FNV-1a buckets (`bucket < rolloutPercentage` ⇒ on). Kill-switch overrides rollout.

| Flag | Config A | Config B |
|------|----------|----------|
| `uv_index_card` | 100% | 100% |
| `air_quality_card` | 30% | 100% |
| `hourly_forecast` | 50% | 100% |
| `wind_speed_card` | 0% | 80% |
| `severe_weather_alert` | **killed** | 100% |
| `layout_variant` | `compact` | `detailed` |
| `seven_day_forecast` | 0% (route off) | 100% (route on) |

Config A = conservative rollout; Config B = full features. Toggle configs in the debug panel to see cards and routes appear/disappear live.

## Setup

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

With FVM:

```bash
fvm flutter pub get
fvm dart run build_runner build --delete-conflicting-outputs
fvm flutter run
```

## Testing

Unit and widget tests:

```bash
flutter test
```

End-to-end config swap (real config assets + `RemoteConfigBloc`, mocked weather only):

```bash
flutter test integration_test/config_swap_test.dart
```

Optional live Open-Meteo smoke test (off by default):

```bash
flutter test --dart-define=RUN_LIVE_NETWORK_TESTS=true test/features/weather/data/weather_live_smoke_test.dart
```

## Weather data attribution

Forecast, air-quality, and geocoding data from [Open-Meteo](https://open-meteo.com/) ([CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)). **No API key required.**

## How to add a gated feature

Adding a gated capability is config + a widget check — not surgery:

1. **Config** — add a flag entry to `assets/config/config_a.json` and `config_b.json` (and mirror in `test/fixtures/config_fixtures.dart` if used in tests).
2. **UI** — wrap the widget (or route) in `FeatureGate(flagKey: 'your_flag', builder: …)`. For variants, use `FlagVariant`.
3. **Routes** (optional) — add a GoRouter `redirect` that reads `RemoteConfigBloc.state.isEnabled('your_flag')`.
4. **Debug panel** — add the flag key to `ConfigDebugPanel.flagOrder` so it shows in the evaluation table.

No changes to `FlagEvaluator` unless you introduce a new evaluation rule.

## Build approach

UI is built directly in each feature's `presentation/` layer, wired to real blocs (`WeatherBloc`, `RemoteConfigBloc`) from the first screen commit. Before Open-Meteo is connected, register `FakeWeatherRepository` in GetIt (returning the canned bundle in `test/fixtures/weather_bundle_fixture.dart`) so the dashboard is fully runnable without network. Swapping to live weather is a one-line DI change to `WeatherRepositoryImpl`.

Deterministic flag scenarios are verified via `test/fixtures/scenario_users.dart` and widget/integration tests — not a separate design-index app.

Shared visual primitives live in `lib/core/widgets/`; theme tokens in `lib/core/theme/`.

## Architecture

Layered Clean Architecture with feature-first folders. See [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) for the layer diagram, evaluation order, and determinism notes. Coding standards: [docs/CONVENTIONS.md](docs/CONVENTIONS.md).

```
presentation → application → domain ← data
```

## What I'd harden next

- Remote config fetch with caching and version pinning (repository seam already exists)
- Persisted user id and last city across sessions
- City search UI wired to `SearchCity`
- CI running `flutter analyze`, `flutter test`, and the integration test on every PR
- Golden tests for compact vs detailed layout variants
- Analytics hooks on flag evaluations for rollout verification in production
