# Infrastructure Warfare Design Checklist

This checklist defines first-pass requirements for system-targeting superweapons and command disruption effects.

## Scope

- Strategic infrastructure attacks affecting command, logistics, and production networks.
- Counterplay expectations and readability requirements.
- Applies primarily to Autonomous and Network warfare phases.

## Superweapon System Checklist

- [ ] Define each superweapon by target domain: command, logistics, production, sensor, or mixed.
- [ ] Define activation prerequisites and reveal requirements before first use.
- [ ] Define warm-up and firing windows with clear vulnerability periods.
- [ ] Define cooldown and rearm constraints to prevent spam cycles.
- [ ] Define bounded impact ceilings so one strike cannot produce unavoidable total collapse.
- [ ] Define anti-stack rules for overlapping effects on the same target zone.

## Command Disruption Checklist

- [ ] Define command-latency penalty profile by disruption intensity.
- [ ] Define command-radius or authority degradation behavior under sustained disruption.
- [ ] Define disruption decay and recovery timing windows.
- [ ] Define distributed-network mitigation effects for prepared defenders.
- [ ] Define minimum-action guarantee so basic defensive control never fully locks out.

## Counterplay Checklist

- [ ] Early warning visibility is available before strike resolution.
- [ ] At least two valid defensive responses exist per disruption class.
- [ ] Recovery routes are strategic and actionable, not purely random.
- [ ] Counter-strike opportunities are available during attacker cooldown windows.
- [ ] Counterplay clarity is preserved in both low and high APM contexts.

## Telemetry and UI Checklist

- [ ] Emit disruption start, peak, and end payloads with target-domain fields.
- [ ] Emit superweapon state payloads: charging, armed, fired, cooldown.
- [ ] Display disruption severity and expected recovery time in HUD alerts.
- [ ] Log mitigation actions and resulting penalty reductions.

## Validation Hooks

- [ ] Validate one command disruption event from both attacker and defender perspectives.
- [ ] Validate one successful mitigation that reduces severity before peak effect.
- [ ] Validate one recovery cycle from critical disruption to stable state.
- [ ] Validate no scenario hard-locks player control below minimum-action guarantee.
