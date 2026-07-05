# Weather Flags

A Flutter weather dashboard that demonstrates a **remote-config feature-flag platform** on a real consumer surface. On-device evaluation gates dashboard cards, layout variants, a severe-weather banner, and a seven-day forecast route — without redeploying the app. Live weather comes from Open-Meteo; device location drives the primary city and a country-based “Other Cities” row.

## Platform choice

**Flutter** (stable channel, pinned via [FVM](https://fvm.app) — see `.fvm/fvm_config.json`, currently **Flutter 3.41.4**).

Single codebase for iOS and Android; fast iteration on a custom glassmorphic UI; first-class async/state tooling (`flutter_bloc`); and straightforward bundling of offline config JSON during development.

**State management:** `flutter_bloc` with Freezed states/events in each feature's `application/` layer.

## Features

- **Feature-flag gating** — six flags control UV, air quality, hourly forecast, wind, severe-weather alert, layout variant (compact vs detailed), and the `/forecast` route
- **Deterministic rollout** — FNV-1a bucketing on `userId:flagKey`; explainable `FlagEvaluation` (bucket, reason, variant)
- **Two configs** — Config A (“conservative”) and Config B (“full features”) as bundled JSON assets, switchable at runtime via the debug panel
- **Kill-switch demo** — `severe_weather_alert` is killed in Config A; runtime toggle in the debug panel
- **Live weather** — Open-Meteo forecast, air-quality, and geocoding (no API key)
- **Device location** — geolocator + reverse geocoding on startup; fallback coordinates if permission is denied
- **Other Cities** — top five cities for the user's country with live condition and temperature
- **Debug panel** (debug builds) — Config A/B toggle, mock user-id field, live evaluation table, per-flag kill-switch toggles
- **Config viewer** — raw JSON with syntax highlighting for both configs

### Flag matrix

Rollout rule: `bucket = fnv1a32("$userId:$flagKey") % 100`; user is **included** when `bucket < rolloutPercentage`. Kill-switch overrides everything.

| Flag key | Config A | Config B |
|----------|----------|----------|
| `uv_index_card` | enabled, 100% rollout | enabled, 100% rollout |
| `air_quality_card` | enabled, **30%** rollout | enabled, 100% rollout |
| `hourly_forecast` | enabled, **50%** rollout | enabled, 100% rollout |
| `wind_speed_card` | enabled, **0%** rollout (off for all) | enabled, **80%** rollout |
| `severe_weather_alert` | enabled, **kill-switch ON** (always off) | enabled, 100% rollout |
| `layout_variant` | variant **`compact`** | variant **`detailed`** |
| `seven_day_forecast` | enabled, **0%** rollout (route blocked) | enabled, 100% rollout (route on) |

Config A models a conservative staged rollout; Config B models full feature exposure.

## Setup

**Requirements:** Dart SDK **^3.11.1** (see `pubspec.yaml`); Flutter **3.41.4** via FVM. iOS and Android **location permissions are pre-declared** (`NSLocationWhenInUseUsageDescription` in `Info.plist`; `ACCESS_FINE_LOCATION` / `ACCESS_COARSE_LOCATION` in `AndroidManifest.xml`).

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

Allow location when prompted (simulator: set a custom location under Features → Location).

## Testing

Unit and widget tests:

```bash
flutter test
```

End-to-end config swap (real config assets + `RemoteConfigBloc`, mocked weather/location):

```bash
flutter test integration_test/config_swap_test.dart
```

Optional live Open-Meteo smoke test (off by default):

```bash
flutter test --dart-define=RUN_LIVE_NETWORK_TESTS=true test/features/weather/data/weather_live_smoke_test.dart
```

**What tests assert (no fabricated metrics):** `FlagEvaluator` determinism (1 000 repeated calls), distribution sanity (10 000 synthetic users at 50% rollout), kill-switch/disabled/boundary cases; repository load/switch/kill-switch; bloc state transitions; `FeatureGate` show/hide; integration test proves Config B exposes alert + air-quality cards, kill-switch hides alert, Config A + alternate user id shifts gated cards.

## How to see the platform in action

1. Run the app in **debug mode** and open the **debug FAB** (bottom-right).
2. **Switch Config A ↔ Config B** — watch cards, layout, alert banner, and forecast link appear or disappear without a restart.
3. **Change the mock user id** (e.g. `user_1` vs `user_87` on Config A) — deterministic buckets shift which rollout-gated cards show (air quality 30%, hourly 50%, wind 80% on Config B).
4. **Flip the kill-switch** on `severe_weather_alert` — the banner vanishes instantly even when rollout would include the user (strict kill-switch precedence).

Use **View Raw Config** in the debug panel to open the JSON config viewer.

## How to add a new gated feature

Adding a gated capability is **config + a widget check** — not surgery:

1. **Config** — add a flag entry to `assets/config/config_a.json` and `config_b.json` (mirror in `test/fixtures/config_fixtures.dart` for tests).
2. **UI** — wrap the widget in `FeatureGate(flagKey: 'your_flag', builder: …)`. For A/B layout strings, use `FlagVariant`.
3. **Routes** (optional) — add a GoRouter `redirect` that reads `RemoteConfigBloc.state.isEnabled('your_flag')`.
4. **Debug panel** — add the flag key to `ConfigDebugPanel.flagOrder` so it appears in the evaluation table.

No changes to `FlagEvaluator` unless you introduce a new evaluation rule.

## Weather data attribution

Forecast, air-quality, and geocoding data from [Open-Meteo](https://open-meteo.com/) ([CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)). **No API key required.**

## Architecture

Clean Architecture + DDD, feature-first folders (`remote_config`, `weather`, `core/location`). Dependency rule: `presentation → application → domain ← data`. Shared widgets in `core/widgets/`; theme in `core/theme/`.

See **[docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)** for the layer diagram, evaluation pipeline, and key decisions. Coding standards: [docs/CONVENTIONS.md](docs/CONVENTIONS.md).

## What I'd harden next

- Remote config fetch with caching, ETags, and version pinning (Retrofit seam exists)
- Config schema validation on load (reject invalid rollout %, unknown required fields)
- Sticky bucketing across config version changes
- Persisted user id and last city across sessions
- Analytics / exposure logging tied to `FlagEvaluation` results
- CI running `flutter analyze`, `flutter test`, and the integration test on every PR
- Golden tests for compact vs detailed layout variants
- Offline weather cache and multi-provider fallback for network risk
