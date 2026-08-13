extends RefCounted
class_name UnitCombatProfiles

# One runtime source for live T0-T1 combat identity. Values are intentionally
# conservative first-pass bands; balance tuning follows black-box match data.
const FALLBACK := {
	"role": "line", "armor": "light", "weapon": "rifle",
	"max_hp": 100.0, "move_speed": 96.0, "range": 18.0,
	"damage": 16.0, "cooldown": 0.6, "visual": "line",
	"target_multipliers": {"light": 1.0, "armored": 1.0, "structure": 1.0},
}

const PROFILES := {
	"line_engineer": {
		"faction": "helion", "role": "builder", "armor": "light", "weapon": "tool",
		"max_hp": 100.0, "move_speed": 96.0, "range": 18.0, "damage": 16.0,
		"cooldown": 0.6, "visual": "builder",
		"target_multipliers": {"light": 0.75, "armored": 0.45, "structure": 1.0},
	},
	"lancer_squad": {
		"faction": "helion", "role": "line_infantry", "armor": "light", "weapon": "lancer_rifle",
		"max_hp": 105.0, "move_speed": 102.0, "range": 25.0, "damage": 14.0,
		"cooldown": 0.72, "visual": "line",
		"target_multipliers": {"light": 1.25, "armored": 0.62, "structure": 0.55},
	},
	"breach_team": {
		"faction": "helion", "role": "breach", "armor": "light", "weapon": "shaped_charge",
		"max_hp": 125.0, "move_speed": 88.0, "range": 11.0, "damage": 24.0,
		"cooldown": 1.05, "visual": "breach",
		"target_multipliers": {"light": 0.8, "armored": 1.5, "structure": 1.4},
	},
	"strider_bike": {
		"faction": "helion", "role": "raider", "armor": "light", "weapon": "repeater",
		"max_hp": 88.0, "move_speed": 142.0, "range": 20.0, "damage": 10.0,
		"cooldown": 0.48, "visual": "raider",
		"target_multipliers": {"light": 1.15, "armored": 0.55, "structure": 0.45},
	},
	"ember_tank": {
		"faction": "helion", "role": "mainline_armor", "armor": "armored", "weapon": "ember_cannon",
		"max_hp": 210.0, "move_speed": 70.0, "range": 24.0, "damage": 29.0,
		"cooldown": 1.2, "visual": "armor",
		"target_multipliers": {"light": 1.0, "armored": 1.05, "structure": 0.9},
	},
	"sunforge_artillery": {
		"faction": "helion", "role": "siege", "armor": "armored", "weapon": "sunforge_shell",
		"max_hp": 125.0, "move_speed": 56.0, "range": 50.0, "damage": 42.0,
		"cooldown": 2.45, "visual": "siege",
		"target_multipliers": {"light": 0.8, "armored": 1.0, "structure": 1.45},
	},
	"brood_architect": {
		"faction": "veyari", "role": "builder", "armor": "light", "weapon": "growth_tendril",
		"max_hp": 100.0, "move_speed": 96.0, "range": 18.0, "damage": 16.0,
		"cooldown": 0.6, "visual": "builder",
		"target_multipliers": {"light": 0.75, "armored": 0.45, "structure": 1.0},
	},
	"needle_brood": {
		"faction": "veyari", "role": "line_infantry", "armor": "light", "weapon": "needle_burst",
		"max_hp": 92.0, "move_speed": 108.0, "range": 22.0, "damage": 9.0,
		"cooldown": 0.42, "visual": "line",
		"target_multipliers": {"light": 1.28, "armored": 0.58, "structure": 0.5},
	},
	"rift_claw": {
		"faction": "veyari", "role": "breach", "armor": "light", "weapon": "rift_claws",
		"max_hp": 108.0, "move_speed": 110.0, "range": 9.0, "damage": 20.0,
		"cooldown": 0.78, "visual": "breach",
		"target_multipliers": {"light": 0.85, "armored": 1.55, "structure": 1.35},
	},
	"skitter_lance": {
		"faction": "veyari", "role": "raider", "armor": "light", "weapon": "spine_lance",
		"max_hp": 82.0, "move_speed": 150.0, "range": 17.0, "damage": 13.0,
		"cooldown": 0.62, "visual": "raider",
		"target_multipliers": {"light": 1.1, "armored": 0.7, "structure": 0.5},
	},
	"bulwark_husk": {
		"faction": "veyari", "role": "mainline_armor", "armor": "armored", "weapon": "gravity_pulse",
		"max_hp": 235.0, "move_speed": 62.0, "range": 18.0, "damage": 23.0,
		"cooldown": 0.92, "visual": "armor",
		"target_multipliers": {"light": 1.05, "armored": 0.95, "structure": 0.8},
	},
	"mire_spitter": {
		"faction": "veyari", "role": "siege", "armor": "armored", "weapon": "mire_glob",
		"max_hp": 135.0, "move_speed": 61.0, "range": 43.0, "damage": 34.0,
		"cooldown": 1.85, "visual": "siege",
		"target_multipliers": {"light": 0.9, "armored": 0.9, "structure": 1.4},
	},
	"singularity_lobber": {
		"faction": "veyari", "role": "siege", "armor": "armored", "weapon": "singularity",
		"max_hp": 130.0, "move_speed": 53.0, "range": 52.0, "damage": 44.0,
		"cooldown": 2.6, "visual": "siege",
		"target_multipliers": {"light": 0.75, "armored": 1.05, "structure": 1.5},
	},
}


static func get_profile(unit_id: String) -> Dictionary:
	return (PROFILES.get(unit_id, FALLBACK) as Dictionary).duplicate(true)


static func has_profile(unit_id: String) -> bool:
	return PROFILES.has(unit_id)


static func get_damage(attacker_unit_id: String, target_armor: String) -> float:
	var profile := get_profile(attacker_unit_id)
	var multipliers: Dictionary = profile.get("target_multipliers", {})
	return float(profile.get("damage", 16.0)) * float(multipliers.get(target_armor, 1.0))
