# Remote-Config & Staged-Rollout — Write-Up

> **Verify before submitting:** Sections **1** and **2** below are drafted from this project's decision history and AI pairing notes. Pressure-test them against your own recollection before submission — especially which choices were yours vs the model's, and which corrections you made mid-build.

---

## 1. What I asked the AI to do vs decided myself

**Delegated to AI (scaffolding and boilerplate):** Clean Architecture folder skeleton per feature (`domain`, `data`, `application`, `presentation`); Freezed entities and bloc states/events; `json_serializable` DTOs and Retrofit client stubs; `build_runner` wiring; initial `FlagEvaluator` implementation and exhaustive unit-test outlines; task breakdown and commit sequencing; migration of shared widgets into `core/widgets/`; and drafting of test fixtures (`scenario_users.dart`, `weather_bundle_fixture.dart`).

**Owned by me (platform and product decisions):** The six demo flags and the Config A / Config B matrix (rollout percentages, kill-switch on `severe_weather_alert`, `layout_variant` compact vs detailed). The **strict evaluation order** — kill-switch → enabled → rollout % — and explainable `FlagEvaluation` with bucket and reason. **Rejecting Firebase Remote Config** so the evaluation engine, bucketing algorithm, and kill-switch semantics remain transparent and testable in-repo. The **four-layer split** with Blocs in `application/`, not `presentation/`. **Open-Meteo** as the weather provider (no API key, CC BY attribution). **Device location** instead of hardcoded New York coordinates. **`FeatureGate` as the only gating primitive** so adding a flag is config + a wrap. Choosing **FNV-1a** over random or server-side assignment for deterministic client bucketing.

---

## 2. Where I overrode / corrected / threw away AI output

- **Bottom navigation bar** — AI copied a multi-tab pattern from design inspiration; removed it. This is a single-screen dashboard; dead nav added complexity with no product value.
- **`lib/design/` + `lib/static/` detour** — Discarded the static-UI-then-migrate plan. UI now lives in each feature's `presentation/` from the start; dev sample data sits behind `FakeWeatherRepository` at the DI boundary, not a parallel static app.
- **"API not working" false alarm** — Bare Open-Meteo `/v1/` returns Not Found by design; the issue was hitting the root path, not broken clients. Forecast/air-quality/geocoding paths work as documented.
- **Blocs in `presentation/`** — Moved `RemoteConfigBloc` and `WeatherBloc` into `application/` to preserve inward dependencies and keep widgets thin.
- **Hardcoded NYC coordinates** — Replaced with `core/location` (geolocator + reverse geocoding), typed location failures, and country-based top-five Other Cities.
- **Silent location fallback** — Corrected so permission/unavailable surfaces a non-blocking notice while weather still loads from fallback constants.

---

## 3. Biggest trade-offs and alternatives considered

**(a) On-device deterministic evaluation vs server-side evaluation**

*Chosen:* Client-side `FlagEvaluator` with FNV-1a bucketing; config + userId held in `RemoteConfigBloc`; `FeatureGate` reads cached evaluations.

*Alternative:* Server assigns variants per user (LaunchDarkly-style) or evaluates on each request.

*Why:* For this exercise, **explainability and testability** matter more than central targeting. The debug table shows bucket, reason, and variant for every flag — essential for demonstrating staged rollout. Offline config load works without a flag service SLA. Cost: changing rollout logic requires an app config push, not a server flip alone (partially offset by kill-switch and config stream).

**(b) Mocked config-as-asset vs real config backend**

*Chosen:* `config_a.json` / `config_b.json` bundled assets; `RemoteConfigRepositoryImpl` with in-memory state + broadcast stream; Retrofit interface ready for remote fetch.

*Alternative:* Build a small config API from day one.

*Why:* **Scope and determinism** — reviewers can diff JSON in PRs and run integration tests without infrastructure. The Retrofit seam proves the swap is real, not a permanent shortcut. Cost: no ETags, versioning, or multi-environment targeting yet (listed under "another day").

**(c) Client hash bucketing vs managed vendor (Firebase Remote Config / LaunchDarkly)**

*Chosen:* Owned pure-Dart evaluator.

*Alternative:* Vendor SDK with built-in targeting, audit UI, and experimentation stats.

*Why:* Exercise goal is to **show you understand rollout mechanics**, not integrate a black box. Hash bucketing is auditable in unit tests; kill-switch precedence is explicit code. Cost: no admin console, exposure analytics, or attribute targeting without building them.

---

## 4. What's missing / another day

Honest gaps for a production platform: **schema validation** on config load (reject rollout % outside 0–100, malformed flags); **real config endpoint** with caching, ETags, and version pins; **sticky bucketing** when rollout % or flag definitions change mid-experiment; **richer targeting** (country, app version, custom attributes beyond `userId`); **exposure / analytics logging** tied to evaluations; **flag lifecycle tooling** (expiry, owner, stale audits); more **golden and scenario widget tests** for every gated card combination; **offline weather cache**; and **multi-provider weather fallback** if Open-Meteo is slow or unavailable (IP timeout risk on first launch).

---

## 5. Adoption & safety (platform judgment)

**How teams own rollouts:** Each flag has a **named owner** and lives in **version-controlled config** reviewed like code (PR + matrix diff). Naming convention: `{surface}_{capability}` (e.g. `uv_index_card`). Config B is not "prod" by default — environments map to config ids; promotion is a deliberate switch. **Ramp policy:** 0% dark launch → small % → measure → increase; never jump 0→100 on a high-risk surface.

**Guardrails and incidents they prevent:**

| Guardrail | Prevents |
|-----------|----------|
| Schema validation on load | Bad JSON shipping 150% rollout or breaking the parser at startup |
| Kill-switch **first** in evaluation order | Ops cannot be overridden by a stale high rollout % during an incident |
| Default-deny for unknown flag keys | Typos in `FeatureGate` silently showing UI — unknown keys evaluate off |
| Separation: ramp % vs kill-switch permissions | Junior config edit can't disable safety lever; on-call retains kill-switch |
| `FeatureGate` only in presentation | Business logic can't bypass gating in data layer |
| Integration test on config swap + kill-switch | Regressions where flags stop reacting to config changes |

---

## 6. Metrics to advance a rollout & avoiding flag debt

**Before increasing rollout %**, hold the gated cohort (deterministic bucket) against a holdout and watch: **crash-free sessions**, **error/exception rate**, **p95 latency** on paths that touch the gated UI, and **product KPIs** the flag is meant to move (e.g. engagement with hourly forecast). Define **guardrail metrics** with automatic halt (e.g. crash rate +0.5% vs baseline → freeze ramp). Compare buckets fairly because assignment is deterministic — same user always in the same bucket for a given flag key.

**Flag debt at scale:** Every flag gets **creation date, owner, and expiry/TTL**; quarterly **stale-flag audit**; "launched" flags graduate by **removing config entry + `FeatureGate` wrap** (mirror of the easy-add path). Dashboards for **flag age** and **last-evaluated** surface orphans. Target: no flag older than N releases without an owner or without a launch/kill decision.

---

*Approx. length: 1–2 pages when printed at 11pt with normal margins.*
