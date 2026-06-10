# Carrier and Airfield Air-Wing Validation Checklist

Use this checklist for Fighter and Corvette basing behavior validation.

## Scope

- Focus on shared Fighter and Corvette lifecycle behavior.
- Validate compatibility between Carrier and Airfield basing contexts.

## Preconditions

- Scenario includes at least one Carrier and one Airfield context.
- Fighter and Corvette production entries are available.
- At least one opposing anti-air threat is available for sortie pressure checks.

## Checklist

| Check ID | Check | Expected Result |
| --- | --- | --- |
| AW-01 | Produce Fighters from Airfield | Fighter production starts and completes with valid home base assignment |
| AW-02 | Produce Corvettes from Airfield | Corvette production starts and completes with valid home base assignment |
| AW-03 | Reassign one squadron from Airfield to Carrier | Squadron launches and recovers against Carrier home base without state loss |
| AW-04 | Launch sortie from Carrier and recover | Rearm and repair cycle completes and squadron returns to ready state |
| AW-05 | Destroy Carrier while Airfield exists | Sortie operations continue through Airfield with expected delay |
| AW-06 | Destroy Airfield while Carrier exists | Sortie operations continue through Carrier with expected delay |
| AW-07 | Destroy both home bases | Sortie cadence degrades and launch attempts are rate-limited |
| AW-08 | Rebuild one home base | Sortie cadence recovers and degraded state clears |
| AW-09 | Cross-check role identity | Fighter remains air-superiority biased and Corvette remains strike biased in both basing contexts |

## Required Telemetry

- Home base assignment events (initial, transfer, fallback).
- Launch and recovery timestamps.
- Rearm and repair completion timestamps.
- Sortie degradation state transition when no home base is available.
- Sortie recovery state transition after base rebuild.

## Failure Modes to Flag

- Squadron has no home base but still launches at full cadence.
- Fighter and Corvette roles collapse into indistinguishable behavior.
- Carrier and Airfield contexts produce inconsistent rearm or repair behavior.
- Rebuild does not restore sortie cadence.

## Link to Test Flow

- Primary flow: `F-09 Carrier and Airfield Sortie Lifecycle` in planning/testing-strategy.md.
