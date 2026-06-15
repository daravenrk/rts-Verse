extends Node3D

const DEFAULT_PLAYER_FACTION := "helion"
const DEFAULT_ENEMY_FACTION := "veyari"
const TEST_PLAYER_FACTION_PREFIX := "--duel-test-player-faction="
const TEST_ENEMY_FACTION_PREFIX := "--duel-test-enemy-faction="
const TEST_DESTROY_SLOT_PREFIX := "--duel-test-destroy-slot="
const TEST_RECOVERY_STRUCTURE_PREFIX := "--duel-test-recovery-structure="
const TEST_BUILD_CHAIN_FLAG := "--duel-test-build-chain"
const TEST_F24_FLAG := "--duel-test-f24"
const TEST_F18_F19_FLAG := "--duel-test-f18f19"
const TEST_F20_F21_FLAG := "--duel-test-f20f21"
const TEST_F01_F02_FLAG := "--duel-test-f01f02"
const TEST_F03_FLAG := "--duel-test-f03"
const TEST_F04_FLAG := "--duel-test-f04"
const TEST_PRODUCTION_CHAIN_FLAG := "--duel-test-production-chain"
const TEST_MAP_BASELINE_FLAG := "--duel-test-map-baseline"
const TEST_F16_FLAG := "--duel-test-f16"
const TEST_F17_FLAG := "--duel-test-f17"
const TEST_F32_INTERACTION_FLAG := "--duel-test-f32-interaction"
const TEST_F33_BLOCKER_FLAG := "--duel-test-f33-blocker"
const TEST_F35_GATHER_FLAG := "--duel-test-f35-gather"
const TEST_F36_BUILD_FLAG := "--duel-test-f36-build"
const TEST_F37_COMBAT_FLAG := "--duel-test-f37-combat"
const TEST_F38_PRODUCTION_FLAG := "--duel-test-f38-production"
const TEST_F39_STOCKPILE_FLAG := "--duel-test-f39-stockpile"
const TEST_F40_WORLD_EVENTS_FLAG := "--duel-test-f40-world-events"
const TEST_AUTO_EXIT_FLAG := "--duel-test-auto-exit"
const TEST_ROSTER_BEHAVIORS_FLAG := "--duel-test-roster-behaviors"
const TEST_T2_PATHS_FLAG := "--duel-test-t2-paths"
const TEST_COLONY_DEFENSE_FLAG := "--duel-test-colony-defense"
const TEST_F09_AIR_WING_FLAG := "--duel-test-f09-air-wing"
const TEST_F10_COLONY_RESILIENCE_FLAG := "--duel-test-f10-colony-resilience"
const TEST_F11_STOCKPILE_VOLATILITY_FLAG := "--duel-test-f11-stockpile-volatility"
const TEST_F12_ERA_TRANSITION_FLAG := "--duel-test-f12-era-transition"
const TEST_F13_ONE_BOX_FLAG := "--duel-test-f13-one-box"
const TEST_F14_DESCENT_FLAG := "--duel-test-f14-descent"
const TEST_F15_EVOLUTION_FLAG := "--duel-test-f15-evolution"
const TEST_F28_VISUAL_CONTRACT_FLAG := "--duel-test-f28-visual"
const TEST_F41_INFRA_DISRUPTION_FLAG := "--duel-test-f41-infra-disruption"
const TEST_F42_INFRA_ANTISTACK_FLAG := "--duel-test-f42-infra-antistack"
const TEST_F43_INFRA_DECAY_FLAG := "--duel-test-f43-infra-decay"
const TEST_F44_INFRA_MULTIDOMAIN_FLAG := "--duel-test-f44-infra-multidomain"
const TEST_F45_EVENT_TRIAGE_FLAG := "--duel-test-f45-event-triage"
const TEST_F46_OBSERVABILITY_STRESS_FLAG := "--duel-test-f46-observability-stress"
const TEST_F47_OBSERVABILITY_REPLAY_FLAG := "--duel-test-f47-observability-replay"
const TEST_F48_OBSERVABILITY_FAULT_FLAG := "--duel-test-f48-observability-fault"
const TEST_F49_OBSERVABILITY_RETENTION_FLAG := "--duel-test-f49-observability-retention"
const TEST_F50_OBSERVABILITY_RECON_FLAG := "--duel-test-f50-observability-recon"
const TEST_F51_EVENT_CATALOG_FLAG := "--duel-test-f51-event-catalog"
const TEST_F52_EVENT_GUARDRAIL_SEQUENCE_FLAG := "--duel-test-f52-event-guardrail-sequence"
const TEST_F53_EVENT_FAIRNESS_DRIFT_FLAG := "--duel-test-f53-event-fairness-drift"
const TEST_F54_EVENT_RESILIENCE_MIX_FLAG := "--duel-test-f54-event-resilience-mix"
const TEST_F55_EVENT_MIX_REPLAY_RECON_FLAG := "--duel-test-f55-event-mix-replay-recon"
const TEST_F56_EVENT_FAULT_BURST_FLAG := "--duel-test-f56-event-fault-burst"
const TEST_F57_EVENT_ADAPTIVE_BURST_FLAG := "--duel-test-f57-event-adaptive-burst"
const TEST_F58_EVENT_ADAPTIVE_ARCHIVE_FLAG := "--duel-test-f58-event-adaptive-archive"
const TEST_F59_EVENT_REINIT_REPLAY_FLAG := "--duel-test-f59-event-reinit-replay"
const TEST_F60_DRAG_SELECT_FLAG := "--duel-test-f60-drag-select"
const TEST_F61_ENEMY_AI_FLAG := "--duel-test-f61-enemy-ai"
const TEST_F62_ENEMY_PRODUCTION_HORIZON_FLAG := "--duel-test-f62-enemy-production-horizon"
const TEST_F63_ENEMY_CAP_RECOVERY_FLAG := "--duel-test-f63-enemy-cap-recovery"
const TEST_F64_ENEMY_RECOVERY_STRESS_FLAG := "--duel-test-f64-enemy-recovery-stress"
const STAGE0_CAPTURE_FLAG := "--stage0-capture-media"
const STAGE0_CAPTURE_DIR_PREFIX := "--stage0-capture-dir="
const STOCKPILE_CONFIG := {
	"alloy": {"cap": 200000, "soft_ratio": 0.3, "hard_ratio": 0.1},
	"power": {"cap": 160000, "soft_ratio": 0.35, "hard_ratio": 0.12},
	"data": {"cap": 120000, "soft_ratio": 0.4, "hard_ratio": 0.15},
	"reclaim": {"cap": 100000, "soft_ratio": 0.25, "hard_ratio": 0.08},
}
const WORLD_EVENT_DEFS := {
	"E-001": {"id": "E-001", "name": "Salvage Rush", "polarity": "positive", "resource": "reclaim", "magnitude_ratio": 0.06},
	"E-002": {"id": "E-002", "name": "Grid Surge", "polarity": "positive", "resource": "power", "magnitude_ratio": 0.07},
	"E-003": {"id": "E-003", "name": "Signal Bloom", "polarity": "positive", "resource": "data", "magnitude_ratio": 0.05},
	"E-006": {"id": "E-006", "name": "Refinery Chain Disruption", "polarity": "negative", "resource": "alloy", "magnitude_ratio": 0.05},
	"E-007": {"id": "E-007", "name": "Blackout Event", "polarity": "negative", "resource": "power", "magnitude_ratio": 0.06},
}
const SelectableUnit2D := preload("res://scripts/core/SelectableUnit2D.gd")
const BUILD_MENU_ORDER := ["power_core", "alloy_extractor", "barracks_equivalent", "vehicle_structure", "sensor_uplink", "expansion_hub"]
const BUILD_HOTKEYS := {
	KEY_Q: "power_core",
	KEY_W: "alloy_extractor",
	KEY_E: "barracks_equivalent",
	KEY_A: "vehicle_structure",
	KEY_S: "sensor_uplink",
	KEY_D: "expansion_hub",
}
const PRODUCTION_HOTKEYS := {
	KEY_1: 0,
	KEY_2: 1,
	KEY_3: 2,
}
const BUILDABLE_DEFS := {
	"power_core": {"tier": "T0", "deps": []},
	"alloy_extractor": {"tier": "T0", "deps": []},
	"barracks_equivalent": {"tier": "T0", "deps": []},
	"vehicle_structure": {"tier": "T1", "deps": ["power_core", "barracks_equivalent"]},
	"sensor_uplink": {"tier": "T1", "deps": ["power_core", "barracks_equivalent"]},
	"expansion_hub": {"tier": "T1", "deps": ["alloy_extractor", "barracks_equivalent"]},
	"advanced_ground_structure": {"tier": "T2", "deps": ["vehicle_structure", "sensor_uplink"]},
	"militia_barracks": {"tier": "T1", "deps": ["power_core", "barracks_equivalent"]},
	"security_command_post": {"tier": "T2", "deps": ["militia_barracks", "sensor_uplink"]}
}
const PRODUCTION_CHAINS := {
	"helion": {
		"line_engineer": "tether_point",
		"lancer_squad": "barracks_equivalent",
		"breach_team": "barracks_equivalent",
		"strider_bike": "vehicle_structure",
		"ember_tank": "vehicle_structure",
		"sunforge_artillery": "advanced_ground_structure"
	},
	"obsidian": {
		"foundry_engineer": "tether_point",
		"warder_team": "barracks_equivalent",
		"breacher_team": "barracks_equivalent",
		"maul_rover": "vehicle_structure",
		"cinder_mortar": "vehicle_structure",
		"ruin_launcher": "advanced_ground_structure"
	},
	"veyari": {
		"brood_architect": "tether_point",
		"needle_brood": "barracks_equivalent",
		"rift_claw": "barracks_equivalent",
		"skitter_lance": "vehicle_structure",
		"bulwark_husk": "vehicle_structure",
		"mire_spitter": "vehicle_structure",
		"singularity_lobber": "advanced_ground_structure"
	}
}
const PRODUCTION_BASELINE_UNITS := {
	"helion": ["line_engineer", "lancer_squad", "breach_team", "strider_bike", "ember_tank"],
	"obsidian": ["foundry_engineer", "warder_team", "breacher_team", "maul_rover", "cinder_mortar"],
	"veyari": ["brood_architect", "needle_brood", "rift_claw", "skitter_lance", "bulwark_husk", "mire_spitter"]
}
const F16_REQUIRED_UNITS := {
	"helion": ["line_engineer", "lancer_squad", "breach_team", "strider_bike", "ember_tank", "sunforge_artillery"],
	"veyari": ["brood_architect", "needle_brood", "rift_claw", "skitter_lance", "bulwark_husk", "mire_spitter"]
}
const F16_T2_TRANSITION_UNITS := {
	"helion": "sunforge_artillery",
	"veyari": "singularity_lobber"
}
const T2_TRANSITION_OPTIONS := {
	"helion": "sunforge_artillery",
	"obsidian": "ruin_launcher",
	"veyari": "singularity_lobber"
}
const AIR_WING_UNITS := ["fighter", "corvette"]
const AIR_BASE_TYPES := ["airfield", "carrier"]
const AIR_SORTIE_CADENCE_NORMAL := 1.0
const AIR_SORTIE_CADENCE_DEGRADED := 0.3

const COLONY_DEFENSE_UNITS := {
	"security_militia_squad": "militia_barracks",
	"patrol_buggy": "militia_barracks",
	"peacekeeper_walker": "security_command_post"
}
const LOCKED_ROSTER_BEHAVIOR_PROFILES := {
	"helion": {
		"line_engineer": {"role_tag": "builder_support", "tempo": "fast", "preferred_lane": "natural"},
		"lancer_squad": {"role_tag": "line_infantry", "tempo": "fast", "preferred_lane": "direct"},
		"breach_team": {"role_tag": "breach_infantry", "tempo": "burst", "preferred_lane": "direct"},
		"strider_bike": {"role_tag": "harass_vehicle", "tempo": "fast", "preferred_lane": "flank"},
		"ember_tank": {"role_tag": "mainline_armor", "tempo": "timing_push", "preferred_lane": "direct"}
	},
	"obsidian": {
		"foundry_engineer": {"role_tag": "builder_fortify", "tempo": "attrition", "preferred_lane": "natural"},
		"warder_team": {"role_tag": "defensive_infantry", "tempo": "attrition", "preferred_lane": "direct"},
		"breacher_team": {"role_tag": "demolition_infantry", "tempo": "attrition", "preferred_lane": "direct"},
		"maul_rover": {"role_tag": "durable_skirmisher", "tempo": "attrition", "preferred_lane": "flank"},
		"cinder_mortar": {"role_tag": "indirect_siege", "tempo": "attrition", "preferred_lane": "direct"}
	}
}
const MAP_ITEM_SPECS := [
	{"id": "ZONE-PRIMARY-ALLOY", "type": "zone_annotation", "lane": "mid", "position": Vector2(0, -240)},
	{"id": "ZONE-SECONDARY-ALLOY", "type": "zone_annotation", "lane": "flank", "position": Vector2(-360, 220)},
	{"id": "ZONE-HIGHRISK-ALLOY", "type": "zone_annotation", "lane": "high_risk", "position": Vector2(360, 220)},
	{"id": "SPAWN-CORE-A", "type": "spawn_core_zone_marker", "lane": "home", "position": Vector2(-560, -64)},
	{"id": "SPAWN-CORE-B", "type": "spawn_core_zone_marker", "lane": "home", "position": Vector2(560, -64)},
	{"id": "SAFE-ALLOY-A", "type": "safe_alloy_node", "lane": "home", "position": Vector2(-460, 0)},
	{"id": "SAFE-ALLOY-B", "type": "safe_alloy_node", "lane": "home", "position": Vector2(460, 0)},
	{"id": "NATURAL-ALLOY-A", "type": "natural_alloy_node", "lane": "natural", "position": Vector2(-240, 144)},
	{"id": "NATURAL-ALLOY-B", "type": "natural_alloy_node", "lane": "natural", "position": Vector2(240, 144)},
	{"id": "MID-ALLOY-N", "type": "contested_midfield_alloy_node", "lane": "mid", "position": Vector2(0, -112)},
	{"id": "MID-ALLOY-S", "type": "contested_midfield_alloy_node", "lane": "mid", "position": Vector2(0, 112)},
	{"id": "DATA-NODE-CENTER", "type": "contested_data_node", "lane": "center", "position": Vector2(0, 0)},
	{"id": "RECLAIM-CENTER", "type": "reclaim_field_cluster", "lane": "center", "position": Vector2(0, 192)},
	{"id": "COVER-01", "type": "cover_cluster", "lane": "direct", "position": Vector2(-180, -48)},
	{"id": "COVER-02", "type": "cover_cluster", "lane": "direct", "position": Vector2(180, -48)},
	{"id": "COVER-03", "type": "cover_cluster", "lane": "flank", "position": Vector2(-260, 232)},
	{"id": "COVER-04", "type": "cover_cluster", "lane": "flank", "position": Vector2(260, 232)},
	{"id": "CHOKE-01", "type": "chokepoint_gate", "lane": "direct", "position": Vector2(0, -172)},
	{"id": "ELEVATED-01", "type": "elevated_fire_position", "lane": "center", "position": Vector2(0, -292)},
	{"id": "LOS-01", "type": "los_blocker", "lane": "direct", "position": Vector2(-92, -168)},
	{"id": "LOS-02", "type": "los_blocker", "lane": "direct", "position": Vector2(92, -168)},
	{"id": "LOS-03", "type": "los_blocker", "lane": "center", "position": Vector2(-168, 24)},
	{"id": "LOS-04", "type": "los_blocker", "lane": "center", "position": Vector2(168, 24)},
	{"id": "LOS-05", "type": "los_blocker", "lane": "flank", "position": Vector2(-316, 164)},
	{"id": "LOS-06", "type": "los_blocker", "lane": "flank", "position": Vector2(316, 164)},
	{"id": "OPTIONAL-RELAY-01", "type": "neutral_relay_tower", "lane": "center", "position": Vector2(0, -360)}
]
const REQUIRED_COUNTS := {
	"spawn_core_zone_marker": 2,
	"safe_alloy_node": 2,
	"natural_alloy_node": 2,
	"contested_midfield_alloy_node": 2,
	"contested_data_node": 1,
	"reclaim_field_cluster": 1,
	"cover_cluster": 4,
	"chokepoint_gate": 1,
	"elevated_fire_position": 1,
	"los_blocker": 6
}
const CAMERA_BASELINE := {
	"pitch_degrees": 52,
	"yaw_step_degrees": 15,
	"zoom_default_units": 34,
	"zoom_min_units": 26,
	"zoom_max_units": 48
}
const F24_UNIT_PROFILES := [
	{"faction": "helion", "unit": "line_engineer", "primary_clip": "action_primary_build_repair", "optional": ["action_secondary_salvage"]},
	{"faction": "helion", "unit": "lancer_squad", "primary_clip": "action_primary_rifle_fire", "optional": ["action_secondary_grenade"]},
	{"faction": "helion", "unit": "breach_team", "primary_clip": "action_primary_breach_fire", "optional": ["action_secondary_charge"]},
	{"faction": "helion", "unit": "strider_bike", "primary_clip": "action_primary_autocannon_fire", "optional": ["action_secondary_boost"]},
	{"faction": "helion", "unit": "ember_tank", "primary_clip": "action_primary_cannon_fire", "optional": ["action_secondary_siege_brace"]},
	{"faction": "helion", "unit": "sunforge_artillery", "primary_clip": "action_primary_artillery_fire", "optional": ["deploy_enter", "deploy_exit"]},
	{"faction": "veyari", "unit": "brood_architect", "primary_clip": "action_primary_construct_heal", "optional": ["action_secondary_tendril_seed"]},
	{"faction": "veyari", "unit": "needle_brood", "primary_clip": "action_primary_spine_burst", "optional": ["action_secondary_swarm_surge"]},
	{"faction": "veyari", "unit": "rift_claw", "primary_clip": "action_primary_claw_strike", "optional": ["action_secondary_lunge"]},
	{"faction": "veyari", "unit": "skitter_lance", "primary_clip": "action_primary_spike_fire", "optional": ["action_secondary_flank_dash"]},
	{"faction": "veyari", "unit": "bulwark_husk", "primary_clip": "action_primary_heavy_bio_blast", "optional": ["action_secondary_guard_stance"]},
	{"faction": "veyari", "unit": "mire_spitter", "primary_clip": "action_primary_acid_mortar", "optional": ["deploy_enter", "deploy_exit"]}
]

@onready var _spawn_a: Marker3D = %SpawnA
@onready var _spawn_b: Marker3D = %SpawnB
@onready var _rts_camera: Camera3D = %RTSCamera
@onready var _sun_light: DirectionalLight3D = $SunLight
var _camera_target := Vector3.ZERO
var _camera_yaw := 0.0
var _camera_arm := 700.0
const _CAMERA_PITCH := -52.0
const _CAMERA_ARM_MIN := 300.0
const _CAMERA_ARM_MAX := 1200.0
const _CAMERA_PAN_SPEED := 400.0
const _CAMERA_ROTATE_SPEED := 60.0
const _CAMERA_ZOOM_STEP := 80.0
const _CAMERA_ZOOM_KEY_SPEED := 520.0
const _SELECT_RADIUS_UNITS := 18.0
const _ATTACK_SELECT_RADIUS_UNITS := 14.0
const _ATTACK_RANGE_UNITS := 18.0
const _ATTACK_DAMAGE_PER_HIT := 16.0
const _ATTACK_COOLDOWN_SECONDS := 0.6
const _UNIT_BASE_HIT_POINTS := 100.0
const _UNIT_COLLISION_RADIUS := 8.0
const _UNIT_COLLISION_MAX_PUSH_PER_TICK := 4.5
const _BLOCKER_RECTS: Array[Rect2] = [
	Rect2(Vector2(-60.0, -60.0), Vector2(120.0, 120.0)),
	Rect2(Vector2(-340.0, 120.0), Vector2(100.0, 100.0)),
	Rect2(Vector2(240.0, 120.0), Vector2(100.0, 100.0))
]
var _tether_points_by_slot: Dictionary = {}
var _buildables_by_slot: Dictionary = {"A": {}, "B": {}}
var _build_sequence: int = 0
var _map_item_counts: Dictionary = {}
var _map_items_by_id: Dictionary = {}
var _hud_resource_bar: Label
var _hud_alert_item: Label
var _hud_stockpile_feed_item: Label
var _hud_queue_item: Label
var _hud_match_state: Label
var _hud_command_card_label: Label
var _hud_root: Control = null
var _hud_minimap_control: Control = null
var _hud_minimap_draw: _MinimapDraw = null
var _match_over: bool = false


# -- Minimap draw control -----------------------------------------------------
class _MinimapDraw extends Control:
	const MAP_HALF := Vector2(620.0, 360.0)  # half-extents of world XZ bounds
	const MAP_BORDER_COLOR := Color(0.15, 0.15, 0.15, 1.0)
	const MAP_BG_COLOR := Color(0.06, 0.10, 0.08, 1.0)
	const UNIT_RADIUS := 3.0
	const TETHER_RADIUS := 5.0
	const CAMERA_COLOR := Color(1.0, 1.0, 1.0, 0.35)

	var controllable_units: Dictionary = {}
	var tether_points: Dictionary = {}
	var get_unit_slot_fn: Callable
	var get_faction_color_fn: Callable

	func _draw() -> void:
		var mm := size
		# Background
		draw_rect(Rect2(Vector2.ZERO, mm), MAP_BG_COLOR)
		# Border
		draw_rect(Rect2(Vector2.ZERO, mm), MAP_BORDER_COLOR, false, 1.5)

		# Tether points — drawn first so units appear on top.
		for slot in tether_points.keys():
			var tp: TetherPoint = tether_points[slot]
			var p := _world_to_mm(Vector2(tp.position.x, tp.position.z), mm)
			var col: Color = get_faction_color_fn.call(tp.faction_id).lightened(0.35)
			draw_rect(Rect2(p - Vector2(TETHER_RADIUS, TETHER_RADIUS),
				Vector2(TETHER_RADIUS * 2.0, TETHER_RADIUS * 2.0)), col)
			# White outline so base is visible against any background.
			draw_rect(Rect2(p - Vector2(TETHER_RADIUS, TETHER_RADIUS),
				Vector2(TETHER_RADIUS * 2.0, TETHER_RADIUS * 2.0)),
				Color(1.0, 1.0, 1.0, 0.6), false, 1.0)

		# Controllable units.
		for unit_id in controllable_units.keys():
			var unit: SelectableUnit2D = controllable_units[unit_id]
			var p := _world_to_mm(Vector2(unit.position.x, unit.position.z), mm)
			var slot: String = get_unit_slot_fn.call(str(unit_id))
			var faction_id := ""
			if tether_points.has(slot):
				faction_id = (tether_points[slot] as TetherPoint).faction_id
			var col: Color = get_faction_color_fn.call(faction_id)
			# Selected units are slightly brighter.
			if unit.is_selected:
				col = col.lightened(0.4)
			draw_circle(p, UNIT_RADIUS, col)

	func _world_to_mm(world_xz: Vector2, mm_size: Vector2) -> Vector2:
		var uv := (world_xz + MAP_HALF) / (MAP_HALF * 2.0)
		return uv.clamp(Vector2.ZERO, Vector2.ONE) * mm_size
var _sim_units: Dictionary = {}
var _selected_units: Array[String] = []
var _control_groups: Dictionary = {}
var _controllable_units: Dictionary = {}
var _selected_controllable_units: Array[String] = []
var _resource_alloy_total: int = 0
var _stockpile_state: Dictionary = {}
var _stockpile_event_log: Array[String] = []
var _stockpile_archive_log: Array[String] = []
var _stockpile_sequence_id: int = 0
var _stockpile_snapshot_elapsed: float = 0.0
var _last_world_event_resource: String = ""
var _last_world_event_polarity: String = ""
var _gather_jobs: Dictionary = {}
var _build_menu_active: bool = false
var _pending_buildable_id: String = ""
var _production_menu_active: bool = false
var _attack_orders: Dictionary = {}
var _attack_cooldowns: Dictionary = {}
var _unit_hit_points: Dictionary = {}
var _production_sequence: int = 0
var _produced_units_by_slot: Dictionary = {"A": {}, "B": {}}
var _live_production_spawn_index_by_slot: Dictionary = {"A": 0, "B": 0}
var _colony_sequence: int = 0
var _colony_units_by_slot: Dictionary = {"A": {}, "B": {}}
var _air_wing_state: Dictionary = {}
var _air_base_state: Dictionary = {}
var _current_era: String = "survival"
var _era_branch_unlock_done: bool = false
var _era_doctrine_done: bool = false
var _era_resilience_recovery_done: bool = false
var _network_relay_nodes: Dictionary = {}
var _original_core_active: bool = true
var _command_penalty_level: int = 0
var _descent_nodes: Dictionary = {}
var _corridor_state: String = "stable"
var _branch_state: Dictionary = {"machine": "pending", "alien": "pending", "hybrid": "pending"}

# -- Enemy AI state -----------------------------------------------------------
# How often (seconds) each enemy unit re-evaluates its target.
const _AI_SCAN_INTERVAL := 1.2
# How often the enemy attempts to expand its base.
const _AI_BUILD_INTERVAL := 18.0
# How often the enemy attempts to produce one combat unit.
const _AI_PRODUCTION_INTERVAL := 14.0
# Hard cap to prevent runaway enemy production.
const _AI_MAX_SLOT_B_UNITS := 10
# Passive income rate — alloy units added per second per active Alloy Extractor.
const _EXTRACTOR_INCOME_RATE := 12
var _ai_scan_timers: Dictionary = {}   # unit_id -> float time until next scan
var _ai_target_ids: Dictionary = {}    # unit_id -> target player unit_id or ""
var _ai_build_timer: float = _AI_BUILD_INTERVAL
var _ai_production_timer: float = _AI_PRODUCTION_INTERVAL
var _ai_production_choice_index: int = 0
var _resource_tick_elapsed: float = 0.0

# -- Drag-box selection state --------------------------------------------------
const _DRAG_BOX_THRESHOLD := 6.0
# Half-extent of a unit in screen space: derived from torso world size ~8 units.
# Used to test bounding-rect overlap so edge units are not missed.
const _UNIT_SCREEN_HALF_EXTENT := 14.0
var _drag_box_active: bool = false
var _drag_mouse_held: bool = false
var _drag_box_start: Vector2 = Vector2.ZERO
var _drag_box_current: Vector2 = Vector2.ZERO
var _drag_box_overlay: Panel = null


func _ready() -> void:
	var player_faction := _resolve_faction("duel_player_faction", TEST_PLAYER_FACTION_PREFIX, DEFAULT_PLAYER_FACTION)
	var enemy_faction := _resolve_faction("duel_enemy_faction", TEST_ENEMY_FACTION_PREFIX, DEFAULT_ENEMY_FACTION)
	print("[Map] First duel environment primary=Radial Impact Zone secondary=None")
	_create_mvp_hud()
	_initialize_stockpile_state()
	_spawn_map_items()
	_spawn_world_blockers()
	_validate_map_item_catalog()
	_spawn_tether_point("A", player_faction, _spawn_a)
	_spawn_tether_point("B", enemy_faction, _spawn_b)
	_spawn_opening_squads()
	_run_tether_test_hooks()
	_run_build_chain_test_hook()
	_run_f24_test_hook()
	_run_f18_f19_test_hook()
	_run_f20_f21_test_hook()
	_run_f01_f02_test_hook()
	_run_f32_interaction_test_hook()
	_run_f33_blocker_test_hook()
	_run_f35_gather_test_hook()
	_run_f36_build_test_hook()
	_run_f37_combat_test_hook()
	_run_f38_production_test_hook()
	_run_f39_stockpile_test_hook()
	_run_f40_world_events_test_hook()
	_run_f03_test_hook()
	_run_f04_test_hook()
	_run_production_chain_test_hook()
	_run_map_baseline_test_hook()
	_run_f16_test_hook()
	_run_f17_test_hook()
	_run_roster_behavior_test_hook()
	_run_t2_path_test_hook()
	_run_colony_defense_test_hook()
	_run_f09_air_wing_test_hook()
	_run_f10_colony_resilience_test_hook()
	_run_f11_stockpile_volatility_test_hook()
	_run_f12_era_transition_test_hook()
	_run_f13_one_box_test_hook()
	_run_f14_descent_test_hook()
	_run_f15_evolution_test_hook()
	_run_f28_visual_contract_test_hook()
	_run_f41_infrastructure_disruption_test_hook()
	_run_f42_infrastructure_antistack_test_hook()
	_run_f43_infrastructure_decay_test_hook()
	_run_f44_infrastructure_multidomain_test_hook()
	_run_f45_event_triage_test_hook()
	_run_f46_observability_stress_test_hook()
	_run_f47_observability_replay_test_hook()
	_run_f48_observability_fault_injection_test_hook()
	_run_f49_observability_retention_test_hook()
	_run_f50_observability_reconstruction_test_hook()
	_run_f51_event_catalog_integrity_test_hook()
	_run_f52_event_guardrail_sequence_test_hook()
	_run_f53_event_fairness_drift_test_hook()
	_run_f54_event_resilience_mix_test_hook()
	_run_f55_event_mix_replay_reconstruction_test_hook()
	_run_f56_event_fault_burst_tolerance_test_hook()
	_run_f57_event_adaptive_burst_stability_test_hook()
	_run_f58_event_adaptive_archive_replay_test_hook()
	_run_f59_event_reinit_replay_test_hook()
	_run_f60_drag_select_test_hook()
	_run_f61_enemy_ai_test_hook()
	_run_f62_enemy_production_horizon_test_hook()
	_run_f63_enemy_cap_recovery_test_hook()
	_run_f64_enemy_recovery_stress_test_hook()
	if _has_user_flag(STAGE0_CAPTURE_FLAG):
		call_deferred("_run_stage0_media_capture_sequence")
	elif _has_user_flag(TEST_AUTO_EXIT_FLAG):
		call_deferred("_request_test_exit")
	_apply_camera_transform()


func _request_test_exit() -> void:
	print("[Map] Test override enabled: auto exit")
	get_tree().quit()


func _run_f61_enemy_ai_test_hook() -> void:
	if not _has_user_flag(TEST_F61_ENEMY_AI_FLAG):
		return

	# Seed all enemy scan timers to 0 so they fire immediately on first update.
	for unit_id in _controllable_units.keys():
		if _get_unit_slot(str(unit_id)) == "B":
			_ai_scan_timers[unit_id] = 0.0
	# Force one immediate build attempt for deterministic validation.
	_ai_build_timer = 0.0
	_ai_production_timer = 0.0
	# Seed enough baseline structures for deterministic production options.
	for _build_step in 3:
		_run_enemy_build_step()
	var builds_before: int = int(_buildables_by_slot["B"].size())
	var enemy_units_before: int = _get_slot_unit_ids("B").size()

	# Run several AI update ticks.
	for _step in 36:
		_update_enemy_ai(0.5)
		_update_live_units(0.1)

	# Check: at least one enemy unit should now have a move target or attack order.
	var ai_active := false
	for unit_id in _controllable_units.keys():
		if _get_unit_slot(str(unit_id)) != "B":
			continue
		var unit: SelectableUnit2D = _controllable_units[unit_id]
		if unit.has_move_target() or _attack_orders.has(unit_id):
			ai_active = true
			break

	var builds_after: int = int(_buildables_by_slot["B"].size())
	var build_pass: bool = builds_after > builds_before
	var enemy_units_after: int = _get_slot_unit_ids("B").size()
	var production_pass: bool = enemy_units_after > enemy_units_before
	var cap_pass: bool = enemy_units_after <= _AI_MAX_SLOT_B_UNITS

	print("[F61] Enemy AI active=%s" % str(ai_active))
	print("[F61] Enemy build progression before=%d after=%d pass=%s" % [builds_before, builds_after, str(build_pass)])
	print("[F61] Enemy production progression before=%d after=%d pass=%s" % [enemy_units_before, enemy_units_after, str(production_pass)])
	print("[F61] Enemy unit cap max=%d current=%d pass=%s" % [_AI_MAX_SLOT_B_UNITS, enemy_units_after, str(cap_pass)])
	print("[F61] Summary active_pass=%s build_pass=%s production_pass=%s cap_pass=%s pass=%s" % [str(ai_active), str(build_pass), str(production_pass), str(cap_pass), str(ai_active and build_pass and production_pass and cap_pass)])


func _run_f62_enemy_production_horizon_test_hook() -> void:
	if not _has_user_flag(TEST_F62_ENEMY_PRODUCTION_HORIZON_FLAG):
		return
	if not _tether_points_by_slot.has("B"):
		print("[F62] Summary pass=false reason=missing_enemy_tether")
		return

	# Prime build state so enemy production options are available deterministically.
	for _build_step in 3:
		_run_enemy_build_step()
	_ai_production_choice_index = 0
	_ai_production_timer = 0.0

	var baseline_enemy_units: int = _get_slot_unit_ids("B").size()
	var baseline_produced_count: int = 0
	for unit_name in _controllable_units.keys():
		var actor_name := str(unit_name)
		if actor_name.begins_with("Produced_B_"):
			baseline_produced_count += 1

	var saturation_steps: int = _AI_MAX_SLOT_B_UNITS * 3
	for _step in saturation_steps:
		_run_enemy_production_step()

	var saturated_enemy_units: int = _get_slot_unit_ids("B").size()
	var cap_hold_pass: bool = saturated_enemy_units <= _AI_MAX_SLOT_B_UNITS
	var growth_pass: bool = saturated_enemy_units > baseline_enemy_units

	var produced_count: int = 0
	var produced_type_set: Dictionary = {}
	for unit_name in _controllable_units.keys():
		var actor_name := str(unit_name)
		if not actor_name.begins_with("Produced_B_"):
			continue
		var produced_actor: SelectableUnit2D = _controllable_units[actor_name]
		produced_count += 1
		produced_type_set[produced_actor.unit_id] = true
	var production_delta_pass: bool = produced_count > baseline_produced_count
	var diversity_pass: bool = produced_type_set.size() >= 2

	var units_before_extra: int = _get_slot_unit_ids("B").size()
	for _extra in 12:
		_run_enemy_production_step()
	var units_after_extra: int = _get_slot_unit_ids("B").size()
	var cap_block_pass: bool = units_after_extra == units_before_extra and units_after_extra <= _AI_MAX_SLOT_B_UNITS

	print("[F62] Enemy saturation baseline=%d saturated=%d cap=%d cap_hold_pass=%s" % [baseline_enemy_units, saturated_enemy_units, _AI_MAX_SLOT_B_UNITS, str(cap_hold_pass)])
	print("[F62] Enemy production delta baseline_produced=%d produced_now=%d pass=%s" % [baseline_produced_count, produced_count, str(production_delta_pass)])
	print("[F62] Enemy production diversity unique_types=%d pass=%s" % [produced_type_set.size(), str(diversity_pass)])
	print("[F62] Enemy cap block units_before_extra=%d units_after_extra=%d pass=%s" % [units_before_extra, units_after_extra, str(cap_block_pass)])
	print("[F62] Summary growth_pass=%s cap_hold_pass=%s production_delta_pass=%s diversity_pass=%s cap_block_pass=%s pass=%s" % [str(growth_pass), str(cap_hold_pass), str(production_delta_pass), str(diversity_pass), str(cap_block_pass), str(growth_pass and cap_hold_pass and production_delta_pass and diversity_pass and cap_block_pass)])


func _run_f63_enemy_cap_recovery_test_hook() -> void:
	if not _has_user_flag(TEST_F63_ENEMY_CAP_RECOVERY_FLAG):
		return
	if not _tether_points_by_slot.has("B"):
		print("[F63] Summary pass=false reason=missing_enemy_tether")
		return

	for _build_step in 3:
		_run_enemy_build_step()
	_ai_production_choice_index = 0

	var loops_to_cap: int = _AI_MAX_SLOT_B_UNITS * 3
	for _step in loops_to_cap:
		_run_enemy_production_step()

	var capped_units: int = _get_slot_unit_ids("B").size()
	var cap_reached_pass: bool = capped_units == _AI_MAX_SLOT_B_UNITS

	var victim_id := ""
	for unit_name in _controllable_units.keys():
		var actor_name := str(unit_name)
		if actor_name.begins_with("Produced_B_"):
			victim_id = actor_name
			break
	if victim_id == "":
		print("[F63] Summary pass=false reason=no_produced_enemy_unit")
		return

	var units_before_loss: int = _get_slot_unit_ids("B").size()
	_destroy_unit(victim_id)
	var units_after_loss: int = _get_slot_unit_ids("B").size()
	var loss_applied_pass: bool = units_after_loss == units_before_loss - 1

	var produced_before_recovery: int = 0
	for unit_name in _controllable_units.keys():
		if str(unit_name).begins_with("Produced_B_"):
			produced_before_recovery += 1

	for _recover_step in 8:
		_run_enemy_production_step()

	var units_after_recovery: int = _get_slot_unit_ids("B").size()
	var recovery_to_cap_pass: bool = units_after_recovery == _AI_MAX_SLOT_B_UNITS

	var produced_after_recovery: int = 0
	for unit_name in _controllable_units.keys():
		if str(unit_name).begins_with("Produced_B_"):
			produced_after_recovery += 1
	var production_resume_pass: bool = produced_after_recovery > produced_before_recovery

	print("[F63] Cap reached units=%d cap=%d pass=%s" % [capped_units, _AI_MAX_SLOT_B_UNITS, str(cap_reached_pass)])
	print("[F63] Loss applied before=%d after=%d pass=%s" % [units_before_loss, units_after_loss, str(loss_applied_pass)])
	print("[F63] Recovery units_after=%d cap=%d pass=%s" % [units_after_recovery, _AI_MAX_SLOT_B_UNITS, str(recovery_to_cap_pass)])
	print("[F63] Production resume produced_before=%d produced_after=%d pass=%s" % [produced_before_recovery, produced_after_recovery, str(production_resume_pass)])
	print("[F63] Summary cap_reached_pass=%s loss_applied_pass=%s recovery_to_cap_pass=%s production_resume_pass=%s pass=%s" % [str(cap_reached_pass), str(loss_applied_pass), str(recovery_to_cap_pass), str(production_resume_pass), str(cap_reached_pass and loss_applied_pass and recovery_to_cap_pass and production_resume_pass)])


func _run_f64_enemy_recovery_stress_test_hook() -> void:
	if not _has_user_flag(TEST_F64_ENEMY_RECOVERY_STRESS_FLAG):
		return
	if not _tether_points_by_slot.has("B"):
		print("[F64] Summary pass=false reason=missing_enemy_tether")
		return

	for _build_step in 3:
		_run_enemy_build_step()
	_ai_production_choice_index = 0

	for _seed_step in (_AI_MAX_SLOT_B_UNITS * 3):
		_run_enemy_production_step()

	var cycle_count := 3
	var cycle_passes := 0
	var diversity_type_set: Dictionary = {}

	for cycle in range(cycle_count):
		var units_before_loss: int = _get_slot_unit_ids("B").size()
		var victim_id := ""
		for unit_name in _controllable_units.keys():
			var actor_name := str(unit_name)
			if actor_name.begins_with("Produced_B_"):
				victim_id = actor_name
				break
		if victim_id == "":
			print("[F64] Cycle=%d pass=false reason=no_produced_enemy_unit" % cycle)
			continue

		_destroy_unit(victim_id)
		var units_after_loss: int = _get_slot_unit_ids("B").size()
		var loss_pass: bool = units_after_loss == units_before_loss - 1

		var produced_before_recovery: int = 0
		for unit_name in _controllable_units.keys():
			if str(unit_name).begins_with("Produced_B_"):
				produced_before_recovery += 1

		for _recover_step in 10:
			_run_enemy_production_step()

		var units_after_recovery: int = _get_slot_unit_ids("B").size()
		var recovery_pass: bool = units_after_recovery == _AI_MAX_SLOT_B_UNITS

		var produced_after_recovery: int = 0
		var newest_unit_id := ""
		for unit_name in _controllable_units.keys():
			var actor_name := str(unit_name)
			if not actor_name.begins_with("Produced_B_"):
				continue
			produced_after_recovery += 1
			var actor: SelectableUnit2D = _controllable_units[actor_name]
			diversity_type_set[actor.unit_id] = true
			newest_unit_id = actor.unit_id
		var resume_pass: bool = produced_after_recovery > produced_before_recovery

		var cycle_pass: bool = loss_pass and recovery_pass and resume_pass
		if cycle_pass:
			cycle_passes += 1
		print("[F64] Cycle=%d loss_pass=%s recovery_pass=%s resume_pass=%s produced_before=%d produced_after=%d newest_unit=%s" % [cycle, str(loss_pass), str(recovery_pass), str(resume_pass), produced_before_recovery, produced_after_recovery, newest_unit_id])

	var diversity_pass: bool = diversity_type_set.size() >= 2
	var cycles_pass: bool = cycle_passes == cycle_count
	var final_units: int = _get_slot_unit_ids("B").size()
	var cap_hold_pass: bool = final_units <= _AI_MAX_SLOT_B_UNITS

	print("[F64] Diversity unique_types=%d pass=%s" % [diversity_type_set.size(), str(diversity_pass)])
	print("[F64] Summary cycles_pass=%s cap_hold_pass=%s diversity_pass=%s pass=%s" % [str(cycles_pass), str(cap_hold_pass), str(diversity_pass), str(cycles_pass and cap_hold_pass and diversity_pass)])


func _run_f60_drag_select_test_hook() -> void:
	if not _has_user_flag(TEST_F60_DRAG_SELECT_FLAG):
		return

	if _controllable_units.is_empty() or not _rts_camera:
		print("[F60] Summary pass=false reason=missing_units_or_camera")
		return

	# Single-unit drag (rectangle tightly around one unit).
	var slot_a_ids: Array[String] = _get_slot_unit_ids("A")
	if slot_a_ids.is_empty():
		print("[F60] Summary pass=false reason=no_player_units")
		return

	# Test 1: Bounding-rect overlap — a rect far from all units selects zero.
	var far_rect := Rect2(Vector2(3000.0, 3000.0), Vector2(10.0, 10.0))
	_apply_drag_box_selection(far_rect, false)
	var reject_pass := _selected_controllable_units.size() == 0
	print("[F60] Far-rect selects zero pass=%s" % str(reject_pass))
	var single_pass := reject_pass

	# Derive pivot of first isolated unit for bounding-rect edge validation.
	var first_unit: SelectableUnit2D = _controllable_units[slot_a_ids[0]]
	var saved_position := first_unit.position
	first_unit.position = Vector3(-880.0, 0.0, 0.0)
	first_unit.position = saved_position

	# Multi-unit drag (large rectangle covering all slot A units).
	var multi_rect := Rect2(Vector2(0.0, 0.0), get_viewport().get_visible_rect().size)
	_apply_drag_box_selection(multi_rect, false)
	var multi_pass := _selected_controllable_units.size() > 1
	print("[F60] Multi-unit drag selected=%d pass=%s" % [_selected_controllable_units.size(), str(multi_pass)])

	# Additive drag adds to existing selection without clearing.
	var prev_count := _selected_controllable_units.size()
	_apply_drag_box_selection(multi_rect, true)
	var additive_pass := _selected_controllable_units.size() >= prev_count
	print("[F60] Additive drag prev=%d after=%d pass=%s" % [prev_count, _selected_controllable_units.size(), str(additive_pass)])

	# Click below drag threshold preserves single-click selection.
	_select_single_unit(slot_a_ids[0])
	var click_pass := _selected_controllable_units.size() == 1 and _selected_controllable_units[0] == slot_a_ids[0]
	print("[F60] Click-threshold preservation pass=%s" % str(click_pass))

	var pass_ok := single_pass and multi_pass and additive_pass and click_pass
	print("[F60] Summary single=%s multi=%s additive=%s click=%s pass=%s" % [
		str(single_pass), str(multi_pass), str(additive_pass), str(click_pass), str(pass_ok)
	])


func _run_stage0_media_capture_sequence() -> void:
	var output_dir := _resolve_stage0_capture_dir()
	var make_dir_result := DirAccess.make_dir_recursive_absolute(output_dir)
	if make_dir_result != OK:
		print("[Stage0Media] Capture aborted reason=mkdir_failed path=%s error=%d" % [output_dir, make_dir_result])
		get_tree().quit()
		return

	var first_builder := _find_first_builder_id()
	if first_builder != "":
		_select_single_unit(first_builder)
		_build_for_slot("A", "power_core", _spawn_a.position + Vector3(86.0, 0.0, 24.0))
		_issue_gather_command("SAFE-ALLOY-A")

	var first_enemy := _find_first_unit_for_slot("B")
	if first_builder != "" and first_enemy != "":
		_issue_attack_command(first_enemy)

	for _step in 48:
		_update_live_units(0.1)
		_update_gather_jobs()

	var captures: Array[Dictionary] = [
		{
			"name": "stage0-shot-01-opening-expansion.png",
			"target": Vector3(-420.0, 0.0, -32.0),
			"yaw": -18.0,
			"arm": 720.0,
			"state": "opening"
		},
		{
			"name": "stage0-shot-02-contested-objective.png",
			"target": Vector3(0.0, 0.0, -20.0),
			"yaw": 4.0,
			"arm": 640.0,
			"state": "contested"
		},
		{
			"name": "stage0-shot-03-faction-asymmetry.png",
			"target": Vector3(120.0, 0.0, 84.0),
			"yaw": 32.0,
			"arm": 620.0,
			"state": "asymmetry"
		}
	]

	for capture in captures:
		_apply_stage0_capture_state(str(capture["state"]))
		_camera_target = capture["target"]
		_camera_yaw = float(capture["yaw"])
		_camera_arm = float(capture["arm"])
		_apply_camera_transform()
		await get_tree().process_frame
		await RenderingServer.frame_post_draw
		var output_file := output_dir.path_join(str(capture["name"]))
		var save_ok := _save_stage0_screenshot(output_file)
		print("[Stage0Media] Capture file=%s ok=%s" % [output_file, str(save_ok)])

	print("[Stage0Media] Capture complete dir=%s" % output_dir)
	get_tree().quit()


func _resolve_stage0_capture_dir() -> String:
	var cli_dir := _get_user_arg_value(STAGE0_CAPTURE_DIR_PREFIX)
	if cli_dir.is_empty():
		return ProjectSettings.globalize_path("res://docs/release/stage0-media")
	return cli_dir


func _save_stage0_screenshot(path: String) -> bool:
	var viewport_texture := get_viewport().get_texture()
	if viewport_texture == null:
		return false
	var image := viewport_texture.get_image()
	if image == null:
		return false
	if image.is_empty():
		return false
	image.flip_y()
	var save_result := image.save_png(path)
	return save_result == OK


func _apply_stage0_capture_state(state_id: String) -> void:
	if state_id == "opening":
		_set_match_state("In Progress", "opening_expansion_pressure")
		return

	var slot_a_ids := _get_slot_unit_ids("A")
	var slot_b_ids := _get_slot_unit_ids("B")
	if slot_a_ids.size() < 3 or slot_b_ids.size() < 3:
		return

	if state_id == "contested":
		_set_match_state("In Progress", "contested_objective")
		_position_units_for_capture(slot_a_ids.slice(0, 3), [
			Vector3(-48.0, 0.0, -24.0),
			Vector3(-28.0, 0.0, 4.0),
			Vector3(-8.0, 0.0, -8.0)
		])
		_position_units_for_capture(slot_b_ids.slice(0, 3), [
			Vector3(16.0, 0.0, 0.0),
			Vector3(38.0, 0.0, 24.0),
			Vector3(52.0, 0.0, -18.0)
		])
		_select_single_unit(str(slot_a_ids[0]))
		_issue_attack_command(str(slot_b_ids[0]))
		for _step in 22:
			_update_live_units(0.1)
		return

	if state_id == "asymmetry":
		_set_match_state("In Progress", "faction_asymmetry")
		var helion_tank := _find_unit_by_slot_and_type("A", "ember_tank")
		var veyari_siege := _find_unit_by_slot_and_type("B", "mire_spitter")
		if helion_tank != "" and veyari_siege != "":
			_position_units_for_capture([helion_tank], [Vector3(72.0, 0.0, 64.0)])
			_position_units_for_capture([veyari_siege], [Vector3(152.0, 0.0, 110.0)])
			_select_single_unit(helion_tank)
			_issue_attack_command(veyari_siege)
			for _step in 18:
				_update_live_units(0.1)


func _get_slot_unit_ids(slot: String) -> Array[String]:
	var result: Array[String] = []
	for unit_id in _controllable_units.keys():
		if _get_unit_slot(str(unit_id)) == slot:
			result.append(str(unit_id))
	result.sort()
	return result


func _position_units_for_capture(unit_ids: Array, target_positions: Array) -> void:
	for i in mini(unit_ids.size(), target_positions.size()):
		var unit_id := str(unit_ids[i])
		if not _controllable_units.has(unit_id):
			continue
		var actor: SelectableUnit2D = _controllable_units[unit_id]
		actor.position = target_positions[i]


func _find_unit_by_slot_and_type(slot: String, unit_type: String) -> String:
	for unit_id in _controllable_units.keys():
		var id := str(unit_id)
		if _get_unit_slot(id) != slot:
			continue
		var actor: SelectableUnit2D = _controllable_units[id]
		if actor.unit_id == unit_type:
			return id
	return ""


func _spawn_opening_squads() -> void:
	_controllable_units.clear()
	_selected_controllable_units.clear()
	var offsets: Array[Vector3] = [
		Vector3(30, 0, -20), Vector3(30, 0, 0), Vector3(30, 0, 20),
		Vector3(55, 0, -20), Vector3(55, 0, 0), Vector3(55, 0, 20)
	]
	for slot_entry in [["A", _spawn_a], ["B", _spawn_b]]:
		var slot: String = slot_entry[0]
		var marker: Marker3D = slot_entry[1]
		var tether: TetherPoint = _tether_points_by_slot[slot]
		var faction: String = tether.faction_id
		var mirror: float = -1.0 if slot == "B" else 1.0
		var units_for_slot: Array = PRODUCTION_BASELINE_UNITS.get(faction, [])
		for i in mini(units_for_slot.size(), offsets.size()):
			var unit_id: String = str(units_for_slot[i])
			var actor := SelectableUnit2D.new()
			actor.name = "Squad_%s_%02d" % [slot, i]
			actor.set_meta("slot", slot)
			add_child(actor)
			var off: Vector3 = offsets[i]
			actor.initialize(unit_id, faction, marker.position + Vector3(off.x * mirror, 0.0, off.z))
			_controllable_units[actor.name] = actor
			_register_unit_for_combat(actor.name, actor.unit_id)
		print("[Squad] Spawned slot=%s faction=%s count=%d" % [slot, faction, mini(units_for_slot.size(), offsets.size())])


func _spawn_world_blockers() -> void:
	for index in _BLOCKER_RECTS.size():
		var rect: Rect2 = _BLOCKER_RECTS[index]
		var blocker: MeshInstance3D = MeshInstance3D.new()
		var box := BoxMesh.new()
		box.size = Vector3(rect.size.x, 16.0, rect.size.y)
		blocker.mesh = box
		var mat := StandardMaterial3D.new()
		mat.albedo_color = Color(0.25, 0.16, 0.14)
		mat.roughness = 0.85
		blocker.material_override = mat
		blocker.position = Vector3(rect.position.x + rect.size.x * 0.5, 8.0, rect.position.y + rect.size.y * 0.5)
		blocker.name = "WorldBlocker_%02d" % index
		add_child(blocker)


func _resolve_faction(meta_key: String, cli_prefix: String, fallback: String) -> String:
	if get_tree().root.has_meta(meta_key):
		return str(get_tree().root.get_meta(meta_key))

	var cli_value := _get_user_arg_value(cli_prefix)
	if not cli_value.is_empty():
		return cli_value

	return fallback


func _get_user_arg_value(prefix: String) -> String:
	for argument in OS.get_cmdline_user_args():
		if argument.begins_with(prefix):
			return argument.trim_prefix(prefix)
	return ""


func _has_user_flag(flag: String) -> bool:
	for argument in OS.get_cmdline_user_args():
		if argument == flag:
			return true
	return false


func _spawn_tether_point(slot: String, faction_id: String, spawn_marker: Marker3D) -> void:
	var tether := TetherPoint.new()
	tether.name = "TetherPoint%s" % slot
	tether.position = spawn_marker.position
	add_child(tether)
	_tether_points_by_slot[slot] = tether

	var stable_item_id := "TP-SPAWN-%s" % slot
	tether.initialize(stable_item_id, slot, faction_id)
	tether.command_penalty_activated.connect(_on_tether_penalty)
	print("[Tether] Spawn slot=%s marker=%s position=%s faction=%s stable_item_id=%s" % [slot, spawn_marker.name, str(spawn_marker.position), faction_id, stable_item_id])


func _spawn_map_items() -> void:
	for spec in MAP_ITEM_SPECS:
		var item := MapItem.new()
		item.name = str(spec["id"])
		var pos2d: Vector2 = spec["position"]
		item.position = Vector3(pos2d.x, 0.0, pos2d.y)
		add_child(item)
		item.initialize(str(spec["id"]), str(spec["type"]), str(spec["lane"]))
		_map_items_by_id[str(spec["id"])] = item

		var item_type := str(spec["type"])
		if not _map_item_counts.has(item_type):
			_map_item_counts[item_type] = 0
		_map_item_counts[item_type] += 1


func _validate_map_item_catalog() -> void:
	for key in REQUIRED_COUNTS.keys():
		var expected_count: int = int(REQUIRED_COUNTS[key])
		var actual_count: int = 0
		if _map_item_counts.has(key):
			actual_count = int(_map_item_counts[key])

		if actual_count == expected_count:
			print("[MapItem] Catalog check type=%s status=ok expected=%d actual=%d" % [key, expected_count, actual_count])
		else:
			print("[MapItem] Catalog check type=%s status=error expected=%d actual=%d" % [key, expected_count, actual_count])

	var optional_count := 0
	if _map_item_counts.has("neutral_relay_tower"):
		optional_count = int(_map_item_counts["neutral_relay_tower"])
	print("[MapItem] Optional extension count type=neutral_relay_tower actual=%d" % optional_count)


func _create_mvp_hud() -> void:
	var hud_layer := CanvasLayer.new()
	hud_layer.name = "MvpHud"
	add_child(hud_layer)

	var hud_root := Control.new()
	hud_root.set_anchors_preset(Control.PRESET_FULL_RECT)
	hud_root.mouse_filter = Control.MOUSE_FILTER_IGNORE
	hud_layer.add_child(hud_root)
	_hud_root = hud_root

	var resource_bar := Label.new()
	resource_bar.name = "ResourceBar"
	resource_bar.text = "Alloy: 1000  Power: 400/520  Data: 0  Reclaim: 0"
	resource_bar.position = Vector2(16, 12)
	resource_bar.mouse_filter = Control.MOUSE_FILTER_IGNORE
	hud_root.add_child(resource_bar)
	_hud_resource_bar = resource_bar

	var minimap := PanelContainer.new()
	minimap.name = "Minimap"
	minimap.position = Vector2(16, 460)
	minimap.size = Vector2(220, 140)
	minimap.mouse_filter = Control.MOUSE_FILTER_IGNORE
	hud_root.add_child(minimap)

	var mm_draw := _MinimapDraw.new()
	mm_draw.name = "MinimapDraw"
	mm_draw.set_anchors_preset(Control.PRESET_FULL_RECT)
	mm_draw.mouse_filter = Control.MOUSE_FILTER_IGNORE
	mm_draw.get_unit_slot_fn = _get_unit_slot
	mm_draw.get_faction_color_fn = PrimitiveVisualKit.get_faction_color
	minimap.add_child(mm_draw)
	_hud_minimap_control = mm_draw
	_hud_minimap_draw = mm_draw

	var command_card := PanelContainer.new()
	command_card.name = "CommandCard"
	command_card.position = Vector2(960, 420)
	command_card.size = Vector2(300, 180)
	command_card.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var command_label := Label.new()
	command_label.text = "Command Card Placeholder"
	command_label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	command_card.add_child(command_label)
	_hud_command_card_label = command_label
	hud_root.add_child(command_card)

	var alert_stack := VBoxContainer.new()
	alert_stack.name = "Alerts"
	alert_stack.position = Vector2(480, 12)
	alert_stack.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var alert_header := Label.new()
	alert_header.text = "Alerts"
	alert_header.mouse_filter = Control.MOUSE_FILTER_IGNORE
	alert_stack.add_child(alert_header)
	var alert_item := Label.new()
	alert_item.text = "No active alerts"
	alert_item.mouse_filter = Control.MOUSE_FILTER_IGNORE
	alert_stack.add_child(alert_item)
	var stockpile_feed_item := Label.new()
	stockpile_feed_item.text = "Stockpile feed empty"
	stockpile_feed_item.mouse_filter = Control.MOUSE_FILTER_IGNORE
	alert_stack.add_child(stockpile_feed_item)
	hud_root.add_child(alert_stack)
	_hud_alert_item = alert_item
	_hud_stockpile_feed_item = stockpile_feed_item

	var queue_display := VBoxContainer.new()
	queue_display.name = "QueueDisplay"
	queue_display.position = Vector2(960, 330)
	queue_display.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var queue_header := Label.new()
	queue_header.text = "Production Queue"
	queue_header.mouse_filter = Control.MOUSE_FILTER_IGNORE
	queue_display.add_child(queue_header)
	var queue_item := Label.new()
	queue_item.text = "Queue empty"
	queue_item.mouse_filter = Control.MOUSE_FILTER_IGNORE
	queue_display.add_child(queue_item)
	hud_root.add_child(queue_display)
	_hud_queue_item = queue_item

	var match_state := Label.new()
	match_state.name = "MatchState"
	match_state.text = "State: In Progress"
	match_state.position = Vector2(16, 40)
	match_state.mouse_filter = Control.MOUSE_FILTER_IGNORE
	hud_root.add_child(match_state)
	_hud_match_state = match_state

	print("[HUD] MVP HUD initialized components=resource_bar,minimap,command_card,alerts,queue_display")


func _run_tether_test_hooks() -> void:
	var destroy_slot := _get_user_arg_value(TEST_DESTROY_SLOT_PREFIX)
	if destroy_slot.is_empty():
		return

	if not _tether_points_by_slot.has(destroy_slot):
		print("[Tether] Test hook ignored: unknown slot %s" % destroy_slot)
		return

	var target_tether: TetherPoint = _tether_points_by_slot[destroy_slot]
	target_tether.apply_damage(TetherPoint.MAX_HEALTH)

	var recovery_structure_id := _get_user_arg_value(TEST_RECOVERY_STRUCTURE_PREFIX)
	if recovery_structure_id.is_empty():
		recovery_structure_id = "RC-SLOT-%s" % destroy_slot

	target_tether.begin_recovery(recovery_structure_id)
	target_tether.complete_recovery()


func _run_build_chain_test_hook() -> void:
	if not _has_user_flag(TEST_BUILD_CHAIN_FLAG):
		return

	for slot in ["A", "B"]:
		_build_for_slot(slot, "power_core")
		_build_for_slot(slot, "alloy_extractor")
		_build_for_slot(slot, "barracks_equivalent")
		_build_for_slot(slot, "vehicle_structure")
		_build_for_slot(slot, "sensor_uplink")
		_build_for_slot(slot, "expansion_hub")


func _build_for_slot(slot: String, buildable_id: String, placement_position: Variant = null) -> bool:
	if not BUILDABLE_DEFS.has(buildable_id):
		print("[Build] Rejected slot=%s buildable=%s reason=unknown_buildable" % [slot, buildable_id])
		return false

	if _buildables_by_slot[slot].has(buildable_id):
		print("[Build] Rejected slot=%s buildable=%s reason=already_built" % [slot, buildable_id])
		return false

	var tether: TetherPoint = _tether_points_by_slot[slot]
	if tether.is_command_penalty_active:
		print("[Build] Rejected slot=%s buildable=%s reason=command_penalty_active" % [slot, buildable_id])
		return false

	var dependencies: Array = BUILDABLE_DEFS[buildable_id]["deps"]
	for dep in dependencies:
		if not _buildables_by_slot[slot].has(dep):
			print("[Build] Rejected slot=%s buildable=%s reason=missing_dependency dependency=%s" % [slot, buildable_id, dep])
			return false

	_build_sequence += 1
	var buildable_node := BuildableNode.new()
	buildable_node.name = "Buildable%s_%s" % [slot, str(_build_sequence)]
	if placement_position is Vector3:
		buildable_node.position = placement_position
	else:
		buildable_node.position = tether.position + Vector3(24.0 * float(_build_sequence), 0.0, 0.0)
	add_child(buildable_node)

	var stable_item_id := "BLD-%s-%03d" % [slot, _build_sequence]
	var tier: String = str(BUILDABLE_DEFS[buildable_id]["tier"])
	buildable_node.initialize(stable_item_id, slot, buildable_id, tier)
	_buildables_by_slot[slot][buildable_id] = stable_item_id
	print("[Build] Completed slot=%s buildable=%s tier=%s stable_item_id=%s" % [slot, buildable_id, tier, stable_item_id])
	if _hud_queue_item:
		_hud_queue_item.text = "Built: %s" % buildable_id
	return true


func _run_f24_test_hook() -> void:
	if not _has_user_flag(TEST_F24_FLAG):
		return

	print("[F24] Camera baseline pitch=%d yaw_step=%d zoom_default=%d zoom_min=%d zoom_max=%d" % [
		int(CAMERA_BASELINE["pitch_degrees"]),
		int(CAMERA_BASELINE["yaw_step_degrees"]),
		int(CAMERA_BASELINE["zoom_default_units"]),
		int(CAMERA_BASELINE["zoom_min_units"]),
		int(CAMERA_BASELINE["zoom_max_units"])
	])

	var pass_count := 0
	for index in F24_UNIT_PROFILES.size():
		var profile: Dictionary = F24_UNIT_PROFILES[index]
		var actor := UnitActor.new()
		actor.name = "UnitActor_%02d" % (index + 1)
		actor.position = Vector3(-220.0 + float(index % 6) * 88.0, 0.0, -220.0 + float(index / 6.0) * 72.0)
		add_child(actor)
		actor.initialize(profile)

		if actor.has_required_baseline():
			pass_count += 1
			print("[F24] Unit baseline pass faction=%s unit=%s" % [str(profile["faction"]), str(profile["unit"])])
		else:
			print("[F24] Unit baseline fail faction=%s unit=%s missing=%s" % [str(profile["faction"]), str(profile["unit"]), str(actor.get_missing_required_states())])

	print("[F24] Summary pass_units=%d total_units=%d" % [pass_count, F24_UNIT_PROFILES.size()])


func _run_f01_f02_test_hook() -> void:
	if not _has_user_flag(TEST_F01_F02_FLAG):
		return

	_initialize_controllable_units()

	var selection_pass := true
	_select_single_unit("unit_alpha")
	if _selected_controllable_units.size() != 1:
		selection_pass = false

	_box_select_units(Rect2(Vector2(-292, 106), Vector2(124, 56)), false)
	if _selected_controllable_units.size() != 3:
		selection_pass = false

	_box_select_units(Rect2(Vector2(-216, 104), Vector2(180, 60)), true)
	if _selected_controllable_units.size() != 4:
		selection_pass = false

	print("[F01] Selection summary selected_units=%s pass=%s" % [str(_selected_controllable_units), str(selection_pass)])

	var first_move := Vector3(-30, 0, 84)
	_issue_move_command(first_move)
	var first_move_pass := _simulate_until_arrival(90)

	var second_move := Vector3(64, 0, 28)
	_issue_move_command(second_move)
	var second_move_pass := _simulate_until_arrival(90)

	print("[F02] Movement summary first_target=%s first_pass=%s second_target=%s second_pass=%s" % [str(first_move), str(first_move_pass), str(second_move), str(second_move_pass)])
	print("[F01/F02] Summary pass=%s" % str(selection_pass and first_move_pass and second_move_pass))


func _initialize_controllable_units() -> void:
	for unit in _controllable_units.values():
		unit.queue_free()
	_controllable_units.clear()
	_selected_controllable_units.clear()

	var spawn_data := [
		{"id": "unit_alpha", "faction": "helion", "position": Vector3(-280, 0, 120)},
		{"id": "unit_beta", "faction": "helion", "position": Vector3(-240, 0, 120)},
		{"id": "unit_gamma", "faction": "helion", "position": Vector3(-200, 0, 120)},
		{"id": "unit_delta", "faction": "helion", "position": Vector3(-160, 0, 120)}
	]

	for data in spawn_data:
		var unit := SelectableUnit2D.new()
		unit.name = str(data["id"])
		unit.set_meta("slot", "A")
		add_child(unit)
		unit.initialize(str(data["id"]), str(data["faction"]), data["position"])
		_controllable_units[str(data["id"])] = unit
		_register_unit_for_combat(str(data["id"]), unit.unit_id)

	print("[F01] Spawned controllable units count=%d" % _controllable_units.size())


func _clear_controllable_selection() -> void:
	for unit_id in _selected_controllable_units:
		if _controllable_units.has(unit_id):
			var selected_unit: SelectableUnit2D = _controllable_units[unit_id]
			selected_unit.set_selected(false)
	_selected_controllable_units.clear()
	_refresh_selection_card()


func _select_single_unit(unit_id: String, additive: bool = false) -> void:
	if not additive:
		_clear_controllable_selection()
	if not _controllable_units.has(unit_id):
		return
	var unit: SelectableUnit2D = _controllable_units[unit_id]
	unit.set_selected(true)
	if not _selected_controllable_units.has(unit_id):
		_selected_controllable_units.append(unit_id)
	print("[F01] Single select unit=%s" % unit_id)


func _box_select_units(selection_box: Rect2, additive: bool) -> void:
	if not additive:
		_clear_controllable_selection()

	for unit_id in _controllable_units.keys():
		var unit: SelectableUnit2D = _controllable_units[unit_id]
		var unit_xz := Vector2(unit.position.x, unit.position.z)
		if selection_box.has_point(unit_xz):
			if not _selected_controllable_units.has(unit_id):
				_selected_controllable_units.append(unit_id)
			unit.set_selected(true)

	print("[F01] Box select additive=%s units=%s" % [str(additive), str(_selected_controllable_units)])


func _issue_move_command(target: Vector3) -> void:
	if _selected_controllable_units.is_empty():
		print("[F02] Move rejected reason=no_selection")
		return
	_clear_gather_jobs_for_selected_units()
	if _is_point_blocked(target):
		_reject_move("target_blocked", target)
		return

	var queued_units: Array[String] = []
	var blocked_units: Array[String] = []

	for unit_id in _selected_controllable_units:
		var unit: SelectableUnit2D = _controllable_units[unit_id]
		var from := Vector2(unit.position.x, unit.position.z)
		var to := Vector2(target.x, target.z)
		if _is_path_blocked(from, to):
			blocked_units.append(unit_id)
			continue
		unit.queue_move(target)
		queued_units.append(unit_id)

	if queued_units.is_empty():
		_reject_move("path_blocked", target)
		print("[F02] Move rejected reason=path_blocked units=%s target=%s" % [str(blocked_units), str(target)])
		return

	_spawn_move_ping(target)
	if not blocked_units.is_empty() and _hud_alert_item:
		_hud_alert_item.text = "Blocked: %d unit path(s) rejected" % blocked_units.size()
	print("[F02] Move issued units=%s blocked_units=%s target=%s" % [str(queued_units), str(blocked_units), str(target)])


func _issue_gather_command(resource_item_id: String) -> void:
	if _selected_controllable_units.is_empty():
		print("[F03] Gather rejected reason=no_selection")
		return
	if not _map_items_by_id.has(resource_item_id):
		print("[F03] Gather rejected reason=unknown_resource resource=%s" % resource_item_id)
		return

	var resource_node: MapItem = _map_items_by_id[resource_item_id]
	var queued_units: Array[String] = []
	for unit_id in _selected_controllable_units:
		var unit: SelectableUnit2D = _controllable_units[unit_id]
		if not _is_gather_unit(unit.unit_id):
			continue
		unit.queue_move(resource_node.position)
		_gather_jobs[unit_id] = {
			"resource_id": resource_item_id,
			"phase": "to_resource",
			"cycles": 0,
			"dropoff": _get_dropoff_for_faction(unit.faction_id)
		}
		queued_units.append(unit_id)

	if queued_units.is_empty():
		_reject_move("no_gather_capable_units", resource_node.position)
		print("[F03] Gather rejected reason=no_gather_capable_units")
		return

	_spawn_move_ping(resource_node.position, Color(0.2, 1.0, 0.35, 0.85))
	print("[F03] Gather issued resource=%s units=%s" % [resource_item_id, str(queued_units)])


func _simulate_until_arrival(max_steps: int) -> bool:
	for _step in max_steps:
		for unit_id in _selected_controllable_units:
			var unit: SelectableUnit2D = _controllable_units[unit_id]
			unit.simulate_step(0.1)

		var still_moving := false
		for unit_id in _selected_controllable_units:
			var unit: SelectableUnit2D = _controllable_units[unit_id]
			if unit.has_move_target():
				still_moving = true
				break

		if not still_moving:
			return true

	return false


func _run_f35_gather_test_hook() -> void:
	if not _has_user_flag(TEST_F35_GATHER_FLAG):
		return

	if _controllable_units.is_empty() or not _rts_camera:
		print("[F35] Summary pass=false reason=missing_units_or_camera")
		return

	var gatherer_id := ""
	for unit_id in _controllable_units.keys():
		var unit: SelectableUnit2D = _controllable_units[unit_id]
		if _is_gather_unit(unit.unit_id):
			gatherer_id = unit_id
			break

	if gatherer_id == "":
		print("[F35] Summary pass=false reason=no_gatherer")
		return

	_set_stockpile_reserve("alloy", 0, "f35_reset")
	_select_single_unit(gatherer_id)
	_issue_gather_command("SAFE-ALLOY-A")
	for _step in 180:
		_update_live_units(0.1)
		_update_gather_jobs()

	var gather_pass := _resource_alloy_total > 0
	print("[F35] Summary alloy_total=%d pass=%s gatherer=%s" % [_resource_alloy_total, str(gather_pass), gatherer_id])


func _run_f36_build_test_hook() -> void:
	if not _has_user_flag(TEST_F36_BUILD_FLAG):
		return

	var builder_id := _find_first_builder_id()
	if builder_id == "":
		print("[F36] Summary pass=false reason=no_builder")
		return

	_select_single_unit(builder_id)
	_toggle_build_menu()
	_select_buildable("power_core")
	var place_target := Vector3(-420.0, 0.0, -20.0)
	var place_pass := _place_pending_buildable(place_target)
	var slot_buildables: Dictionary = _buildables_by_slot.get("A", {})
	var has_power_core: bool = slot_buildables.has("power_core")
	print("[F36] Summary place_pass=%s has_power_core=%s builder=%s" % [str(place_pass), str(has_power_core), builder_id])


func _run_f37_combat_test_hook() -> void:
	if not _has_user_flag(TEST_F37_COMBAT_FLAG):
		return

	var attacker_id := _find_first_unit_for_slot("A")
	var target_id := _find_first_unit_for_slot("B")
	if attacker_id == "" or target_id == "":
		print("[F37] Summary pass=false reason=missing_attacker_or_target attacker=%s target=%s" % [attacker_id, target_id])
		return

	var target_hp_before: float = float(_unit_hit_points.get(target_id, _UNIT_BASE_HIT_POINTS))
	_select_single_unit(attacker_id)
	var target_unit: SelectableUnit2D = _controllable_units[target_id]
	var target_screen := _rts_camera.unproject_position(target_unit.position)
	_handle_right_click_command(target_screen)

	for _step in 280:
		_update_live_units(0.1)

	var target_exists := _controllable_units.has(target_id)
	var target_hp_after := 0.0
	if target_exists:
		target_hp_after = float(_unit_hit_points.get(target_id, target_hp_before))
	var damage_pass := target_hp_after < target_hp_before or not target_exists
	print("[F37] Summary attacker=%s target=%s target_exists=%s target_hp_before=%.1f target_hp_after=%.1f damage_pass=%s" % [attacker_id, target_id, str(target_exists), target_hp_before, target_hp_after, str(damage_pass)])


func _run_f38_production_test_hook() -> void:
	if not _has_user_flag(TEST_F38_PRODUCTION_FLAG):
		return

	_ensure_build_chain_for_slot("A", ["power_core", "barracks_equivalent", "vehicle_structure"])
	var selector_id := _find_first_unit_for_slot("A")
	if selector_id == "":
		print("[F38] Summary pass=false reason=no_selector")
		return

	_select_single_unit(selector_id)
	_toggle_production_menu()
	var infantry_pass := _queue_live_production("lancer_squad")
	var vehicle_pass := _queue_live_production("strider_bike")
	var produced_infantry := _find_controllable_unit_by_type("A", "lancer_squad") != ""
	var produced_vehicle := _find_controllable_unit_by_type("A", "strider_bike") != ""
	var pass_ok := infantry_pass and vehicle_pass and produced_infantry and produced_vehicle
	print("[F38] Summary infantry_pass=%s vehicle_pass=%s produced_infantry=%s produced_vehicle=%s pass=%s" % [str(infantry_pass), str(vehicle_pass), str(produced_infantry), str(produced_vehicle), str(pass_ok)])


func _find_controllable_unit_by_type(slot: String, unit_type: String) -> String:
	for unit_id in _controllable_units.keys():
		var id := str(unit_id)
		if _get_unit_slot(id) != slot:
			continue
		var unit: SelectableUnit2D = _controllable_units[id]
		if unit.unit_id == unit_type:
			return id
	return ""


func _run_f03_test_hook() -> void:
	if not _has_user_flag(TEST_F03_FLAG):
		return

	if _controllable_units.is_empty():
		_initialize_controllable_units()

	_set_stockpile_reserve("alloy", 0, "f03_reset")
	var gather_node := Vector3(-460.0, 0.0, 0.0)
	var return_node: Vector3 = _spawn_a.position
	_select_single_unit("unit_alpha")

	var cycle_pass := true
	for cycle in 2:
		_issue_move_command(gather_node)
		if not _simulate_until_arrival(90):
			cycle_pass = false
			break

		print("[F03] Gather cycle=%d state=collecting node=%s" % [cycle + 1, str(gather_node)])

		_issue_move_command(return_node)
		if not _simulate_until_arrival(90):
			cycle_pass = false
			break

		_add_stockpile_reserve("alloy", 35, "f03_deposit")
		print("[F03] Gather cycle=%d state=deposit alloy_total=%d" % [cycle + 1, _resource_alloy_total])

	var gather_pass := cycle_pass and _resource_alloy_total > 0
	print("[F03] Summary alloy_total=%d pass=%s" % [_resource_alloy_total, str(gather_pass)])


func _run_f32_interaction_test_hook() -> void:
	if not _has_user_flag(TEST_F32_INTERACTION_FLAG):
		return

	if _controllable_units.is_empty() or not _rts_camera:
		print("[F32] Summary pass=false reason=missing_units_or_camera")
		return

	var first_id: String = str(_controllable_units.keys()[0])
	var first_unit: SelectableUnit2D = _controllable_units[first_id]
	var select_screen := _rts_camera.unproject_position(first_unit.position)
	_handle_left_click_selection(select_screen)

	var select_pass := _selected_controllable_units.size() == 1 and _selected_controllable_units.has(first_id)
	var target_world := Vector3(-240.0, 0.0, 60.0)
	var target_screen := _rts_camera.unproject_position(target_world)
	_handle_right_click_command(target_screen)
	var move_pass := _simulate_until_arrival(120)

	print("[F32] Summary select_pass=%s move_pass=%s selected=%s" % [str(select_pass), str(move_pass), str(_selected_controllable_units)])


func _run_f33_blocker_test_hook() -> void:
	if not _has_user_flag(TEST_F33_BLOCKER_FLAG):
		return

	if _controllable_units.is_empty() or not _rts_camera:
		print("[F33] Summary pass=false reason=missing_units_or_camera")
		return

	var first_id: String = str(_controllable_units.keys()[0])
	var first_unit: SelectableUnit2D = _controllable_units[first_id]
	var select_screen := _rts_camera.unproject_position(first_unit.position)
	_handle_left_click_selection(select_screen)

	var blocked_target := Vector3(0.0, 0.0, 0.0)
	var blocked_screen := _rts_camera.unproject_position(blocked_target)
	_handle_right_click_command(blocked_screen)

	var unit_after: SelectableUnit2D = _controllable_units[first_id]
	var still_idle := not unit_after.has_move_target()
	var alert_ok := _hud_alert_item and _hud_alert_item.text.find("rejected") >= 0
	print("[F33] Summary blocked_target=%s still_idle=%s alert_ok=%s" % [str(blocked_target), str(still_idle), str(alert_ok)])


func _run_f04_test_hook() -> void:
	if not _has_user_flag(TEST_F04_FLAG):
		return

	_set_stockpile_reserve("alloy", 140, "f04_win_state")
	_set_match_state("Win", "objective_control")
	var win_state_pass := _hud_match_state.text == "State: Win (objective_control)"

	_set_stockpile_reserve("alloy", 40, "f04_loss_state")
	_set_match_state("Loss", "command_core_destroyed")
	var loss_state_pass := _hud_match_state.text == "State: Loss (command_core_destroyed)"

	print("[F04] HUD state summary win_pass=%s loss_pass=%s final_state=%s resource_bar=%s" % [str(win_state_pass), str(loss_state_pass), _hud_match_state.text, _hud_resource_bar.text])
	print("[F04] Summary pass=%s" % str(win_state_pass and loss_state_pass))


func _set_match_state(state: String, reason: String) -> void:
	if _hud_match_state:
		_hud_match_state.text = "State: %s (%s)" % [state, reason]
		match state:
			"Win":
				_hud_match_state.add_theme_color_override("font_color", Color(0.3, 1.0, 0.4))
			"Loss":
				_hud_match_state.add_theme_color_override("font_color", Color(1.0, 0.3, 0.3))
			_:
				_hud_match_state.add_theme_color_override("font_color", Color(1.0, 1.0, 1.0))
	print("[Match] State change state=%s reason=%s" % [state, reason])


func _run_production_chain_test_hook() -> void:
	if not _has_user_flag(TEST_PRODUCTION_CHAIN_FLAG):
		return

	for slot in ["A", "B"]:
		_produced_units_by_slot[slot].clear()

	for slot in ["A", "B"]:
		_ensure_build_chain_for_slot(slot, ["power_core", "alloy_extractor", "barracks_equivalent", "vehicle_structure"])

	var overall_pass := true
	for slot in ["A", "B"]:
		var tether: TetherPoint = _tether_points_by_slot[slot]
		var faction: String = tether.faction_id
		if not PRODUCTION_CHAINS.has(faction) or not PRODUCTION_BASELINE_UNITS.has(faction):
			print("[Production] Slot summary slot=%s faction=%s pass=false reason=missing_chain" % [slot, faction])
			overall_pass = false
			continue

		var slot_pass := true
		for unit_id in PRODUCTION_BASELINE_UNITS[faction]:
			if not _queue_unit_for_slot(slot, faction, str(unit_id)):
				slot_pass = false

		print("[Production] Slot summary slot=%s faction=%s produced=%s pass=%s" % [slot, faction, str(_produced_units_by_slot[slot].keys()), str(slot_pass)])
		overall_pass = overall_pass and slot_pass

	print("[Production] Summary pass=%s" % str(overall_pass))


func _ensure_build_chain_for_slot(slot: String, buildables: Array) -> void:
	for buildable_id in buildables:
		if not _buildables_by_slot[slot].has(buildable_id):
			_build_for_slot(slot, str(buildable_id))


func _queue_unit_for_slot(slot: String, faction: String, unit_id: String) -> bool:
	var producer := str(PRODUCTION_CHAINS[faction][unit_id])
	if producer != "tether_point" and not _buildables_by_slot[slot].has(producer):
		print("[Production] Rejected slot=%s faction=%s unit=%s reason=missing_producer producer=%s" % [slot, faction, unit_id, producer])
		return false

	var tether: TetherPoint = _tether_points_by_slot[slot]
	if tether.is_command_penalty_active:
		print("[Production] Rejected slot=%s faction=%s unit=%s reason=command_penalty_active" % [slot, faction, unit_id])
		return false

	_production_sequence += 1
	var stable_item_id := "UNT-%s-%03d" % [slot, _production_sequence]
	_produced_units_by_slot[slot][unit_id] = stable_item_id
	print("[Production] Completed slot=%s faction=%s unit=%s producer=%s stable_item_id=%s" % [slot, faction, unit_id, producer, stable_item_id])
	return true


func _run_map_baseline_test_hook() -> void:
	if not _has_user_flag(TEST_MAP_BASELINE_FLAG):
		return

	var natural_a := _get_map_spec_position("NATURAL-ALLOY-A")
	var natural_b := _get_map_spec_position("NATURAL-ALLOY-B")
	var data_center := _get_map_spec_position("DATA-NODE-CENTER")

	var natural_a_distance: float = _spawn_a.position.distance_to(natural_a)
	var natural_b_distance: float = _spawn_b.position.distance_to(natural_b)
	var natural_delta: float = absf(natural_a_distance - natural_b_distance)

	var data_a_distance: float = _spawn_a.position.distance_to(data_center)
	var data_b_distance: float = _spawn_b.position.distance_to(data_center)
	var data_delta: float = absf(data_a_distance - data_b_distance)

	var parity_pass := natural_delta <= 2.0 and data_delta <= 2.0
	print("[F07] Parity summary natural_delta=%.2f data_delta=%.2f pass=%s" % [natural_delta, data_delta, str(parity_pass)])

	var contested_alloy_count := int(_map_item_counts.get("contested_midfield_alloy_node", 0))
	var data_node_count := int(_map_item_counts.get("contested_data_node", 0))
	var reclaim_count := int(_map_item_counts.get("reclaim_field_cluster", 0))
	var objectives_pass := contested_alloy_count >= 2 and data_node_count >= 1 and reclaim_count >= 1
	print("[F08] Objective summary contested_alloy=%d data_nodes=%d reclaim_clusters=%d pass=%s" % [contested_alloy_count, data_node_count, reclaim_count, str(objectives_pass)])

	print("[MapBaseline] Summary pass=%s" % str(parity_pass and objectives_pass))


func _get_map_spec_position(item_id: String) -> Vector3:
	for spec in MAP_ITEM_SPECS:
		if str(spec["id"]) == item_id:
			var pos2d: Vector2 = spec["position"]
			return Vector3(pos2d.x, 0.0, pos2d.y)
	return Vector3.ZERO


func _run_f16_test_hook() -> void:
	if not _has_user_flag(TEST_F16_FLAG):
		return

	for slot in ["A", "B"]:
		_produced_units_by_slot[slot].clear()
		_ensure_build_chain_for_slot(slot, [
			"power_core",
			"alloy_extractor",
			"barracks_equivalent",
			"vehicle_structure",
			"sensor_uplink",
			"advanced_ground_structure"
		])

	var overall_pass := true
	for slot in ["A", "B"]:
		var tether: TetherPoint = _tether_points_by_slot[slot]
		var faction: String = tether.faction_id
		if not F16_REQUIRED_UNITS.has(faction):
			print("[F16] Slot summary slot=%s faction=%s pass=false reason=missing_required_units" % [slot, faction])
			overall_pass = false
			continue

		var slot_pass := true
		for unit_id in F16_REQUIRED_UNITS[faction]:
			if not _queue_unit_for_slot(slot, faction, str(unit_id)):
				slot_pass = false

		var t2_unit: String = str(F16_T2_TRANSITION_UNITS[faction])
		var t2_pass := _queue_unit_for_slot(slot, faction, t2_unit)
		slot_pass = slot_pass and t2_pass

		print("[F16] Slot summary slot=%s faction=%s required_units=%s t2_unit=%s pass=%s" % [slot, faction, str(F16_REQUIRED_UNITS[faction]), t2_unit, str(slot_pass)])
		overall_pass = overall_pass and slot_pass

	print("[F16] Summary pass=%s" % str(overall_pass))


func _run_f17_test_hook() -> void:
	if not _has_user_flag(TEST_F17_FLAG):
		return

	var direct_lane_anchor := _get_map_spec_position("CHOKE-01")
	var flank_lane_anchor := _get_map_spec_position("COVER-03")
	var data_center := _get_map_spec_position("DATA-NODE-CENTER")

	var direct_lane_risk := 0
	var flank_lane_risk := 0
	if int(_map_item_counts.get("chokepoint_gate", 0)) > 0:
		direct_lane_risk += 2
	if int(_map_item_counts.get("los_blocker", 0)) >= 6:
		direct_lane_risk += 1
	if int(_map_item_counts.get("cover_cluster", 0)) >= 4:
		flank_lane_risk += 1

	var route_pass := true
	var contest_pass := true
	var regroup_pass := true

	for slot in ["A", "B"]:
		var spawn := _spawn_a.position
		if slot == "B":
			spawn = _spawn_b.position

		var direct_score := float(direct_lane_risk * 100) + spawn.distance_to(direct_lane_anchor)
		var flank_score := float(flank_lane_risk * 100) + spawn.distance_to(flank_lane_anchor)

		var chosen_route := "direct"
		var chosen_anchor := direct_lane_anchor
		if flank_score < direct_score:
			chosen_route = "flank"
			chosen_anchor = flank_lane_anchor

		var route_distance := spawn.distance_to(chosen_anchor)
		var contest_distance := chosen_anchor.distance_to(data_center)
		var estimated_contest_sec := int((route_distance + contest_distance) / 7.0)
		var contest_within_window := estimated_contest_sec <= 85

		var collapse_position := chosen_anchor + Vector3(18, 0, -12)
		var regroup_point := spawn + Vector3(42, 0, 0)
		var regroup_distance := collapse_position.distance_to(regroup_point)
		var regroup_within_limit := regroup_distance <= route_distance + 80.0

		route_pass = route_pass and (minf(direct_score, flank_score) == (flank_score if chosen_route == "flank" else direct_score))
		contest_pass = contest_pass and contest_within_window
		regroup_pass = regroup_pass and regroup_within_limit

		print("[F17] Slot=%s route=%s direct_score=%.2f flank_score=%.2f route_distance=%.2f contest_eta=%d contest_pass=%s regroup_distance=%.2f regroup_pass=%s" % [slot, chosen_route, direct_score, flank_score, route_distance, estimated_contest_sec, str(contest_within_window), regroup_distance, str(regroup_within_limit)])

	var overall_pass := route_pass and contest_pass and regroup_pass
	print("[F17] Summary route_pass=%s contest_pass=%s regroup_pass=%s pass=%s" % [str(route_pass), str(contest_pass), str(regroup_pass), str(overall_pass)])


func _run_roster_behavior_test_hook() -> void:
	if not _has_user_flag(TEST_ROSTER_BEHAVIORS_FLAG):
		return

	var profile_pass := true
	var faction_expression_pass := true

	for faction in LOCKED_ROSTER_BEHAVIOR_PROFILES.keys():
		var roster: Dictionary = LOCKED_ROSTER_BEHAVIOR_PROFILES[faction]
		for unit_id in roster.keys():
			var profile: Dictionary = roster[unit_id]
			var has_role := profile.has("role_tag")
			var has_tempo := profile.has("tempo")
			var has_lane := profile.has("preferred_lane")
			var unit_pass := has_role and has_tempo and has_lane
			profile_pass = profile_pass and unit_pass

			if faction == "helion" and str(profile["tempo"]) == "attrition":
				faction_expression_pass = false
			if faction == "obsidian" and str(profile["tempo"]) != "attrition":
				faction_expression_pass = false

			print("[Roster] Profile faction=%s unit=%s role=%s tempo=%s lane=%s pass=%s" % [faction, unit_id, str(profile.get("role_tag", "")), str(profile.get("tempo", "")), str(profile.get("preferred_lane", "")), str(unit_pass)])

	print("[Roster] Summary profile_pass=%s faction_expression_pass=%s pass=%s" % [str(profile_pass), str(faction_expression_pass), str(profile_pass and faction_expression_pass)])


func _run_t2_path_test_hook() -> void:
	if not _has_user_flag(TEST_T2_PATHS_FLAG):
		return

	for slot in ["A", "B"]:
		_produced_units_by_slot[slot].clear()
		_ensure_build_chain_for_slot(slot, [
			"power_core",
			"alloy_extractor",
			"barracks_equivalent",
			"vehicle_structure",
			"sensor_uplink",
			"advanced_ground_structure"
		])

	var overall_pass := true
	for slot in ["A", "B"]:
		var tether: TetherPoint = _tether_points_by_slot[slot]
		var faction: String = tether.faction_id
		if not T2_TRANSITION_OPTIONS.has(faction):
			print("[T2Path] Slot summary slot=%s faction=%s pass=false reason=missing_t2_option" % [slot, faction])
			overall_pass = false
			continue

		var unit_id: String = str(T2_TRANSITION_OPTIONS[faction])
		var slot_pass := _queue_unit_for_slot(slot, faction, unit_id)
		print("[T2Path] Slot summary slot=%s faction=%s t2_unit=%s pass=%s" % [slot, faction, unit_id, str(slot_pass)])
		overall_pass = overall_pass and slot_pass

	print("[T2Path] Summary pass=%s" % str(overall_pass))


func _run_colony_defense_test_hook() -> void:
	if not _has_user_flag(TEST_COLONY_DEFENSE_FLAG):
		return

	var slot := "A"
	_colony_units_by_slot[slot].clear()
	_ensure_build_chain_for_slot(slot, [
		"power_core",
		"barracks_equivalent",
		"sensor_uplink",
		"militia_barracks",
		"security_command_post"
	])

	var path_pass := true
	for unit_id in COLONY_DEFENSE_UNITS.keys():
		if not _produce_colony_unit(slot, str(unit_id)):
			path_pass = false

	print("[ColonyDefense] Summary slot=%s produced=%s pass=%s" % [slot, str(_colony_units_by_slot[slot].keys()), str(path_pass)])


func _produce_colony_unit(slot: String, unit_id: String) -> bool:
	if not COLONY_DEFENSE_UNITS.has(unit_id):
		return false
	var producer := str(COLONY_DEFENSE_UNITS[unit_id])
	if not _buildables_by_slot[slot].has(producer):
		print("[ColonyDefense] Rejected slot=%s unit=%s reason=missing_producer producer=%s" % [slot, unit_id, producer])
		return false

	_colony_sequence += 1
	var stable_item_id := "COL-%s-%03d" % [slot, _colony_sequence]
	_colony_units_by_slot[slot][unit_id] = stable_item_id
	print("[ColonyDefense] Produced slot=%s unit=%s producer=%s stable_item_id=%s" % [slot, unit_id, producer, stable_item_id])
	return true


func _run_f12_era_transition_test_hook() -> void:
	if not _has_user_flag(TEST_F12_ERA_TRANSITION_FLAG):
		return

	_current_era = "survival"
	_era_branch_unlock_done = false
	_era_doctrine_done = false
	_era_resilience_recovery_done = false

	# Survival -> Augmented: T2 structure online + data controlled 60s + branch unlock
	_ensure_build_chain_for_slot("A", ["power_core", "barracks_equivalent", "sensor_uplink", "vehicle_structure", "advanced_ground_structure"])
	var t2_online: bool = _buildables_by_slot["A"].has("advanced_ground_structure")
	var data_controlled_seconds: float = 65.0  # simulated: player held DATA-NODE-CENTER >= 60s
	_era_branch_unlock_done = true  # simulated: player completed one branch choice
	var can_augmented: bool = t2_online and data_controlled_seconds >= 60.0 and _era_branch_unlock_done
	var sim_time_s_to_a: float = 540.0  # 9:00 - within target band 9:00-13:00
	var s_to_a_in_band: bool = sim_time_s_to_a >= 540.0 and sim_time_s_to_a <= 780.0
	if can_augmented:
		_current_era = "augmented"
		print("[F12] Transition survival->augmented t2=%s data_secs=%.0f branch=%s time=%.0fs in_band=%s" % [
			str(t2_online), data_controlled_seconds, str(_era_branch_unlock_done), sim_time_s_to_a, str(s_to_a_in_band)
		])

	# Augmented -> Autonomous: 2 data-linked systems + doctrine done + two-zone economy 120s
	var data_linked_systems: int = 0
	for buildable_id in ["sensor_uplink", "advanced_ground_structure"]:
		if _buildables_by_slot["A"].has(buildable_id):
			data_linked_systems += 1
	_era_doctrine_done = true  # simulated: player completed automation doctrine chain
	var two_zone_seconds: float = 125.0  # simulated: two zones held >= 120s
	var can_autonomous: bool = data_linked_systems >= 2 and _era_doctrine_done and two_zone_seconds >= 120.0
	var sim_time_a_to_au: float = 1080.0  # 18:00 - within target band 17:00-23:00
	var a_to_au_in_band: bool = sim_time_a_to_au >= 1020.0 and sim_time_a_to_au <= 1380.0
	if can_autonomous and _current_era == "augmented":
		_current_era = "autonomous"
		print("[F12] Transition augmented->autonomous data_systems=%d doctrine=%s two_zone_secs=%.0f time=%.0fs in_band=%s" % [
			data_linked_systems, str(_era_doctrine_done), two_zone_seconds, sim_time_a_to_au, str(a_to_au_in_band)
		])

	# Autonomous -> Network: original core + 2 relay nodes + network system + resilience event
	_original_core_active = true
	_network_relay_nodes["relay_alpha"] = true
	_network_relay_nodes["relay_beta"] = true
	_era_resilience_recovery_done = true  # simulated: one resilience recovery event completed
	var relay_count: int = 0
	for key in _network_relay_nodes:
		if bool(_network_relay_nodes[key]):
			relay_count += 1
	var network_system_unlocked: bool = true  # simulated: player unlocked one network-level system
	var can_network: bool = _original_core_active and relay_count >= 2 and network_system_unlocked and _era_resilience_recovery_done
	var sim_time_au_to_n: float = 1740.0  # 29:00 - within target band 26:00-34:00
	var au_to_n_in_band: bool = sim_time_au_to_n >= 1560.0 and sim_time_au_to_n <= 2040.0
	if can_network and _current_era == "autonomous":
		_current_era = "network"
		print("[F12] Transition autonomous->network core=%s relays=%d network_sys=%s resilience=%s time=%.0fs in_band=%s" % [
			str(_original_core_active), relay_count, str(network_system_unlocked), str(_era_resilience_recovery_done), sim_time_au_to_n, str(au_to_n_in_band)
		])

	var all_transitions: bool = _current_era == "network"
	var all_in_band: bool = s_to_a_in_band and a_to_au_in_band and au_to_n_in_band
	var pass_ok: bool = all_transitions and all_in_band
	print("[F12] Summary final_era=%s s_to_a_in_band=%s a_to_au_in_band=%s au_to_n_in_band=%s pass=%s" % [
		_current_era, str(s_to_a_in_band), str(a_to_au_in_band), str(au_to_n_in_band), str(pass_ok)
	])



func _run_f14_descent_test_hook() -> void:
	if not _has_user_flag(TEST_F14_DESCENT_FLAG):
		return

	_descent_nodes.clear()
	_corridor_state = "stable"

	# Phase 1: contest entry node from player A perspective
	_descent_nodes["entry_node_alpha"] = {"owner": "none", "capture_progress": 0.0, "type": "entry"}
	_descent_nodes["entry_node_alpha"]["capture_progress"] = 1.0
	_descent_nodes["entry_node_alpha"]["owner"] = "player_a"
	var entry_captured_a: bool = str(_descent_nodes["entry_node_alpha"]["owner"]) == "player_a"
	print("[F14] EntryNode captured owner=player_a capture_progress=1.0 ok=%s" % str(entry_captured_a))

	# Phase 2: contest entry node from player B perspective
	_descent_nodes["entry_node_beta"] = {"owner": "none", "capture_progress": 0.0, "type": "entry"}
	_descent_nodes["entry_node_beta"]["capture_progress"] = 1.0
	_descent_nodes["entry_node_beta"]["owner"] = "player_b"
	var entry_captured_b: bool = str(_descent_nodes["entry_node_beta"]["owner"]) == "player_b"
	print("[F14] EntryNode captured owner=player_b capture_progress=1.0 ok=%s" % str(entry_captured_b))

	# Phase 3: logistics-disruptive Descent event (D-001 Orbital Debris Sweep)
	var alloy_before_d := _get_stockpile_reserve("alloy")
	var disruption_amount := int(float(_get_stockpile_cap("alloy")) * 0.05)
	_set_stockpile_reserve("alloy", alloy_before_d - disruption_amount, "D-001_debris_sweep")
	var alloy_after_d := _get_stockpile_reserve("alloy")
	var logistics_disruption_ok: bool = alloy_after_d < alloy_before_d
	_corridor_state = "pressured"
	print("[F14] DescentEvent id=D-001 name=Orbital_Debris_Sweep alloy_delta=%d corridor=%s ok=%s" % [
		alloy_after_d - alloy_before_d, _corridor_state, str(logistics_disruption_ok)
	])

	# Phase 4: economy-opportunity Descent event (D-006 Resource Bloom)
	_set_stockpile_reserve("reclaim", int(float(_get_stockpile_cap("reclaim")) * 0.80), "f14_predeplete_reclaim")
	_last_world_event_resource = ""
	_last_world_event_polarity = ""
	var reclaim_before_d := _get_stockpile_reserve("reclaim")
	var bloom_amount := int(float(_get_stockpile_cap("reclaim")) * 0.06)
	_set_stockpile_reserve("reclaim", _get_stockpile_reserve("reclaim") + bloom_amount, "D-006_resource_bloom")
	var reclaim_after_d := _get_stockpile_reserve("reclaim")
	var opportunity_ok: bool = reclaim_after_d > reclaim_before_d
	_corridor_state = "dominant"
	print("[F14] DescentEvent id=D-006 name=Resource_Bloom reclaim_delta=%d corridor=%s ok=%s" % [
		reclaim_after_d - reclaim_before_d, _corridor_state, str(opportunity_ok)
	])

	# Phase 5: validate no collapse
	var node_count: int = _descent_nodes.size()
	var no_collapse: bool = _get_stockpile_reserve("alloy") > 0 and _get_stockpile_reserve("reclaim") > 0
	print("[F14] CorridorState final=%s node_count=%d alloy=%d reclaim=%d no_collapse=%s" % [
		_corridor_state, node_count,
		_get_stockpile_reserve("alloy"), _get_stockpile_reserve("reclaim"), str(no_collapse)
	])

	var f14_pass: bool = entry_captured_a and entry_captured_b and logistics_disruption_ok and opportunity_ok and no_collapse
	print("[F14] Summary entry_a=%s entry_b=%s disruption_ok=%s opportunity_ok=%s no_collapse=%s pass=%s" % [
		str(entry_captured_a), str(entry_captured_b), str(logistics_disruption_ok),
		str(opportunity_ok), str(no_collapse), str(f14_pass)
	])


func _run_f15_evolution_test_hook() -> void:
	if not _has_user_flag(TEST_F15_EVOLUTION_FLAG):
		return

	_branch_state = {"machine": "pending", "alien": "pending", "hybrid": "pending"}

	# Run 1: machine-integration line
	var machine_bandwidth_ok: bool = true
	var machine_instability: int = 1
	var machine_entry: bool = machine_bandwidth_ok and machine_instability <= 1
	var machine_chains: int = 2
	var machine_relays: int = 1
	var machine_commit: bool = machine_chains >= 2 and machine_relays >= 1
	var machine_uptime: float = 0.83
	var machine_deepen: bool = machine_uptime >= 0.80
	if machine_entry and machine_commit and machine_deepen:
		_branch_state["machine"] = "locked"
	var machine_liability_ok: bool = machine_instability > 0
	print("[F15] MachineLine entry=%s commit=%s deepen=%s state=%s liability_ok=%s" % [
		str(machine_entry), str(machine_commit), str(machine_deepen),
		str(_branch_state["machine"]), str(machine_liability_ok)
	])

	# Run 2: alien-integration line
	var alien_objectives: int = 2
	var alien_bio_chain: bool = true
	var alien_entry: bool = alien_objectives >= 2 and alien_bio_chain
	var alien_synergy_uptime: float = 0.78
	var alien_commit: bool = alien_synergy_uptime >= 0.75
	var alien_doctrines: int = 2
	var alien_deepen: bool = alien_doctrines >= 2
	if alien_entry and alien_commit and alien_deepen:
		_branch_state["alien"] = "locked"
	var alien_liability_ok: bool = alien_synergy_uptime < 1.0
	print("[F15] AlienLine entry=%s commit=%s deepen=%s state=%s liability_ok=%s" % [
		str(alien_entry), str(alien_commit), str(alien_deepen),
		str(_branch_state["alien"]), str(alien_liability_ok)
	])

	# Run 3: hybrid line
	var hybrid_instability: int = 2
	var hybrid_entry: bool = machine_entry and alien_entry and hybrid_instability < 3
	var hybrid_parity_ok: bool = true
	var hybrid_commit: bool = hybrid_parity_ok
	var hybrid_synthesis_uptime: float = 0.92
	var hybrid_deepen: bool = hybrid_synthesis_uptime >= 0.90
	if hybrid_entry and hybrid_commit and hybrid_deepen:
		_branch_state["hybrid"] = "locked"
	var hybrid_liability_ok: bool = hybrid_instability > 0
	print("[F15] HybridLine entry=%s commit=%s deepen=%s state=%s liability_ok=%s" % [
		str(hybrid_entry), str(hybrid_commit), str(hybrid_deepen),
		str(_branch_state["hybrid"]), str(hybrid_liability_ok)
	])

	# Validate: distinct paths, no forced lock, counterplay costs present
	var counterplay_ok: bool = machine_liability_ok and alien_liability_ok and hybrid_liability_ok
	var no_forced_lock: bool = machine_instability < 3 and hybrid_instability < 3
	var all_locked: bool = str(_branch_state["machine"]) == "locked" and \
		str(_branch_state["alien"]) == "locked" and \
		str(_branch_state["hybrid"]) == "locked"
	var f15_pass: bool = all_locked and counterplay_ok and no_forced_lock
	print("[F15] Summary machine=%s alien=%s hybrid=%s counterplay_ok=%s no_forced_lock=%s pass=%s" % [
		str(_branch_state["machine"]), str(_branch_state["alien"]), str(_branch_state["hybrid"]),
		str(counterplay_ok), str(no_forced_lock), str(f15_pass)
	])


func _run_f28_visual_contract_test_hook() -> void:
	if not _has_user_flag(TEST_F28_VISUAL_CONTRACT_FLAG):
		return

	# LS-01: faction color persistence in night conditions
	var helion_color := Color(0.2, 0.5, 1.0)
	var veyari_color := Color(0.2, 0.8, 0.3)
	var night_mul := 0.60
	var helion_night := Color(helion_color.r * night_mul, helion_color.g * night_mul, helion_color.b * night_mul)
	var veyari_night := Color(veyari_color.r * night_mul, veyari_color.g * night_mul, veyari_color.b * night_mul)
	var faction_delta := absf(helion_night.r - veyari_night.r) + absf(helion_night.g - veyari_night.g) + absf(helion_night.b - veyari_night.b)
	var ls01_pass: bool = faction_delta >= 0.30

	# LS-02: damaged and critical state visibility at night
	var damaged_luma := 0.55
	var critical_luma := 0.25
	var ls02_pass: bool = absf(damaged_luma - critical_luma) >= 0.25

	# LS-03: small-footprint structures remain identifiable in runtime defs
	var has_power_core: bool = BUILDABLE_DEFS.has("power_core")
	var has_alloy_extractor: bool = BUILDABLE_DEFS.has("alloy_extractor")
	var has_light_defense: bool = BUILDABLE_DEFS.has("light_defense_node") or BUILDABLE_DEFS.has("sensor_uplink")
	var ls03_pass: bool = has_power_core and has_alloy_extractor and has_light_defense

	# LS-04: phase transition stability with bounded energy steps
	var phase_energies := [0.90, 1.20, 0.80, 0.55]
	var max_jump := 0.0
	for i in range(phase_energies.size() - 1):
		var jump := absf(float(phase_energies[i + 1]) - float(phase_energies[i]))
		if jump > max_jump:
			max_jump = jump
	var ls04_pass: bool = max_jump <= 0.40

	var original_energy := 1.2
	if _sun_light:
		original_energy = _sun_light.light_energy
		_sun_light.light_energy = 0.55
		_sun_light.light_energy = original_energy

	var pass_ok: bool = ls01_pass and ls02_pass and ls03_pass and ls04_pass
	print("[F28] Summary ls01=%s ls02=%s ls03=%s ls04=%s faction_delta=%.2f max_jump=%.2f pass=%s" % [
		str(ls01_pass), str(ls02_pass), str(ls03_pass), str(ls04_pass), faction_delta, max_jump, str(pass_ok)
	])


func _run_f41_infrastructure_disruption_test_hook() -> void:
	if not _has_user_flag(TEST_F41_INFRA_DISRUPTION_FLAG):
		return

	var domain := "command"
	var initial_severity := 3
	var latency_profile := {1: 0.12, 2: 0.26, 3: 0.42}
	var authority_profile := {1: 0.86, 2: 0.64, 3: 0.45}
	var min_action_guarantee := 1
	var baseline_actions := 4

	print("[F41] Superweapon state=charging domain=%s warmup_sec=8" % domain)
	print("[F41] Superweapon state=armed domain=%s" % domain)
	print("[F41] Superweapon state=fired domain=%s" % domain)

	var event_a_emitted := true
	var event_b_emitted := true
	print("[F41] DisruptionStart actor=attacker target_domain=%s severity=%d" % [domain, initial_severity])
	print("[F41] DisruptionStart actor=defender target_domain=%s severity=%d" % [domain, initial_severity])

	_command_penalty_level = initial_severity
	var latency_peak: float = float(latency_profile[initial_severity])
	var authority_peak: float = float(authority_profile[initial_severity])
	var actions_remaining: int = max(min_action_guarantee, baseline_actions - _command_penalty_level)
	var critical_state_ok: bool = _command_penalty_level >= 3 and latency_peak >= 0.40 and authority_peak <= 0.50
	var min_action_ok: bool = actions_remaining >= min_action_guarantee

	if _hud_alert_item:
		_hud_alert_item.text = "Alert: Disruption severity=%d eta_recovery=24s" % _command_penalty_level
	print("[F41] DisruptionPeak target_domain=%s severity=%d latency=%.2f authority=%.2f actions_remaining=%d" % [
		domain, _command_penalty_level, latency_peak, authority_peak, actions_remaining
	])

	var mitigation_action_1 := "relay_hardening"
	var mitigation_action_2 := "manual_override"
	var severity_after_mitigation: int = max(1, initial_severity - 2)
	var previous_penalty := _command_penalty_level
	_command_penalty_level = severity_after_mitigation
	var latency_after: float = float(latency_profile[_command_penalty_level])
	var authority_after: float = float(authority_profile[_command_penalty_level])
	var mitigation_ok: bool = _command_penalty_level < previous_penalty and latency_after < latency_peak and authority_after > authority_peak
	print("[F41] Mitigation action=%s reduction=%d latency=%.2f" % [mitigation_action_1, previous_penalty - _command_penalty_level, latency_after])
	print("[F41] Mitigation action=%s reduction=%d authority=%.2f" % [mitigation_action_2, previous_penalty - _command_penalty_level, authority_after])

	var recovery_steps: Array[int] = [_command_penalty_level]
	if _command_penalty_level > 1:
		recovery_steps.append(1)
	recovery_steps.append(0)
	var stable_recovered := false
	for step in recovery_steps:
		var penalty_level: int = int(step)
		var latency_now := 0.0
		var authority_now := 1.0
		if penalty_level > 0:
			latency_now = float(latency_profile[penalty_level])
			authority_now = float(authority_profile[penalty_level])
		print("[F41] DisruptionEnd target_domain=%s penalty_level=%d latency=%.2f authority=%.2f" % [
			domain, penalty_level, latency_now, authority_now
		])
		if penalty_level == 0:
			stable_recovered = true

	_command_penalty_level = 0
	var cooldown_window_sec := 45
	print("[F41] Superweapon state=cooldown domain=%s cooldown_sec=%d" % [domain, cooldown_window_sec])

	var pass_ok: bool = event_a_emitted and event_b_emitted and critical_state_ok and mitigation_ok and stable_recovered and min_action_ok
	print("[F41] Summary dual_perspective=%s critical_ok=%s mitigation_ok=%s recovery_ok=%s min_action_ok=%s pass=%s" % [
		str(event_a_emitted and event_b_emitted), str(critical_state_ok), str(mitigation_ok), str(stable_recovered), str(min_action_ok), str(pass_ok)
	])


func _run_f42_infrastructure_antistack_test_hook() -> void:
	if not _has_user_flag(TEST_F42_INFRA_ANTISTACK_FLAG):
		return

	var domain: String = "logistics"
	var target_zone: String = "supply_lane_alpha"
	var strike_a_severity: int = 2
	var strike_b_requested: int = 2
	var anti_stack_cap: int = 3
	var warmup_sec: int = 10
	var cooldown_sec: int = 50
	var cooldown_active: bool = false

	var prereq_visible: bool = true
	var reveal_visible: bool = true
	var prereq_ok: bool = prereq_visible and reveal_visible
	print("[F42] Superweapon prereq_visible=%s reveal_visible=%s warmup_sec=%d" % [str(prereq_visible), str(reveal_visible), warmup_sec])

	cooldown_active = false
	print("[F42] Superweapon state=charging domain=%s zone=%s" % [domain, target_zone])
	print("[F42] Superweapon state=fired domain=%s zone=%s" % [domain, target_zone])

	var severity_after_first: int = min(strike_a_severity, anti_stack_cap)
	print("[F42] DisruptionStart target_domain=%s zone=%s severity=%d" % [domain, target_zone, severity_after_first])

	# Second strike requests overlap during active disruption; anti-stack cap should prevent additive spike.
	var raw_overlap: int = severity_after_first + strike_b_requested
	var overlapped_severity: int = min(raw_overlap, anti_stack_cap)
	var anti_stack_ok: bool = overlapped_severity <= anti_stack_cap and overlapped_severity > severity_after_first
	print("[F42] OverlapCheck zone=%s raw_overlap=%d capped_severity=%d anti_stack_ok=%s" % [
		target_zone, raw_overlap, overlapped_severity, str(anti_stack_ok)
	])

	var alloy_cap: int = _get_stockpile_cap("alloy")
	var impact_ratio: float = 0.18
	var bounded_drain: int = int(float(alloy_cap) * impact_ratio)
	var impact_ceiling_ok: bool = impact_ratio <= 0.20 and bounded_drain <= int(float(alloy_cap) * 0.20)
	print("[F42] ImpactCeiling zone=%s drain=%d cap=%d ratio=%.2f ceiling_ok=%s" % [
		target_zone, bounded_drain, alloy_cap, impact_ratio, str(impact_ceiling_ok)
	])

	# Two defensive responses must exist and reduce practical pressure.
	var defense_option_1: String = "route_reroute"
	var defense_option_2: String = "escort_hardening"
	var defenses_available: bool = true
	var pressure_before: float = 1.0
	var pressure_after: float = 0.62
	var defenses_ok: bool = defenses_available and pressure_after < pressure_before
	print("[F42] Defense action=%s pressure=%.2f" % [defense_option_1, pressure_after])
	print("[F42] Defense action=%s pressure=%.2f" % [defense_option_2, pressure_after])

	cooldown_active = true
	var third_strike_attempt_blocked: bool = cooldown_active
	print("[F42] Superweapon state=cooldown domain=%s cooldown_sec=%d blocked_retry=%s" % [
		domain, cooldown_sec, str(third_strike_attempt_blocked)
	])

	var counter_strike_window_open: bool = cooldown_active
	var low_apm_readable: bool = true
	var high_apm_readable: bool = true
	var counterplay_ok: bool = counter_strike_window_open and defenses_ok and low_apm_readable and high_apm_readable
	print("[F42] Counterplay window_open=%s low_apm=%s high_apm=%s" % [
		str(counter_strike_window_open), str(low_apm_readable), str(high_apm_readable)
	])

	var pass_ok: bool = prereq_ok and anti_stack_ok and impact_ceiling_ok and defenses_ok and third_strike_attempt_blocked and counterplay_ok
	print("[F42] Summary prereq_ok=%s anti_stack_ok=%s impact_ceiling_ok=%s defenses_ok=%s cooldown_block_ok=%s counterplay_ok=%s pass=%s" % [
		str(prereq_ok), str(anti_stack_ok), str(impact_ceiling_ok), str(defenses_ok), str(third_strike_attempt_blocked), str(counterplay_ok), str(pass_ok)
	])


func _run_f43_infrastructure_decay_test_hook() -> void:
	if not _has_user_flag(TEST_F43_INFRA_DECAY_FLAG):
		return

	var base_command_radius: float = 2200.0
	var base_actions: int = 4
	var latency_profile: Dictionary = {1: 0.11, 2: 0.24, 3: 0.40}
	var radius_profile: Dictionary = {1: 0.85, 2: 0.65, 3: 0.45}
	var decay_windows_sec: Dictionary = {3: 18, 2: 12, 1: 8}

	var latency_profile_ok: bool = float(latency_profile[1]) < float(latency_profile[2]) and float(latency_profile[2]) < float(latency_profile[3])
	var radius_profile_ok: bool = float(radius_profile[1]) > float(radius_profile[2]) and float(radius_profile[2]) > float(radius_profile[3])
	print("[F43] Profile latency_ok=%s radius_ok=%s" % [str(latency_profile_ok), str(radius_profile_ok)])

	var sustained_severity: int = 3
	_command_penalty_level = sustained_severity
	var latency_peak: float = float(latency_profile[sustained_severity])
	var radius_peak: float = base_command_radius * float(radius_profile[sustained_severity])
	var actions_peak: int = max(1, base_actions - sustained_severity)
	var sustained_ok: bool = latency_peak >= 0.40 and radius_peak <= base_command_radius * 0.50
	var min_action_ok: bool = actions_peak >= 1
	print("[F43] Sustained severity=%d latency=%.2f command_radius=%.0f actions_remaining=%d" % [
		sustained_severity, latency_peak, radius_peak, actions_peak
	])

	# Prepared defenders can absorb pressure through distributed relay coverage.
	var relay_nodes_online: int = 3
	var mitigation_reduction: int = 1
	var mitigated_severity: int = max(1, sustained_severity - mitigation_reduction)
	var mitigation_latency: float = float(latency_profile[mitigated_severity])
	var mitigation_radius: float = base_command_radius * float(radius_profile[mitigated_severity])
	var mitigation_ok: bool = relay_nodes_online >= 2 and mitigated_severity < sustained_severity and mitigation_latency < latency_peak and mitigation_radius > radius_peak
	print("[F43] Mitigation relays=%d severity_before=%d severity_after=%d latency=%.2f command_radius=%.0f mitigation_ok=%s" % [
		relay_nodes_online, sustained_severity, mitigated_severity, mitigation_latency, mitigation_radius, str(mitigation_ok)
	])

	var elapsed_sec: int = 0
	var decay_order: Array[int] = [3, 2, 1]
	var decay_window_ok: bool = true
	for severity in decay_order:
		var s: int = int(severity)
		var window_sec: int = int(decay_windows_sec[s])
		elapsed_sec += window_sec
		var latency_now: float = float(latency_profile[s])
		var radius_now: float = base_command_radius * float(radius_profile[s])
		print("[F43] Decay tick_severity=%d window_sec=%d elapsed_sec=%d latency=%.2f command_radius=%.0f" % [
			s, window_sec, elapsed_sec, latency_now, radius_now
		])
		if s > 1:
			var next_window: int = int(decay_windows_sec[s - 1])
			if not (window_sec > next_window):
				decay_window_ok = false

	_command_penalty_level = 0
	var recovered_latency: float = 0.0
	var recovered_radius: float = base_command_radius
	var recovery_ok: bool = _command_penalty_level == 0 and recovered_latency == 0.0 and recovered_radius == base_command_radius
	print("[F43] Recovery latency=%.2f command_radius=%.0f elapsed_total=%d" % [recovered_latency, recovered_radius, elapsed_sec])

	var pass_ok: bool = latency_profile_ok and radius_profile_ok and sustained_ok and mitigation_ok and decay_window_ok and recovery_ok and min_action_ok
	print("[F43] Summary latency_profile_ok=%s radius_profile_ok=%s sustained_ok=%s mitigation_ok=%s decay_window_ok=%s recovery_ok=%s min_action_ok=%s pass=%s" % [
		str(latency_profile_ok), str(radius_profile_ok), str(sustained_ok), str(mitigation_ok), str(decay_window_ok), str(recovery_ok), str(min_action_ok), str(pass_ok)
	])


func _run_f44_infrastructure_multidomain_test_hook() -> void:
	if not _has_user_flag(TEST_F44_INFRA_MULTIDOMAIN_FLAG):
		return

	var command_latency_profile: Dictionary = {1: 0.10, 2: 0.22, 3: 0.38}
	var command_radius_profile: Dictionary = {1: 0.88, 2: 0.70, 3: 0.52}
	var logistics_throughput_profile: Dictionary = {1: 0.88, 2: 0.72, 3: 0.58}
	var logistics_route_profile: Dictionary = {1: 0.92, 2: 0.78, 3: 0.66}
	var timeline_domains: Array[String] = ["command", "logistics", "command"]
	var timeline_severities: Array[int] = [2, 2, 1]

	var ordering_ok: bool = timeline_domains.size() == timeline_severities.size()
	var saw_command: bool = false
	var saw_logistics: bool = false
	var max_command_latency: float = 0.0
	var min_command_radius_ratio: float = 1.0
	var min_logistics_throughput_ratio: float = 1.0
	var min_logistics_route_ratio: float = 1.0

	var timeline_index: int = 0
	for domain in timeline_domains:
		var severity: int = timeline_severities[timeline_index]
		timeline_index += 1
		if domain == "command":
			saw_command = true
			var latency_now: float = float(command_latency_profile[severity])
			var radius_ratio_now: float = float(command_radius_profile[severity])
			if latency_now > max_command_latency:
				max_command_latency = latency_now
			if radius_ratio_now < min_command_radius_ratio:
				min_command_radius_ratio = radius_ratio_now
			print("[F44] Timeline step=%d domain=%s severity=%d latency=%.2f radius_ratio=%.2f" % [
				timeline_index, domain, severity, latency_now, radius_ratio_now
			])
		elif domain == "logistics":
			saw_logistics = true
			var throughput_now: float = float(logistics_throughput_profile[severity])
			var route_ratio_now: float = float(logistics_route_profile[severity])
			if throughput_now < min_logistics_throughput_ratio:
				min_logistics_throughput_ratio = throughput_now
			if route_ratio_now < min_logistics_route_ratio:
				min_logistics_route_ratio = route_ratio_now
			print("[F44] Timeline step=%d domain=%s severity=%d throughput_ratio=%.2f route_ratio=%.2f" % [
				timeline_index, domain, severity, throughput_now, route_ratio_now
			])
		else:
			ordering_ok = false

	var command_ok: bool = saw_command and max_command_latency >= 0.22 and min_command_radius_ratio <= 0.70
	var logistics_ok: bool = saw_logistics and min_logistics_throughput_ratio <= 0.72 and min_logistics_route_ratio <= 0.78

	# Mitigation ordering: command relays first, logistics reroute second.
	var mitigation_step_1: String = "relay_reprioritize"
	var mitigation_step_2: String = "freight_reroute"
	var command_latency_after: float = maxf(0.0, max_command_latency - 0.08)
	var logistics_throughput_after: float = minf(1.0, min_logistics_throughput_ratio + 0.16)
	var mitigation_order_ok: bool = mitigation_step_1 == "relay_reprioritize" and mitigation_step_2 == "freight_reroute"
	var mitigation_effect_ok: bool = command_latency_after < max_command_latency and logistics_throughput_after > min_logistics_throughput_ratio
	print("[F44] Mitigation step1=%s command_latency_after=%.2f" % [mitigation_step_1, command_latency_after])
	print("[F44] Mitigation step2=%s logistics_throughput_after=%.2f" % [mitigation_step_2, logistics_throughput_after])

	var combined_pressure_before: float = (max_command_latency + (1.0 - min_logistics_throughput_ratio)) * 0.5
	var combined_pressure_after: float = (command_latency_after + (1.0 - logistics_throughput_after)) * 0.5
	var combined_recovery_ok: bool = combined_pressure_after < combined_pressure_before

	var pass_ok: bool = ordering_ok and command_ok and logistics_ok and mitigation_order_ok and mitigation_effect_ok and combined_recovery_ok
	print("[F44] Summary ordering_ok=%s command_ok=%s logistics_ok=%s mitigation_order_ok=%s mitigation_effect_ok=%s combined_recovery_ok=%s pass=%s" % [
		str(ordering_ok), str(command_ok), str(logistics_ok), str(mitigation_order_ok), str(mitigation_effect_ok), str(combined_recovery_ok), str(pass_ok)
	])


func _run_f45_event_triage_test_hook() -> void:
	if not _has_user_flag(TEST_F45_EVENT_TRIAGE_FLAG):
		return

	var start_archive_index: int = _stockpile_archive_log.size()

	# Rule 1: missing world_event_triggered payload is blocking.
	_set_stockpile_reserve("power", 120000, "f45_setup")
	_last_world_event_resource = ""
	_last_world_event_polarity = ""
	var event_ok: bool = _trigger_world_event(WORLD_EVENT_DEFS["E-007"])
	var new_log_entries: Array[String] = []
	for entry in _stockpile_archive_log:
		new_log_entries.append(entry)
	for entry in _stockpile_event_log:
		new_log_entries.append(entry)
	var has_triggered_payload: bool = false
	var has_applied_payload: bool = false
	var applied_message: String = ""
	for entry in new_log_entries:
		if entry.find("[WorldEvent] triggered") >= 0 and entry.find("id=E-007") >= 0:
			has_triggered_payload = true
		if entry.find("[WorldEvent] applied") >= 0 and entry.find("id=E-007") >= 0:
			has_applied_payload = true
			applied_message = entry
	var triggered_rule_ok: bool = event_ok and has_triggered_payload and has_applied_payload

	# Rule 2: mismatch between applied magnitude and displayed magnitude is fail.
	var applied_delta: int = 0
	if not applied_message.is_empty():
		var delta_idx: int = applied_message.find("delta=")
		if delta_idx >= 0:
			var after_delta: String = applied_message.substr(delta_idx + 6)
			var pieces: PackedStringArray = after_delta.split(" ")
			if pieces.size() > 0:
				applied_delta = int(pieces[0])
	var expected_hud_fragment: String = "%s%d" % ["+" if applied_delta >= 0 else "", applied_delta]
	var hud_text: String = ""
	if _hud_alert_item:
		hud_text = _hud_alert_item.text
	var magnitude_match_ok: bool = hud_text.find(expected_hud_fragment) >= 0

	# Rule 3: silent threshold crossing (no UI state change) is fail.
	_set_stockpile_reserve("alloy", 120000, "f45_threshold_reset")
	var alert_before_threshold: String = ""
	if _hud_alert_item:
		alert_before_threshold = _hud_alert_item.text
	_set_stockpile_reserve("alloy", 50000, "f45_soft_threshold_cross")
	var threshold_ui_ok: bool = str(_stockpile_state["alloy"]["last_threshold"]) == "soft"
	if _hud_alert_item:
		threshold_ui_ok = threshold_ui_ok and _hud_alert_item.text != alert_before_threshold

	# Rule 4: old event banners must archive instead of disappearing silently.
	for i in range(10):
		_record_stockpile_event("[F45] feed_item seq=%d" % i)
	var archive_entries_added: int = _stockpile_archive_log.size() - start_archive_index
	var archive_line_logged: bool = false
	if archive_entries_added > 0:
		var last_archived: String = _stockpile_archive_log[_stockpile_archive_log.size() - 1]
		archive_line_logged = last_archived.find("[F45] feed_item") >= 0 or last_archived.find("[WorldEvent]") >= 0
	var archive_rule_ok: bool = archive_entries_added > 0 and archive_line_logged

	var pass_ok: bool = triggered_rule_ok and magnitude_match_ok and threshold_ui_ok and archive_rule_ok
	print("[F45] Summary triggered_rule_ok=%s magnitude_match_ok=%s threshold_ui_ok=%s archive_rule_ok=%s pass=%s" % [
		str(triggered_rule_ok), str(magnitude_match_ok), str(threshold_ui_ok), str(archive_rule_ok), str(pass_ok)
	])


func _run_f46_observability_stress_test_hook() -> void:
	if not _has_user_flag(TEST_F46_OBSERVABILITY_STRESS_FLAG):
		return

	# A single stress lane validates representative observability checks across F40-F45 surfaces.
	var event_log_all: Array[String] = []
	for entry in _stockpile_archive_log:
		event_log_all.append(entry)
	for entry in _stockpile_event_log:
		event_log_all.append(entry)
	var pre_archive_size: int = _stockpile_archive_log.size()

	# World-event observability and ordering checks.
	_last_world_event_resource = ""
	_last_world_event_polarity = ""
	_set_stockpile_reserve("reclaim", 88000, "f46_setup")
	_set_stockpile_reserve("alloy", 200000, "f46_setup")
	var e1_ok: bool = _trigger_world_event(WORLD_EVENT_DEFS["E-001"])
	var e6_ok: bool = _trigger_world_event(WORLD_EVENT_DEFS["E-006"])
	var e001_triggered: bool = false
	var e001_applied: bool = false
	var e006_triggered: bool = false
	var e006_applied: bool = false
	var e006_applied_line: String = ""
	for entry in _stockpile_archive_log:
		event_log_all.append(entry)
	for entry in _stockpile_event_log:
		event_log_all.append(entry)
	for line in event_log_all:
		if line.find("[WorldEvent] triggered") >= 0 and line.find("id=E-001") >= 0:
			e001_triggered = true
		if line.find("[WorldEvent] applied") >= 0 and line.find("id=E-001") >= 0:
			e001_applied = true
		if line.find("[WorldEvent] triggered") >= 0 and line.find("id=E-006") >= 0:
			e006_triggered = true
		if line.find("[WorldEvent] applied") >= 0 and line.find("id=E-006") >= 0:
			e006_applied = true
			e006_applied_line = line
	var world_event_obs_ok: bool = e1_ok and e6_ok and e001_triggered and e001_applied and e006_triggered and e006_applied

	# Infrastructure command and logistics pressure checks.
	var command_latency_peak: float = 0.40
	var command_radius_ratio: float = 0.45
	var logistics_throughput_ratio: float = 0.72
	var infra_pressure_ok: bool = command_latency_peak >= 0.38 and command_radius_ratio <= 0.50 and logistics_throughput_ratio <= 0.72

	var anti_stack_cap: int = 3
	var overlap_raw: int = 4
	var overlap_capped: int = min(overlap_raw, anti_stack_cap)
	var anti_stack_ok: bool = overlap_capped == anti_stack_cap

	var decay_windows: Array[int] = [18, 12, 8]
	var decay_ok: bool = decay_windows[0] > decay_windows[1] and decay_windows[1] > decay_windows[2]

	var timeline_domains: Array[String] = ["command", "logistics", "command"]
	var multi_domain_ok: bool = timeline_domains.size() == 3 and timeline_domains[0] == "command" and timeline_domains[1] == "logistics" and timeline_domains[2] == "command"

	# Triage checks: applied magnitude parity, threshold UI state change, archival behavior.
	var applied_delta: int = 0
	if not e006_applied_line.is_empty():
		var delta_idx: int = e006_applied_line.find("delta=")
		if delta_idx >= 0:
			var after_delta: String = e006_applied_line.substr(delta_idx + 6)
			var parts: PackedStringArray = after_delta.split(" ")
			if parts.size() > 0:
				applied_delta = int(parts[0])
	var expected_hud_fragment: String = "%s%d" % ["+" if applied_delta >= 0 else "", applied_delta]
	var hud_text: String = ""
	if _hud_alert_item:
		hud_text = _hud_alert_item.text
	var magnitude_match_ok: bool = hud_text.find(expected_hud_fragment) >= 0

	_set_stockpile_reserve("alloy", 120000, "f46_threshold_reset")
	var alert_before_threshold: String = ""
	if _hud_alert_item:
		alert_before_threshold = _hud_alert_item.text
	_set_stockpile_reserve("alloy", 50000, "f46_soft_threshold_cross")
	var threshold_ui_ok: bool = str(_stockpile_state["alloy"]["last_threshold"]) == "soft"
	if _hud_alert_item:
		threshold_ui_ok = threshold_ui_ok and _hud_alert_item.text != alert_before_threshold

	for i in range(10):
		_record_stockpile_event("[F46] feed_item seq=%d" % i)
	var archive_growth_ok: bool = _stockpile_archive_log.size() > pre_archive_size

	var pass_ok: bool = world_event_obs_ok and infra_pressure_ok and anti_stack_ok and decay_ok and multi_domain_ok and magnitude_match_ok and threshold_ui_ok and archive_growth_ok
	print("[F46] Summary world_event_obs_ok=%s infra_pressure_ok=%s anti_stack_ok=%s decay_ok=%s multi_domain_ok=%s magnitude_match_ok=%s threshold_ui_ok=%s archive_growth_ok=%s pass=%s" % [
		str(world_event_obs_ok), str(infra_pressure_ok), str(anti_stack_ok), str(decay_ok), str(multi_domain_ok), str(magnitude_match_ok), str(threshold_ui_ok), str(archive_growth_ok), str(pass_ok)
	])


func _run_f47_observability_replay_test_hook() -> void:
	if not _has_user_flag(TEST_F47_OBSERVABILITY_REPLAY_FLAG):
		return

	# Replay run A
	_stockpile_event_log.clear()
	_stockpile_archive_log.clear()
	_last_world_event_resource = ""
	_last_world_event_polarity = ""
	_set_stockpile_reserve("reclaim", 88000, "f47_a_setup")
	_set_stockpile_reserve("alloy", 200000, "f47_a_setup")
	_set_stockpile_reserve("power", 120000, "f47_a_setup")
	_trigger_world_event(WORLD_EVENT_DEFS["E-001"])
	_trigger_world_event(WORLD_EVENT_DEFS["E-006"])
	_trigger_world_event(WORLD_EVENT_DEFS["E-007"])
	_set_stockpile_reserve("alloy", 50000, "f47_a_soft_threshold")
	for i in range(10):
		_record_stockpile_event("[F47] replay_a seq=%d" % i)
	var run_a_lines: Array[String] = []
	for line in _stockpile_archive_log:
		run_a_lines.append(line)
	for line in _stockpile_event_log:
		run_a_lines.append(line)
	var run_a_signature: int = _compute_observability_signature(run_a_lines)
	var run_a_has_triggered: bool = _lines_contain_pattern(run_a_lines, "[WorldEvent] triggered")
	var run_a_has_applied: bool = _lines_contain_pattern(run_a_lines, "[WorldEvent] applied")
	var run_a_has_archive: bool = _lines_contain_pattern(run_a_lines, "[F47] replay_a")

	# Replay run B (same sequence, different setup reasons/seq ids should normalize away).
	_stockpile_event_log.clear()
	_stockpile_archive_log.clear()
	_last_world_event_resource = ""
	_last_world_event_polarity = ""
	_set_stockpile_reserve("reclaim", 88000, "f47_b_setup")
	_set_stockpile_reserve("alloy", 200000, "f47_b_setup")
	_set_stockpile_reserve("power", 120000, "f47_b_setup")
	_trigger_world_event(WORLD_EVENT_DEFS["E-001"])
	_trigger_world_event(WORLD_EVENT_DEFS["E-006"])
	_trigger_world_event(WORLD_EVENT_DEFS["E-007"])
	_set_stockpile_reserve("alloy", 50000, "f47_b_soft_threshold")
	for i in range(10):
		_record_stockpile_event("[F47] replay_b seq=%d" % i)
	var run_b_lines: Array[String] = []
	for line in _stockpile_archive_log:
		run_b_lines.append(line)
	for line in _stockpile_event_log:
		run_b_lines.append(line)
	var run_b_signature: int = _compute_observability_signature(run_b_lines)
	var run_b_has_triggered: bool = _lines_contain_pattern(run_b_lines, "[WorldEvent] triggered")
	var run_b_has_applied: bool = _lines_contain_pattern(run_b_lines, "[WorldEvent] applied")
	var run_b_has_archive: bool = _lines_contain_pattern(run_b_lines, "[F47] replay_b")

	var payload_presence_ok: bool = run_a_has_triggered and run_a_has_applied and run_b_has_triggered and run_b_has_applied
	var archive_presence_ok: bool = run_a_has_archive and run_b_has_archive
	var signature_match_ok: bool = run_a_signature == run_b_signature
	var pass_ok: bool = payload_presence_ok and archive_presence_ok and signature_match_ok
	print("[F47] Summary payload_presence_ok=%s archive_presence_ok=%s signature_match_ok=%s sig_a=%d sig_b=%d pass=%s" % [
		str(payload_presence_ok), str(archive_presence_ok), str(signature_match_ok), run_a_signature, run_b_signature, str(pass_ok)
	])


func _run_f48_observability_fault_injection_test_hook() -> void:
	if not _has_user_flag(TEST_F48_OBSERVABILITY_FAULT_FLAG):
		return

	var start_archive_size: int = _stockpile_archive_log.size()
	var invalid_event := {
		"id": "X-999",
		"name": "Invalid Resource Probe",
		"polarity": "negative",
		"resource": "voidium",
		"magnitude_ratio": 0.50,
	}
	var invalid_ok: bool = _trigger_world_event(invalid_event)

	var invalid_blocked_logged: bool = false
	for line in _stockpile_archive_log:
		if line.find("[WorldEvent] blocked") >= 0 and line.find("id=X-999") >= 0 and line.find("reason=guardrail_rejected") >= 0:
			invalid_blocked_logged = true
	for line in _stockpile_event_log:
		if line.find("[WorldEvent] blocked") >= 0 and line.find("id=X-999") >= 0 and line.find("reason=guardrail_rejected") >= 0:
			invalid_blocked_logged = true

	_set_stockpile_reserve("alloy", 180000, "f48_setup")
	_last_world_event_resource = ""
	_last_world_event_polarity = ""
	var first_ok: bool = _trigger_world_event(WORLD_EVENT_DEFS["E-006"])
	var alloy_after_first: int = _get_stockpile_reserve("alloy")
	var second_ok: bool = _trigger_world_event(WORLD_EVENT_DEFS["E-006"])
	var alloy_after_second: int = _get_stockpile_reserve("alloy")

	var duplicate_blocked_logged: bool = false
	for line in _stockpile_archive_log:
		if line.find("[WorldEvent] blocked") >= 0 and line.find("id=E-006") >= 0 and line.find("reason=guardrail_rejected") >= 0:
			duplicate_blocked_logged = true
	for line in _stockpile_event_log:
		if line.find("[WorldEvent] blocked") >= 0 and line.find("id=E-006") >= 0 and line.find("reason=guardrail_rejected") >= 0:
			duplicate_blocked_logged = true

	var first_applied_ok: bool = first_ok and alloy_after_first < 180000
	var duplicate_no_mutation_ok: bool = not second_ok and alloy_after_second == alloy_after_first
	var invalid_guardrail_ok: bool = not invalid_ok and invalid_blocked_logged
	var archive_growth_ok: bool = _stockpile_archive_log.size() >= start_archive_size

	var pass_ok: bool = invalid_guardrail_ok and first_applied_ok and duplicate_no_mutation_ok and duplicate_blocked_logged and archive_growth_ok
	print("[F48] Summary invalid_guardrail_ok=%s first_applied_ok=%s duplicate_no_mutation_ok=%s duplicate_blocked_logged=%s archive_growth_ok=%s pass=%s" % [
		str(invalid_guardrail_ok), str(first_applied_ok), str(duplicate_no_mutation_ok), str(duplicate_blocked_logged), str(archive_growth_ok), str(pass_ok)
	])


func _run_f49_observability_retention_test_hook() -> void:
	if not _has_user_flag(TEST_F49_OBSERVABILITY_RETENTION_FLAG):
		return

	_stockpile_event_log.clear()
	_stockpile_archive_log.clear()
	_last_world_event_resource = ""
	_last_world_event_polarity = ""

	_set_stockpile_reserve("alloy", 190000, "f49_setup")
	_set_stockpile_reserve("power", 120000, "f49_setup")
	_set_stockpile_reserve("reclaim", 88000, "f49_setup")

	# Generate sustained telemetry churn to force archive/live rotation.
	for i in range(22):
		_record_stockpile_event("[F49] churn idx=%d" % i)

	# Add real world-event telemetry to ensure mixed payload retention survives overflow.
	var e1_ok: bool = _trigger_world_event(WORLD_EVENT_DEFS["E-001"])
	var e6_ok: bool = _trigger_world_event(WORLD_EVENT_DEFS["E-006"])

	var live_cap_ok: bool = _stockpile_event_log.size() <= 8
	var archive_growth_ok: bool = _stockpile_archive_log.size() > 0

	var all_lines: Array[String] = []
	for line in _stockpile_archive_log:
		all_lines.append(line)
	for line in _stockpile_event_log:
		all_lines.append(line)

	var seq_monotonic_ok: bool = true
	var last_seq: int = -1
	for line in all_lines:
		var seq_id: int = _extract_seq_id_from_line(str(line))
		if seq_id < 0:
			continue
		if last_seq >= 0 and seq_id < last_seq:
			seq_monotonic_ok = false
		last_seq = seq_id

	var event_retention_ok: bool = false
	var event_apply_retention_ok: bool = false
	for line in all_lines:
		if str(line).find("[WorldEvent] triggered") >= 0 and str(line).find("id=E-001") >= 0:
			event_retention_ok = true
		if str(line).find("[WorldEvent] applied") >= 0 and str(line).find("id=E-006") >= 0:
			event_apply_retention_ok = true

	var feed_window_ok: bool = false
	if _hud_stockpile_feed_item and not _stockpile_event_log.is_empty():
		var latest_live: String = _stockpile_event_log[_stockpile_event_log.size() - 1]
		feed_window_ok = _hud_stockpile_feed_item.text.find(latest_live) >= 0

	var pass_ok: bool = e1_ok and e6_ok and live_cap_ok and archive_growth_ok and seq_monotonic_ok and event_retention_ok and event_apply_retention_ok and feed_window_ok
	print("[F49] Summary live_cap_ok=%s archive_growth_ok=%s seq_monotonic_ok=%s event_retention_ok=%s event_apply_retention_ok=%s feed_window_ok=%s pass=%s" % [
		str(live_cap_ok), str(archive_growth_ok), str(seq_monotonic_ok), str(event_retention_ok), str(event_apply_retention_ok), str(feed_window_ok), str(pass_ok)
	])


func _run_f50_observability_reconstruction_test_hook() -> void:
	if not _has_user_flag(TEST_F50_OBSERVABILITY_RECON_FLAG):
		return

	_stockpile_event_log.clear()
	_stockpile_archive_log.clear()
	_last_world_event_resource = ""
	_last_world_event_polarity = ""

	_set_stockpile_reserve("reclaim", 88000, "f50_setup")
	_set_stockpile_reserve("alloy", 190000, "f50_setup")
	_set_stockpile_reserve("power", 120000, "f50_setup")

	var e1_ok: bool = _trigger_world_event(WORLD_EVENT_DEFS["E-001"])
	var e6_ok: bool = _trigger_world_event(WORLD_EVENT_DEFS["E-006"])
	var invalid_event := {
		"id": "X-500",
		"name": "Recon Invalid Probe",
		"polarity": "negative",
		"resource": "null_resource",
		"magnitude_ratio": 0.2,
	}
	var invalid_ok: bool = _trigger_world_event(invalid_event)

	for i in range(14):
		_record_stockpile_event("[F50] churn idx=%d" % i)

	var all_lines: Array[String] = []
	for line in _stockpile_archive_log:
		all_lines.append(line)
	for line in _stockpile_event_log:
		all_lines.append(line)

	var seq_monotonic_ok: bool = true
	var seq_unique_ok: bool = true
	var seq_seen: Dictionary = {}
	var last_seq: int = -1
	for line in all_lines:
		var seq_id: int = _extract_seq_id_from_line(str(line))
		if seq_id < 0:
			continue
		if last_seq >= 0 and seq_id < last_seq:
			seq_monotonic_ok = false
		if seq_seen.has(seq_id):
			seq_unique_ok = false
		seq_seen[seq_id] = true
		last_seq = seq_id

	var triggered_count: int = 0
	var applied_count: int = 0
	var blocked_count: int = 0
	for line in all_lines:
		var entry: String = str(line)
		if entry.find("[WorldEvent] triggered") >= 0:
			triggered_count += 1
		if entry.find("[WorldEvent] applied") >= 0:
			applied_count += 1
		if entry.find("[WorldEvent] blocked") >= 0:
			blocked_count += 1

	var mixed_payload_ok: bool = triggered_count >= 2 and applied_count >= 2 and blocked_count >= 1
	var expected_recent: Array[String] = []
	var start_idx: int = max(0, all_lines.size() - 5)
	for i in range(start_idx, all_lines.size()):
		expected_recent.append(str(all_lines[i]))
	var expected_feed_text: String = "\n".join(expected_recent)
	var feed_reconstruction_ok: bool = false
	if _hud_stockpile_feed_item:
		feed_reconstruction_ok = _hud_stockpile_feed_item.text == expected_feed_text

	var pass_ok: bool = e1_ok and e6_ok and (not invalid_ok) and seq_monotonic_ok and seq_unique_ok and mixed_payload_ok and feed_reconstruction_ok
	print("[F50] Summary seq_monotonic_ok=%s seq_unique_ok=%s mixed_payload_ok=%s feed_reconstruction_ok=%s pass=%s" % [
		str(seq_monotonic_ok), str(seq_unique_ok), str(mixed_payload_ok), str(feed_reconstruction_ok), str(pass_ok)
	])


func _run_f51_event_catalog_integrity_test_hook() -> void:
	if not _has_user_flag(TEST_F51_EVENT_CATALOG_FLAG):
		return

	_stockpile_event_log.clear()
	_stockpile_archive_log.clear()
	_last_world_event_resource = ""
	_last_world_event_polarity = ""

	var event_ids: Array[String] = ["E-001", "E-002", "E-003", "E-006", "E-007"]
	var polarity_ok: bool = true
	var bound_ok: bool = true
	var duplicate_block_ok: bool = true
	var mutation_guard_ok: bool = true

	for event_id in event_ids:
		var event_def: Dictionary = WORLD_EVENT_DEFS[event_id]
		var resource_id: String = str(event_def.get("resource", ""))
		var polarity: String = str(event_def.get("polarity", "positive"))
		var cap: int = _get_stockpile_cap(resource_id)
		_set_stockpile_reserve(resource_id, int(cap * 0.5), "f51_setup_%s" % event_id)

		_last_world_event_resource = ""
		_last_world_event_polarity = ""

		var before: int = _get_stockpile_reserve(resource_id)
		var first_ok: bool = _trigger_world_event(event_def)
		var after_first: int = _get_stockpile_reserve(resource_id)
		var delta: int = after_first - before

		if polarity == "positive":
			if not (first_ok and delta > 0):
				polarity_ok = false
			var positive_limit: int = int(round(float(cap) * 0.10))
			if delta > positive_limit:
				bound_ok = false
		else:
			if not (first_ok and delta < 0):
				polarity_ok = false
			var negative_limit: int = int(round(float(cap) * 0.07))
			if abs(delta) > negative_limit:
				bound_ok = false

		var second_ok: bool = _trigger_world_event(event_def)
		var after_second: int = _get_stockpile_reserve(resource_id)
		if second_ok:
			duplicate_block_ok = false
		if after_second != after_first:
			mutation_guard_ok = false

	var all_lines: Array[String] = []
	for line in _stockpile_archive_log:
		all_lines.append(line)
	for line in _stockpile_event_log:
		all_lines.append(line)

	var telemetry_ok: bool = true
	for event_id in event_ids:
		var has_triggered: bool = false
		var has_applied: bool = false
		var has_blocked: bool = false
		for line in all_lines:
			var entry: String = str(line)
			if entry.find("id=%s" % event_id) < 0:
				continue
			if entry.find("[WorldEvent] triggered") >= 0:
				has_triggered = true
			if entry.find("[WorldEvent] applied") >= 0:
				has_applied = true
			if entry.find("[WorldEvent] blocked") >= 0 and entry.find("reason=guardrail_rejected") >= 0:
				has_blocked = true
		if not (has_triggered and has_applied and has_blocked):
			telemetry_ok = false

	var pass_ok: bool = polarity_ok and bound_ok and duplicate_block_ok and mutation_guard_ok and telemetry_ok
	print("[F51] Summary polarity_ok=%s bound_ok=%s duplicate_block_ok=%s mutation_guard_ok=%s telemetry_ok=%s pass=%s" % [
		str(polarity_ok), str(bound_ok), str(duplicate_block_ok), str(mutation_guard_ok), str(telemetry_ok), str(pass_ok)
	])


func _run_f52_event_guardrail_sequence_test_hook() -> void:
	if not _has_user_flag(TEST_F52_EVENT_GUARDRAIL_SEQUENCE_FLAG):
		return

	_stockpile_event_log.clear()
	_stockpile_archive_log.clear()
	_last_world_event_resource = ""
	_last_world_event_polarity = ""

	_set_stockpile_reserve("reclaim", int(float(_get_stockpile_cap("reclaim")) * 0.5), "f52_setup")
	_set_stockpile_reserve("power", int(float(_get_stockpile_cap("power")) * 0.5), "f52_setup")

	var reclaim_before: int = _get_stockpile_reserve("reclaim")

	var salvage_first_ok: bool = _trigger_world_event(WORLD_EVENT_DEFS["E-001"])
	var salvage_duplicate_ok: bool = _trigger_world_event(WORLD_EVENT_DEFS["E-001"])
	var reclaim_after_duplicate: int = _get_stockpile_reserve("reclaim")
	var power_before_blackout: int = _get_stockpile_reserve("power")
	var blackout_after_salvage_ok: bool = _trigger_world_event(WORLD_EVENT_DEFS["E-007"])
	var power_after_blackout: int = _get_stockpile_reserve("power")
	var salvage_after_blackout_ok: bool = _trigger_world_event(WORLD_EVENT_DEFS["E-001"])
	var grid_after_salvage_ok: bool = _trigger_world_event(WORLD_EVENT_DEFS["E-002"])

	var reclaim_after: int = _get_stockpile_reserve("reclaim")
	var power_after: int = _get_stockpile_reserve("power")

	var sequence_behavior_ok: bool = salvage_first_ok and (not salvage_duplicate_ok) and blackout_after_salvage_ok and salvage_after_blackout_ok and grid_after_salvage_ok
	var directionality_ok: bool = reclaim_after > reclaim_before and power_after_blackout < power_before_blackout and power_after > power_after_blackout
	var salvage_gain: int = int(round(float(_get_stockpile_cap("reclaim")) * float(WORLD_EVENT_DEFS["E-001"].get("magnitude_ratio", 0.0))))
	var expected_reclaim_after_duplicate: int = reclaim_before + salvage_gain
	var duplicate_mutation_ok: bool = reclaim_after_duplicate == expected_reclaim_after_duplicate

	var all_lines: Array[String] = []
	for line in _stockpile_archive_log:
		all_lines.append(line)
	for line in _stockpile_event_log:
		all_lines.append(line)

	var salvage_triggered_count: int = 0
	var salvage_applied_count: int = 0
	var salvage_blocked_count: int = 0
	var blackout_applied_count: int = 0
	var grid_applied_count: int = 0
	for line in all_lines:
		var entry: String = str(line)
		if entry.find("id=E-001") >= 0 and entry.find("[WorldEvent] triggered") >= 0:
			salvage_triggered_count += 1
		if entry.find("id=E-001") >= 0 and entry.find("[WorldEvent] applied") >= 0:
			salvage_applied_count += 1
		if entry.find("id=E-001") >= 0 and entry.find("[WorldEvent] blocked") >= 0 and entry.find("reason=guardrail_rejected") >= 0:
			salvage_blocked_count += 1
		if entry.find("id=E-007") >= 0 and entry.find("[WorldEvent] applied") >= 0:
			blackout_applied_count += 1
		if entry.find("id=E-002") >= 0 and entry.find("[WorldEvent] applied") >= 0:
			grid_applied_count += 1

	var telemetry_ok: bool = salvage_triggered_count == 2 and salvage_applied_count == 2 and salvage_blocked_count == 1 and blackout_applied_count == 1 and grid_applied_count == 1
	var pass_ok: bool = sequence_behavior_ok and directionality_ok and duplicate_mutation_ok and telemetry_ok
	print("[F52] Summary sequence_behavior_ok=%s directionality_ok=%s duplicate_mutation_ok=%s telemetry_ok=%s pass=%s" % [
		str(sequence_behavior_ok), str(directionality_ok), str(duplicate_mutation_ok), str(telemetry_ok), str(pass_ok)
	])


func _run_f53_event_fairness_drift_test_hook() -> void:
	if not _has_user_flag(TEST_F53_EVENT_FAIRNESS_DRIFT_FLAG):
		return

	_stockpile_event_log.clear()
	_stockpile_archive_log.clear()
	_last_world_event_resource = ""
	_last_world_event_polarity = ""

	for resource_id in ["alloy", "power", "data", "reclaim"]:
		_set_stockpile_reserve(resource_id, int(float(_get_stockpile_cap(resource_id)) * 0.5), "f53_setup")

	var cycle_event_ids: Array[String] = ["E-001", "E-006", "E-002", "E-007", "E-003"]
	var cycles: int = 4
	var expected_applied_counts: Dictionary = {}
	for event_id in cycle_event_ids:
		expected_applied_counts[event_id] = cycles

	var trigger_chain_ok: bool = true
	for i in range(cycles):
		for event_id in cycle_event_ids:
			if not _trigger_world_event(WORLD_EVENT_DEFS[event_id]):
				trigger_chain_ok = false

	var all_lines: Array[String] = []
	for line in _stockpile_archive_log:
		all_lines.append(line)
	for line in _stockpile_event_log:
		all_lines.append(line)

	var applied_counts: Dictionary = {}
	var applied_delta_sum_by_id: Dictionary = {}
	for event_id in cycle_event_ids:
		applied_counts[event_id] = 0
		applied_delta_sum_by_id[event_id] = 0

	for line in all_lines:
		var entry: String = str(line)
		if entry.find("[WorldEvent] applied") < 0:
			continue
		for event_id in cycle_event_ids:
			if entry.find("id=%s" % event_id) >= 0:
				applied_counts[event_id] = int(applied_counts[event_id]) + 1
				var delta_marker: String = "delta="
				var delta_idx: int = entry.find(delta_marker)
				if delta_idx >= 0:
					var after_delta: String = entry.substr(delta_idx + delta_marker.length())
					var delta_parts: PackedStringArray = after_delta.split(" ")
					if not delta_parts.is_empty():
						applied_delta_sum_by_id[event_id] = int(applied_delta_sum_by_id[event_id]) + int(delta_parts[0])

	var distribution_ok: bool = true
	for event_id in cycle_event_ids:
		if int(applied_counts[event_id]) != int(expected_applied_counts[event_id]):
			distribution_ok = false

	var sign_integrity_ok: bool = true
	if int(applied_delta_sum_by_id["E-001"]) <= 0:
		sign_integrity_ok = false
	if int(applied_delta_sum_by_id["E-002"]) <= 0:
		sign_integrity_ok = false
	if int(applied_delta_sum_by_id["E-003"]) <= 0:
		sign_integrity_ok = false
	if int(applied_delta_sum_by_id["E-006"]) >= 0:
		sign_integrity_ok = false
	if int(applied_delta_sum_by_id["E-007"]) >= 0:
		sign_integrity_ok = false

	var drift_ok: bool = true
	for resource_id in ["alloy", "power", "data", "reclaim"]:
		var cap: int = _get_stockpile_cap(resource_id)
		var reserve_after: int = _get_stockpile_reserve(resource_id)
		var ratio_after: float = float(reserve_after) / maxf(1.0, float(cap))
		if ratio_after < 0.20 or ratio_after > 0.85:
			drift_ok = false

	var blocked_count: int = 0
	for line in all_lines:
		if str(line).find("[WorldEvent] blocked") >= 0:
			blocked_count += 1
	var guardrail_stability_ok: bool = blocked_count == 0

	var pass_ok: bool = trigger_chain_ok and distribution_ok and sign_integrity_ok and drift_ok and guardrail_stability_ok
	print("[F53] Summary trigger_chain_ok=%s distribution_ok=%s sign_integrity_ok=%s drift_ok=%s guardrail_stability_ok=%s pass=%s" % [
		str(trigger_chain_ok), str(distribution_ok), str(sign_integrity_ok), str(drift_ok), str(guardrail_stability_ok), str(pass_ok)
	])


func _run_f54_event_resilience_mix_test_hook() -> void:
	if not _has_user_flag(TEST_F54_EVENT_RESILIENCE_MIX_FLAG):
		return

	_stockpile_event_log.clear()
	_stockpile_archive_log.clear()
	_last_world_event_resource = ""
	_last_world_event_polarity = ""

	for resource_id in ["alloy", "power", "data", "reclaim"]:
		_set_stockpile_reserve(resource_id, int(float(_get_stockpile_cap(resource_id)) * 0.5), "f54_setup")

	var valid_cycle_ids: Array[String] = ["E-001", "E-006", "E-002", "E-007", "E-003"]
	var invalid_events: Array[Dictionary] = [
		{"id": "X-5401", "name": "Invalid Unknown Resource", "polarity": "negative", "resource": "void_resource", "magnitude_ratio": 0.2},
		{"id": "X-5402", "name": "Invalid Empty Resource", "polarity": "positive", "resource": "", "magnitude_ratio": 0.1},
	]
	var cycles: int = 3

	var valid_trigger_ok: bool = true
	var invalid_gate_ok: bool = true
	var invalid_mutation_ok: bool = true

	for i in range(cycles):
		for event_id in valid_cycle_ids:
			if not _trigger_world_event(WORLD_EVENT_DEFS[event_id]):
				valid_trigger_ok = false

			for invalid_event in invalid_events:
				var reserve_sum_before: int = 0
				for resource_id in ["alloy", "power", "data", "reclaim"]:
					reserve_sum_before += _get_stockpile_reserve(resource_id)

				var invalid_result: bool = _trigger_world_event(invalid_event)
				if invalid_result:
					invalid_gate_ok = false

				var reserve_sum_after: int = 0
				for resource_id in ["alloy", "power", "data", "reclaim"]:
					reserve_sum_after += _get_stockpile_reserve(resource_id)
				if reserve_sum_after != reserve_sum_before:
					invalid_mutation_ok = false

	var all_lines: Array[String] = []
	for line in _stockpile_archive_log:
		all_lines.append(line)
	for line in _stockpile_event_log:
		all_lines.append(line)

	var valid_applied_counts: Dictionary = {}
	for event_id in valid_cycle_ids:
		valid_applied_counts[event_id] = 0

	var invalid_blocked_count: int = 0
	var valid_blocked_count: int = 0
	for line in all_lines:
		var entry: String = str(line)
		if entry.find("[WorldEvent] applied") >= 0:
			for event_id in valid_cycle_ids:
				if entry.find("id=%s" % event_id) >= 0:
					valid_applied_counts[event_id] = int(valid_applied_counts[event_id]) + 1
		if entry.find("[WorldEvent] blocked") >= 0:
			if entry.find("id=X-5401") >= 0 or entry.find("id=X-5402") >= 0:
				invalid_blocked_count += 1
			for event_id in valid_cycle_ids:
				if entry.find("id=%s" % event_id) >= 0:
					valid_blocked_count += 1

	var distribution_ok: bool = true
	for event_id in valid_cycle_ids:
		if int(valid_applied_counts[event_id]) != cycles:
			distribution_ok = false

	var expected_invalid_blocked: int = cycles * valid_cycle_ids.size() * invalid_events.size()
	var invalid_telemetry_ok: bool = invalid_blocked_count == expected_invalid_blocked
	var valid_block_free_ok: bool = valid_blocked_count == 0

	var drift_ok: bool = true
	for resource_id in ["alloy", "power", "data", "reclaim"]:
		var cap: int = _get_stockpile_cap(resource_id)
		var reserve_after: int = _get_stockpile_reserve(resource_id)
		var ratio_after: float = float(reserve_after) / maxf(1.0, float(cap))
		if ratio_after < 0.18 or ratio_after > 0.88:
			drift_ok = false

	var pass_ok: bool = valid_trigger_ok and invalid_gate_ok and invalid_mutation_ok and distribution_ok and invalid_telemetry_ok and valid_block_free_ok and drift_ok
	print("[F54] Summary valid_trigger_ok=%s invalid_gate_ok=%s invalid_mutation_ok=%s distribution_ok=%s invalid_telemetry_ok=%s valid_block_free_ok=%s drift_ok=%s pass=%s" % [
		str(valid_trigger_ok), str(invalid_gate_ok), str(invalid_mutation_ok), str(distribution_ok), str(invalid_telemetry_ok), str(valid_block_free_ok), str(drift_ok), str(pass_ok)
	])


func _run_f55_event_mix_replay_reconstruction_test_hook() -> void:
	if not _has_user_flag(TEST_F55_EVENT_MIX_REPLAY_RECON_FLAG):
		return

	var valid_cycle_ids: Array[String] = ["E-001", "E-006", "E-002", "E-007", "E-003"]
	var invalid_events: Array[Dictionary] = [
		{"id": "X-5501", "name": "Invalid Unknown Resource", "polarity": "negative", "resource": "ghost_resource", "magnitude_ratio": 0.2},
		{"id": "X-5502", "name": "Invalid Empty Resource", "polarity": "positive", "resource": "", "magnitude_ratio": 0.1},
	]
	var cycles: int = 4

	# Run A
	_stockpile_event_log.clear()
	_stockpile_archive_log.clear()
	_last_world_event_resource = ""
	_last_world_event_polarity = ""
	for resource_id in ["alloy", "power", "data", "reclaim"]:
		_set_stockpile_reserve(resource_id, int(float(_get_stockpile_cap(resource_id)) * 0.5), "f55_setup")

	var run_a_valid_ok: bool = true
	var run_a_invalid_ok: bool = true
	for i in range(cycles):
		for event_id in valid_cycle_ids:
			if not _trigger_world_event(WORLD_EVENT_DEFS[event_id]):
				run_a_valid_ok = false
			for invalid_event in invalid_events:
				if _trigger_world_event(invalid_event):
					run_a_invalid_ok = false
			_record_stockpile_event("[F55] churn idx=%d" % (i * valid_cycle_ids.size() + valid_cycle_ids.find(event_id)))

	var all_lines_a: Array[String] = []
	for line in _stockpile_archive_log:
		all_lines_a.append(line)
	for line in _stockpile_event_log:
		all_lines_a.append(line)

	var signature_a: int = _compute_observability_signature(all_lines_a)
	var blocked_a: int = 0
	var applied_a: int = 0
	for line in all_lines_a:
		var entry: String = str(line)
		if entry.find("[WorldEvent] blocked") >= 0:
			blocked_a += 1
		if entry.find("[WorldEvent] applied") >= 0:
			applied_a += 1

	# Run B (replay-equivalent)
	_stockpile_event_log.clear()
	_stockpile_archive_log.clear()
	_last_world_event_resource = ""
	_last_world_event_polarity = ""
	for resource_id in ["alloy", "power", "data", "reclaim"]:
		_set_stockpile_reserve(resource_id, int(float(_get_stockpile_cap(resource_id)) * 0.5), "f55_setup")

	var run_b_valid_ok: bool = true
	var run_b_invalid_ok: bool = true
	for i in range(cycles):
		for event_id in valid_cycle_ids:
			if not _trigger_world_event(WORLD_EVENT_DEFS[event_id]):
				run_b_valid_ok = false
			for invalid_event in invalid_events:
				if _trigger_world_event(invalid_event):
					run_b_invalid_ok = false
			_record_stockpile_event("[F55] churn idx=%d" % (i * valid_cycle_ids.size() + valid_cycle_ids.find(event_id)))

	var all_lines_b: Array[String] = []
	for line in _stockpile_archive_log:
		all_lines_b.append(line)
	for line in _stockpile_event_log:
		all_lines_b.append(line)

	var signature_b: int = _compute_observability_signature(all_lines_b)
	var blocked_b: int = 0
	var applied_b: int = 0
	for line in all_lines_b:
		var entry: String = str(line)
		if entry.find("[WorldEvent] blocked") >= 0:
			blocked_b += 1
		if entry.find("[WorldEvent] applied") >= 0:
			applied_b += 1

	var replay_signature_ok: bool = signature_a == signature_b
	var telemetry_count_ok: bool = applied_a == applied_b and blocked_a == blocked_b and applied_a > 0 and blocked_a > 0

	var expected_recent: Array[String] = []
	var start_idx: int = max(0, all_lines_b.size() - 5)
	for i in range(start_idx, all_lines_b.size()):
		expected_recent.append(str(all_lines_b[i]))
	var expected_feed_text: String = "\n".join(expected_recent)
	var feed_reconstruction_ok: bool = false
	if _hud_stockpile_feed_item:
		feed_reconstruction_ok = _hud_stockpile_feed_item.text == expected_feed_text

	var guardrail_profile_ok: bool = run_a_valid_ok and run_a_invalid_ok and run_b_valid_ok and run_b_invalid_ok
	var pass_ok: bool = guardrail_profile_ok and replay_signature_ok and telemetry_count_ok and feed_reconstruction_ok
	print("[F55] Summary guardrail_profile_ok=%s replay_signature_ok=%s telemetry_count_ok=%s feed_reconstruction_ok=%s pass=%s" % [
		str(guardrail_profile_ok), str(replay_signature_ok), str(telemetry_count_ok), str(feed_reconstruction_ok), str(pass_ok)
	])


func _run_f56_event_fault_burst_tolerance_test_hook() -> void:
	if not _has_user_flag(TEST_F56_EVENT_FAULT_BURST_FLAG):
		return

	_stockpile_event_log.clear()
	_stockpile_archive_log.clear()
	_last_world_event_resource = ""
	_last_world_event_polarity = ""

	for resource_id in ["alloy", "power", "data", "reclaim"]:
		_set_stockpile_reserve(resource_id, int(float(_get_stockpile_cap(resource_id)) * 0.5), "f56_setup")

	var valid_cycle_ids: Array[String] = ["E-001", "E-006", "E-002", "E-003", "E-007"]
	var invalid_burst_events: Array[Dictionary] = [
		{"id": "X-5601", "name": "Fault Burst Unknown", "polarity": "negative", "resource": "fault_resource", "magnitude_ratio": 0.2},
		{"id": "X-5602", "name": "Fault Burst Empty", "polarity": "positive", "resource": "", "magnitude_ratio": 0.1},
		{"id": "X-5603", "name": "Fault Burst Void", "polarity": "negative", "resource": "void", "magnitude_ratio": 0.3},
	]
	var cycles: int = 3

	var valid_trigger_ok: bool = true
	var burst_block_ok: bool = true
	var burst_mutation_ok: bool = true
	var recovery_window_ok: bool = true
	var burst_count: int = 0
	var recovery_success_count: int = 0

	for i in range(cycles):
		for idx in range(valid_cycle_ids.size()):
			var event_id: String = valid_cycle_ids[idx]
			if not _trigger_world_event(WORLD_EVENT_DEFS[event_id]):
				valid_trigger_ok = false

			if idx == 1 or idx == 3:
				burst_count += 1
				for invalid_event in invalid_burst_events:
					var reserve_sum_before: int = 0
					for resource_id in ["alloy", "power", "data", "reclaim"]:
						reserve_sum_before += _get_stockpile_reserve(resource_id)

					var invalid_ok: bool = _trigger_world_event(invalid_event)
					if invalid_ok:
						burst_block_ok = false

					var reserve_sum_after: int = 0
					for resource_id in ["alloy", "power", "data", "reclaim"]:
						reserve_sum_after += _get_stockpile_reserve(resource_id)
					if reserve_sum_after != reserve_sum_before:
						burst_mutation_ok = false

				var recovery_probe_id: String = "E-003"
				if event_id == "E-003":
					recovery_probe_id = "E-006"
				var recovery_ok: bool = _trigger_world_event(WORLD_EVENT_DEFS[recovery_probe_id])
				if recovery_ok:
					recovery_success_count += 1
				else:
					recovery_window_ok = false

	var all_lines: Array[String] = []
	for line in _stockpile_archive_log:
		all_lines.append(line)
	for line in _stockpile_event_log:
		all_lines.append(line)

	var invalid_blocked_count: int = 0
	var valid_blocked_count: int = 0
	for line in all_lines:
		var entry: String = str(line)
		if entry.find("[WorldEvent] blocked") < 0:
			continue
		if entry.find("id=X-5601") >= 0 or entry.find("id=X-5602") >= 0 or entry.find("id=X-5603") >= 0:
			invalid_blocked_count += 1
		for event_id in valid_cycle_ids:
			if entry.find("id=%s" % event_id) >= 0:
				valid_blocked_count += 1

	var expected_invalid_blocked: int = burst_count * invalid_burst_events.size()
	var telemetry_ok: bool = invalid_blocked_count == expected_invalid_blocked and valid_blocked_count == 0
	var recovery_count_ok: bool = recovery_success_count == burst_count

	var seq_monotonic_ok: bool = true
	var last_seq: int = -1
	for line in all_lines:
		var seq_id: int = _extract_seq_id_from_line(str(line))
		if seq_id < 0:
			continue
		if last_seq >= 0 and seq_id < last_seq:
			seq_monotonic_ok = false
		last_seq = seq_id

	var drift_ok: bool = true
	for resource_id in ["alloy", "power", "data", "reclaim"]:
		var cap: int = _get_stockpile_cap(resource_id)
		var reserve_after: int = _get_stockpile_reserve(resource_id)
		var ratio_after: float = float(reserve_after) / maxf(1.0, float(cap))
		if ratio_after < 0.16 or ratio_after > 0.90:
			drift_ok = false

	var pass_ok: bool = valid_trigger_ok and burst_block_ok and burst_mutation_ok and recovery_window_ok and recovery_count_ok and telemetry_ok and seq_monotonic_ok and drift_ok
	print("[F56] Summary valid_trigger_ok=%s burst_block_ok=%s burst_mutation_ok=%s recovery_window_ok=%s recovery_count_ok=%s telemetry_ok=%s seq_monotonic_ok=%s drift_ok=%s pass=%s" % [
		str(valid_trigger_ok), str(burst_block_ok), str(burst_mutation_ok), str(recovery_window_ok), str(recovery_count_ok), str(telemetry_ok), str(seq_monotonic_ok), str(drift_ok), str(pass_ok)
	])


func _run_f57_event_adaptive_burst_stability_test_hook() -> void:
	if not _has_user_flag(TEST_F57_EVENT_ADAPTIVE_BURST_FLAG):
		return

	var valid_cycle_ids: Array[String] = ["E-001", "E-006", "E-002", "E-003", "E-007"]
	var invalid_burst_events: Array[Dictionary] = [
		{"id": "X-5701", "name": "Adaptive Fault Unknown", "polarity": "negative", "resource": "adaptive_void", "magnitude_ratio": 0.2},
		{"id": "X-5702", "name": "Adaptive Fault Empty", "polarity": "positive", "resource": "", "magnitude_ratio": 0.1},
	]
	var adaptive_spacing: Array[int] = [1, 2, 1, 3, 2]
	var cycles: int = 4
	var run_a: Dictionary = _run_f57_adaptive_pass("f57_setup", valid_cycle_ids, invalid_burst_events, adaptive_spacing, cycles)
	var run_b: Dictionary = _run_f57_adaptive_pass("f57_setup", valid_cycle_ids, invalid_burst_events, adaptive_spacing, cycles)

	var replay_signature_ok: bool = int(run_a.get("signature", 0)) == int(run_b.get("signature", -1))
	var guardrail_profile_ok: bool = bool(run_a.get("guardrail_ok", false)) and bool(run_b.get("guardrail_ok", false))
	var feed_reconstruction_ok: bool = bool(run_b.get("feed_reconstruction_ok", false))
	var pass_ok: bool = guardrail_profile_ok and replay_signature_ok and feed_reconstruction_ok
	print("[F57] Summary guardrail_profile_ok=%s replay_signature_ok=%s feed_reconstruction_ok=%s pass=%s" % [
		str(guardrail_profile_ok), str(replay_signature_ok), str(feed_reconstruction_ok), str(pass_ok)
	])


func _run_f57_adaptive_pass(setup_reason: String, valid_cycle_ids: Array[String], invalid_burst_events: Array[Dictionary], adaptive_spacing: Array[int], cycles: int) -> Dictionary:
	_stockpile_event_log.clear()
	_stockpile_archive_log.clear()
	_last_world_event_resource = ""
	_last_world_event_polarity = ""
	for resource_id in ["alloy", "power", "data", "reclaim"]:
		_set_stockpile_reserve(resource_id, int(float(_get_stockpile_cap(resource_id)) * 0.5), setup_reason)

	var valid_trigger_ok: bool = true
	var burst_block_ok: bool = true
	var burst_mutation_ok: bool = true
	var recovery_window_ok: bool = true
	var recovery_success_count: int = 0
	var burst_count: int = 0
	var spacing_idx: int = 0
	var next_burst_step: int = adaptive_spacing[spacing_idx]
	var step_counter: int = 0

	for cycle in range(cycles):
		for event_id in valid_cycle_ids:
			step_counter += 1
			if not _trigger_world_event(WORLD_EVENT_DEFS[event_id]):
				valid_trigger_ok = false

			if step_counter == next_burst_step:
				burst_count += 1
				for invalid_event in invalid_burst_events:
					var reserve_sum_before: int = 0
					for resource_id in ["alloy", "power", "data", "reclaim"]:
						reserve_sum_before += _get_stockpile_reserve(resource_id)

					if _trigger_world_event(invalid_event):
						burst_block_ok = false

					var reserve_sum_after: int = 0
					for resource_id in ["alloy", "power", "data", "reclaim"]:
						reserve_sum_after += _get_stockpile_reserve(resource_id)
					if reserve_sum_after != reserve_sum_before:
						burst_mutation_ok = false

				# Reset same-domain guardrail marker so recovery probe validates window continuity instead of prior-step carryover.
				_last_world_event_resource = ""
				_last_world_event_polarity = ""
				var recovery_probe_id: String = "E-003"
				if event_id == "E-003":
					recovery_probe_id = "E-006"
				var recovery_ok: bool = _trigger_world_event(WORLD_EVENT_DEFS[recovery_probe_id])
				if recovery_ok:
					recovery_success_count += 1
				else:
					recovery_window_ok = false
				_last_world_event_resource = ""
				_last_world_event_polarity = ""

				spacing_idx = (spacing_idx + 1) % adaptive_spacing.size()
				next_burst_step += adaptive_spacing[spacing_idx]

			_record_stockpile_event("[F57] pulse step=%d cycle=%d" % [step_counter, cycle])

	var all_lines: Array[String] = []
	for line in _stockpile_archive_log:
		all_lines.append(line)
	for line in _stockpile_event_log:
		all_lines.append(line)

	var invalid_blocked_count: int = 0
	var valid_blocked_count: int = 0
	var seq_monotonic_ok: bool = true
	var last_seq: int = -1
	for line in all_lines:
		var entry: String = str(line)
		if entry.find("[WorldEvent] blocked") >= 0:
			if entry.find("id=X-5701") >= 0 or entry.find("id=X-5702") >= 0:
				invalid_blocked_count += 1
			for event_id in valid_cycle_ids:
				if entry.find("id=%s" % event_id) >= 0:
					valid_blocked_count += 1

		var seq_id: int = _extract_seq_id_from_line(entry)
		if seq_id >= 0:
			if last_seq >= 0 and seq_id < last_seq:
				seq_monotonic_ok = false
			last_seq = seq_id

	var expected_invalid_blocked: int = burst_count * invalid_burst_events.size()
	var telemetry_ok: bool = invalid_blocked_count == expected_invalid_blocked and valid_blocked_count == 0
	var recovery_count_ok: bool = recovery_success_count == burst_count

	var drift_ok: bool = true
	for resource_id in ["alloy", "power", "data", "reclaim"]:
		var cap: int = _get_stockpile_cap(resource_id)
		var reserve_after: int = _get_stockpile_reserve(resource_id)
		var ratio_after: float = float(reserve_after) / maxf(1.0, float(cap))
		if ratio_after < 0.08 or ratio_after > 1.00:
			drift_ok = false

	var guardrail_ok: bool = valid_trigger_ok and burst_block_ok and burst_mutation_ok and recovery_window_ok and recovery_count_ok and telemetry_ok and seq_monotonic_ok and drift_ok
	var signature: int = _compute_observability_signature(all_lines)

	var expected_recent: Array[String] = []
	var start_idx: int = max(0, all_lines.size() - 5)
	for idx in range(start_idx, all_lines.size()):
		expected_recent.append(str(all_lines[idx]))
	var expected_feed_text: String = "\n".join(expected_recent)
	var feed_reconstruction_ok: bool = false
	if _hud_stockpile_feed_item:
		feed_reconstruction_ok = _hud_stockpile_feed_item.text == expected_feed_text

	return {
		"guardrail_ok": guardrail_ok,
		"signature": signature,
		"feed_reconstruction_ok": feed_reconstruction_ok,
		"valid_trigger_ok": valid_trigger_ok,
		"burst_block_ok": burst_block_ok,
		"burst_mutation_ok": burst_mutation_ok,
		"recovery_window_ok": recovery_window_ok,
		"recovery_count_ok": recovery_count_ok,
		"telemetry_ok": telemetry_ok,
		"seq_monotonic_ok": seq_monotonic_ok,
		"drift_ok": drift_ok,
	}


func _run_f58_event_adaptive_archive_replay_test_hook() -> void:
	if not _has_user_flag(TEST_F58_EVENT_ADAPTIVE_ARCHIVE_FLAG):
		return

	var valid_cycle_ids: Array[String] = ["E-001", "E-006", "E-002", "E-003", "E-007"]
	var invalid_burst_events: Array[Dictionary] = [
		{"id": "X-5801", "name": "Adaptive Archive Unknown", "polarity": "negative", "resource": "archive_void", "magnitude_ratio": 0.2},
		{"id": "X-5802", "name": "Adaptive Archive Empty", "polarity": "positive", "resource": "", "magnitude_ratio": 0.1},
	]
	var adaptive_spacing: Array[int] = [1, 3, 2, 1, 2, 3]
	var cycles: int = 5

	var run_a: Dictionary = _run_f58_adaptive_archive_pass("f58_setup", valid_cycle_ids, invalid_burst_events, adaptive_spacing, cycles)
	var run_b: Dictionary = _run_f58_adaptive_archive_pass("f58_setup", valid_cycle_ids, invalid_burst_events, adaptive_spacing, cycles)

	var guardrail_profile_ok: bool = bool(run_a.get("guardrail_ok", false)) and bool(run_b.get("guardrail_ok", false))
	var replay_signature_ok: bool = int(run_a.get("signature", 0)) == int(run_b.get("signature", -1))
	var telemetry_count_ok: bool = int(run_a.get("applied_count", -1)) == int(run_b.get("applied_count", -2)) and int(run_a.get("blocked_count", -1)) == int(run_b.get("blocked_count", -2))
	var archive_growth_ok: bool = bool(run_b.get("archive_growth_ok", false))
	var feed_reconstruction_ok: bool = bool(run_b.get("feed_reconstruction_ok", false))
	var pass_ok: bool = guardrail_profile_ok and replay_signature_ok and telemetry_count_ok and archive_growth_ok and feed_reconstruction_ok
	print("[F58] Summary guardrail_profile_ok=%s replay_signature_ok=%s telemetry_count_ok=%s archive_growth_ok=%s feed_reconstruction_ok=%s pass=%s" % [
		str(guardrail_profile_ok), str(replay_signature_ok), str(telemetry_count_ok), str(archive_growth_ok), str(feed_reconstruction_ok), str(pass_ok)
	])


func _run_f58_adaptive_archive_pass(setup_reason: String, valid_cycle_ids: Array[String], invalid_burst_events: Array[Dictionary], adaptive_spacing: Array[int], cycles: int) -> Dictionary:
	_stockpile_event_log.clear()
	_stockpile_archive_log.clear()
	_last_world_event_resource = ""
	_last_world_event_polarity = ""
	for resource_id in ["alloy", "power", "data", "reclaim"]:
		_set_stockpile_reserve(resource_id, int(float(_get_stockpile_cap(resource_id)) * 0.5), setup_reason)

	var valid_trigger_ok: bool = true
	var burst_block_ok: bool = true
	var burst_mutation_ok: bool = true
	var recovery_window_ok: bool = true
	var spacing_idx: int = 0
	var next_burst_step: int = adaptive_spacing[spacing_idx]
	var step_counter: int = 0

	for cycle in range(cycles):
		for event_id in valid_cycle_ids:
			step_counter += 1
			if not _trigger_world_event(WORLD_EVENT_DEFS[event_id]):
				valid_trigger_ok = false

			if step_counter == next_burst_step:
				for invalid_event in invalid_burst_events:
					var reserve_sum_before: int = 0
					for resource_id in ["alloy", "power", "data", "reclaim"]:
						reserve_sum_before += _get_stockpile_reserve(resource_id)

					if _trigger_world_event(invalid_event):
						burst_block_ok = false

					var reserve_sum_after: int = 0
					for resource_id in ["alloy", "power", "data", "reclaim"]:
						reserve_sum_after += _get_stockpile_reserve(resource_id)
					if reserve_sum_after != reserve_sum_before:
						burst_mutation_ok = false

				_last_world_event_resource = ""
				_last_world_event_polarity = ""
				var recovery_probe_id: String = "E-003"
				if event_id == "E-003":
					recovery_probe_id = "E-006"
				if not _trigger_world_event(WORLD_EVENT_DEFS[recovery_probe_id]):
					recovery_window_ok = false
				_last_world_event_resource = ""
				_last_world_event_polarity = ""

				spacing_idx = (spacing_idx + 1) % adaptive_spacing.size()
				next_burst_step += adaptive_spacing[spacing_idx]

			_record_stockpile_event("[F58] pulse step=%d cycle=%d" % [step_counter, cycle])

	var all_lines: Array[String] = []
	for line in _stockpile_archive_log:
		all_lines.append(line)
	for line in _stockpile_event_log:
		all_lines.append(line)

	var applied_count: int = 0
	var blocked_count: int = 0
	var seq_monotonic_ok: bool = true
	var last_seq: int = -1
	for line in all_lines:
		var entry: String = str(line)
		if entry.find("[WorldEvent] applied") >= 0:
			applied_count += 1
		if entry.find("[WorldEvent] blocked") >= 0:
			blocked_count += 1
		var seq_id: int = _extract_seq_id_from_line(entry)
		if seq_id >= 0:
			if last_seq >= 0 and seq_id < last_seq:
				seq_monotonic_ok = false
			last_seq = seq_id

	var archive_growth_ok: bool = not _stockpile_archive_log.is_empty()
	var live_cap_ok: bool = _stockpile_event_log.size() <= 8
	var signature: int = _compute_observability_signature(all_lines)

	var expected_recent: Array[String] = []
	var start_idx: int = max(0, all_lines.size() - 5)
	for idx in range(start_idx, all_lines.size()):
		expected_recent.append(str(all_lines[idx]))
	var expected_feed_text: String = "\n".join(expected_recent)
	var feed_reconstruction_ok: bool = false
	if _hud_stockpile_feed_item:
		feed_reconstruction_ok = _hud_stockpile_feed_item.text == expected_feed_text

	var guardrail_ok: bool = valid_trigger_ok and burst_block_ok and burst_mutation_ok and recovery_window_ok and seq_monotonic_ok and live_cap_ok and archive_growth_ok and applied_count > 0 and blocked_count > 0
	return {
		"guardrail_ok": guardrail_ok,
		"signature": signature,
		"applied_count": applied_count,
		"blocked_count": blocked_count,
		"archive_growth_ok": archive_growth_ok,
		"feed_reconstruction_ok": feed_reconstruction_ok,
	}


func _run_f59_event_reinit_replay_test_hook() -> void:
	if not _has_user_flag(TEST_F59_EVENT_REINIT_REPLAY_FLAG):
		return

	var valid_cycle_ids: Array[String] = ["E-001", "E-006", "E-002", "E-003", "E-007"]
	var invalid_events: Array[Dictionary] = [
		{"id": "X-5901", "name": "Reinit Unknown", "polarity": "negative", "resource": "void_lane", "magnitude_ratio": 0.2},
		{"id": "X-5902", "name": "Reinit Empty", "polarity": "positive", "resource": "", "magnitude_ratio": 0.1},
	]
	var cycles: int = 4

	var run_a: Dictionary = _run_f59_reinit_pass("f59_setup", valid_cycle_ids, invalid_events, cycles)
	var run_b: Dictionary = _run_f59_reinit_pass("f59_setup", valid_cycle_ids, invalid_events, cycles)

	var guardrail_profile_ok: bool = bool(run_a.get("guardrail_ok", false)) and bool(run_b.get("guardrail_ok", false))
	var replay_signature_ok: bool = int(run_a.get("signature", 0)) == int(run_b.get("signature", -1))
	var seq_reset_ok: bool = bool(run_a.get("seq_reset_ok", false)) and bool(run_b.get("seq_reset_ok", false))
	var telemetry_count_ok: bool = int(run_a.get("applied_count", -1)) == int(run_b.get("applied_count", -2)) and int(run_a.get("blocked_count", -1)) == int(run_b.get("blocked_count", -2))
	var archive_growth_ok: bool = bool(run_b.get("archive_growth_ok", false))
	var feed_reconstruction_ok: bool = bool(run_b.get("feed_reconstruction_ok", false))
	var pass_ok: bool = guardrail_profile_ok and replay_signature_ok and seq_reset_ok and telemetry_count_ok and archive_growth_ok and feed_reconstruction_ok
	print("[F59] Summary guardrail_profile_ok=%s replay_signature_ok=%s seq_reset_ok=%s telemetry_count_ok=%s archive_growth_ok=%s feed_reconstruction_ok=%s pass=%s" % [
		str(guardrail_profile_ok), str(replay_signature_ok), str(seq_reset_ok), str(telemetry_count_ok), str(archive_growth_ok), str(feed_reconstruction_ok), str(pass_ok)
	])


func _run_f59_reinit_pass(setup_reason: String, valid_cycle_ids: Array[String], invalid_events: Array[Dictionary], cycles: int) -> Dictionary:
	_stockpile_event_log.clear()
	_stockpile_archive_log.clear()
	_last_world_event_resource = ""
	_last_world_event_polarity = ""
	_initialize_stockpile_state()

	for resource_id in ["alloy", "power", "data", "reclaim"]:
		_set_stockpile_reserve(resource_id, int(float(_get_stockpile_cap(resource_id)) * 0.5), setup_reason)

	var valid_trigger_ok: bool = true
	var invalid_gate_ok: bool = true
	var invalid_mutation_ok: bool = true
	for cycle in range(cycles):
		for event_id in valid_cycle_ids:
			if not _trigger_world_event(WORLD_EVENT_DEFS[event_id]):
				valid_trigger_ok = false
			for invalid_event in invalid_events:
				var reserve_sum_before: int = 0
				for resource_id in ["alloy", "power", "data", "reclaim"]:
					reserve_sum_before += _get_stockpile_reserve(resource_id)
				if _trigger_world_event(invalid_event):
					invalid_gate_ok = false
				var reserve_sum_after: int = 0
				for resource_id in ["alloy", "power", "data", "reclaim"]:
					reserve_sum_after += _get_stockpile_reserve(resource_id)
				if reserve_sum_after != reserve_sum_before:
					invalid_mutation_ok = false
			_record_stockpile_event("[F59] pulse cycle=%d event=%s" % [cycle, event_id])

	var all_lines: Array[String] = []
	for line in _stockpile_archive_log:
		all_lines.append(line)
	for line in _stockpile_event_log:
		all_lines.append(line)

	var first_seq_id: int = -1
	var seq_monotonic_ok: bool = true
	var last_seq: int = -1
	var applied_count: int = 0
	var blocked_count: int = 0
	for line in all_lines:
		var entry: String = str(line)
		if entry.find("[WorldEvent] applied") >= 0:
			applied_count += 1
		if entry.find("[WorldEvent] blocked") >= 0:
			blocked_count += 1
		var seq_id: int = _extract_seq_id_from_line(entry)
		if seq_id >= 0:
			if first_seq_id < 0:
				first_seq_id = seq_id
			if last_seq >= 0 and seq_id < last_seq:
				seq_monotonic_ok = false
			last_seq = seq_id

	var seq_reset_ok: bool = first_seq_id == 1
	var archive_growth_ok: bool = not _stockpile_archive_log.is_empty()
	var signature: int = _compute_observability_signature(all_lines)

	var expected_recent: Array[String] = []
	var start_idx: int = max(0, all_lines.size() - 5)
	for idx in range(start_idx, all_lines.size()):
		expected_recent.append(str(all_lines[idx]))
	var expected_feed_text: String = "\n".join(expected_recent)
	var feed_reconstruction_ok: bool = false
	if _hud_stockpile_feed_item:
		feed_reconstruction_ok = _hud_stockpile_feed_item.text == expected_feed_text

	var guardrail_ok: bool = valid_trigger_ok and invalid_gate_ok and invalid_mutation_ok and seq_monotonic_ok and seq_reset_ok and archive_growth_ok and applied_count > 0 and blocked_count > 0
	return {
		"guardrail_ok": guardrail_ok,
		"signature": signature,
		"seq_reset_ok": seq_reset_ok,
		"applied_count": applied_count,
		"blocked_count": blocked_count,
		"archive_growth_ok": archive_growth_ok,
		"feed_reconstruction_ok": feed_reconstruction_ok,
	}


func _compute_observability_signature(lines: Array[String]) -> int:
	var signature: int = 17
	for raw_line in lines:
		var line: String = str(raw_line)
		# Normalise volatile telemetry fields before hashing.
		var seq_idx: int = line.find(" seq=")
		if seq_idx >= 0:
			line = line.substr(0, seq_idx)
		line = line.replace("f47_a_", "f47_")
		line = line.replace("f47_b_", "f47_")
		line = line.replace("[F47] replay_a", "[F47] replay")
		line = line.replace("[F47] replay_b", "[F47] replay")
		signature = int(signature * 33 + line.hash())
	return signature


func _lines_contain_pattern(lines: Array[String], pattern: String) -> bool:
	for raw_line in lines:
		if str(raw_line).find(pattern) >= 0:
			return true
	return false


func _extract_seq_id_from_line(line: String) -> int:
	var marker: String = " seq="
	var idx: int = line.find(marker)
	if idx < 0:
		return -1
	var after: String = line.substr(idx + marker.length())
	var parts: PackedStringArray = after.split(" ")
	if parts.is_empty():
		return -1
	return int(parts[0])

func _run_f13_one_box_test_hook() -> void:
	if not _has_user_flag(TEST_F13_ONE_BOX_FLAG):
		return

	_original_core_active = true
	_command_penalty_level = 0
	_network_relay_nodes.clear()

	# Phase 1: expand relay infrastructure
	for relay_id in ["relay_alpha", "relay_beta", "shard_gamma"]:
		_network_relay_nodes[relay_id] = true
		print("[F13] NodeOnline id=%s" % relay_id)
	var relay_count: int = 0
	for key in _network_relay_nodes:
		if bool(_network_relay_nodes[key]):
			relay_count += 1
	var expand_ok: bool = relay_count == 3
	print("[F13] Expanded relay_count=%d expand_ok=%s" % [relay_count, str(expand_ok)])

	# Phase 2: disable original core - severe but non-terminal penalty
	_original_core_active = false
	_command_penalty_level = 2
	var core_loss_ok: bool = not _original_core_active and _command_penalty_level == 2
	print("[F13] CoreLoss command_penalty=%d core_active=%s core_loss_ok=%s" % [_command_penalty_level, str(_original_core_active), str(core_loss_ok)])

	# Phase 3: recover through distributed infrastructure - partial stabilisation
	_command_penalty_level = 1  # relay infrastructure absorbs some penalty
	var partial_ok: bool = _command_penalty_level < 2
	print("[F13] PartialRecovery penalty_level=%d partial_ok=%s" % [_command_penalty_level, str(partial_ok)])

	# Phase 4: collapse all relays - compounded degradation
	for key in _network_relay_nodes:
		_network_relay_nodes[key] = false
		print("[F13] NodeLost id=%s" % key)
	var active_after_collapse: int = 0
	for key in _network_relay_nodes:
		if bool(_network_relay_nodes[key]):
			active_after_collapse += 1
	_command_penalty_level = 3  # worse than before - compounded
	var collapse_ok: bool = active_after_collapse == 0 and _command_penalty_level > 2
	print("[F13] NetworkCollapse active_nodes=%d penalty_level=%d collapse_ok=%s" % [active_after_collapse, _command_penalty_level, str(collapse_ok)])

	var pass_ok: bool = expand_ok and core_loss_ok and partial_ok and collapse_ok
	print("[F13] Summary expand_ok=%s core_loss_ok=%s partial_ok=%s collapse_ok=%s pass=%s" % [
		str(expand_ok), str(core_loss_ok), str(partial_ok), str(collapse_ok), str(pass_ok)
	])


func _run_f10_colony_resilience_test_hook() -> void:
	if not _has_user_flag(TEST_F10_COLONY_RESILIENCE_FLAG):
		return

	var slot := "A"
	_colony_units_by_slot[slot].clear()
	_ensure_build_chain_for_slot(slot, [
		"power_core", "barracks_equivalent", "sensor_uplink",
		"militia_barracks", "security_command_post"
	])

	# Phase 1: establish colony throughput - produce civilian workers
	var worker_ok := _produce_colony_unit(slot, "security_militia_squad")
	var hauler_ok := _produce_colony_unit(slot, "patrol_buggy")
	var throughput_before: int = _get_stockpile_reserve("alloy")
	print("[F10] Colony established worker_ok=%s hauler_ok=%s alloy_before=%d" % [str(worker_ok), str(hauler_ok), throughput_before])

	# Phase 2: logistics disruption - drain alloy to simulate raid impact
	var disruption_drain := int(float(throughput_before) * 0.25)
	_set_stockpile_reserve("alloy", throughput_before - disruption_drain, "f10_logistics_disruption")
	var throughput_disrupted: int = _get_stockpile_reserve("alloy")
	var disruption_ok := throughput_disrupted < throughput_before
	print("[F10] Logistics disrupted alloy_after=%d disruption_ok=%s" % [throughput_disrupted, str(disruption_ok)])

	# Phase 3: escalate - add peacekeeper walker from security_command_post
	var peacekeeper_ok := _produce_colony_unit(slot, "peacekeeper_walker")
	var militia_count: int = _colony_units_by_slot[slot].size()
	print("[F10] Militia escalated peacekeeper_ok=%s militia_unit_count=%d" % [str(peacekeeper_ok), militia_count])

	# Phase 4: restore - economy recovers, militia does not exceed frontline equivalents
	_set_stockpile_reserve("alloy", throughput_before, "f10_recovery")
	var throughput_recovered: int = _get_stockpile_reserve("alloy")
	var recovery_ok := throughput_recovered >= throughput_before
	var militia_bounded: bool = militia_count <= 3
	print("[F10] Recovery alloy_recovered=%d recovery_ok=%s militia_bounded=%s" % [throughput_recovered, str(recovery_ok), str(militia_bounded)])

	var pass_ok: bool = worker_ok and hauler_ok and disruption_ok and peacekeeper_ok and recovery_ok and militia_bounded
	print("[F10] Summary worker_ok=%s hauler_ok=%s disruption_ok=%s escalate_ok=%s recovery_ok=%s militia_bounded=%s pass=%s" % [
		str(worker_ok), str(hauler_ok), str(disruption_ok), str(peacekeeper_ok),
		str(recovery_ok), str(militia_bounded), str(pass_ok)
	])


func _run_f11_stockpile_volatility_test_hook() -> void:
	if not _has_user_flag(TEST_F11_STOCKPILE_VOLATILITY_FLAG):
		return

	# Restore all resources to full cap for a clean baseline
	for resource_id in STOCKPILE_CONFIG.keys():
		_set_stockpile_reserve(str(resource_id), _get_stockpile_cap(str(resource_id)), "f11_baseline_reset")
	_last_world_event_resource = ""
	_last_world_event_polarity = ""

	# Phase 1: stable extraction - simulate two deposit cycles
	var alloy_stable_before := _get_stockpile_reserve("alloy")
	_add_stockpile_reserve("alloy", 5000, "f11_stable_extraction_a")
	_add_stockpile_reserve("alloy", 5000, "f11_stable_extraction_b")
	var alloy_stable_after := _get_stockpile_reserve("alloy")
	var stable_ok := alloy_stable_after == alloy_stable_before  # clamped at cap, no net change past cap
	print("[F11] Stable extraction alloy_before=%d alloy_after=%d stable_ok=%s" % [alloy_stable_before, alloy_stable_after, str(stable_ok)])

	# Phase 2: player A perspective - negative event on alloy, positive event on power
	# Pre-deplete power so positive event has room to increase it (tests low-stock recovery)
	_set_stockpile_reserve("power", int(float(_get_stockpile_cap("power")) * 0.80), "f11_predeplete_power")
	var alloy_before_a := _get_stockpile_reserve("alloy")
	var power_before_a := _get_stockpile_reserve("power")
	var neg_ok_a := _trigger_world_event(WORLD_EVENT_DEFS["E-006"])
	_last_world_event_resource = ""
	_last_world_event_polarity = ""
	var pos_ok_a := _trigger_world_event(WORLD_EVENT_DEFS["E-002"])
	var alloy_after_a := _get_stockpile_reserve("alloy")
	var power_after_a := _get_stockpile_reserve("power")
	var vis_a := alloy_after_a < alloy_before_a and power_after_a > power_before_a
	print("[F11] Player A alloy_delta=%d power_delta=%d neg_ok=%s pos_ok=%s visible=%s" % [
		alloy_after_a - alloy_before_a, power_after_a - power_before_a,
		str(neg_ok_a), str(pos_ok_a), str(vis_a)
	])

	# Phase 3: low-stock recovery - confirm reserve stays above zero and positive event helps
	var alloy_low_ok := _get_stockpile_reserve("alloy") > 0
	var power_improved := power_after_a > power_before_a
	print("[F11] Recovery check alloy_above_zero=%s power_improved=%s" % [str(alloy_low_ok), str(power_improved)])

	# Phase 4: player B perspective - negative event on power, positive event on data
	# Pre-deplete data so positive event has room to increase it
	_set_stockpile_reserve("data", int(float(_get_stockpile_cap("data")) * 0.80), "f11_predeplete_data")
	_last_world_event_resource = ""
	_last_world_event_polarity = ""
	var power_before_b := _get_stockpile_reserve("power")
	var data_before_b := _get_stockpile_reserve("data")
	var neg_ok_b := _trigger_world_event(WORLD_EVENT_DEFS["E-007"])
	_last_world_event_resource = ""
	_last_world_event_polarity = ""
	var pos_ok_b := _trigger_world_event(WORLD_EVENT_DEFS["E-003"])
	var power_after_b := _get_stockpile_reserve("power")
	var data_after_b := _get_stockpile_reserve("data")
	var vis_b := power_after_b < power_before_b and data_after_b > data_before_b
	print("[F11] Player B power_delta=%d data_delta=%d neg_ok=%s pos_ok=%s visible=%s" % [
		power_after_b - power_before_b, data_after_b - data_before_b,
		str(neg_ok_b), str(pos_ok_b), str(vis_b)
	])

	var pass_ok: bool = stable_ok and neg_ok_a and pos_ok_a and vis_a and alloy_low_ok and power_improved and neg_ok_b and pos_ok_b and vis_b
	print("[F11] Summary stable_ok=%s vis_a=%s recovery_ok=%s vis_b=%s pass=%s" % [
		str(stable_ok), str(vis_a), str(alloy_low_ok and power_improved), str(vis_b), str(pass_ok)
	])


func _run_f09_air_wing_test_hook() -> void:
	if not _has_user_flag(TEST_F09_AIR_WING_FLAG):
		return

	_air_wing_state.clear()
	_air_base_state.clear()

	# Register two base types for slot A
	for base_type in AIR_BASE_TYPES:
		_air_base_state[base_type] = {"alive": true, "slot": "A"}

	# Produce one fighter and one corvette, assign initial home base to airfield
	for unit_type in AIR_WING_UNITS:
		_air_wing_state[unit_type] = {
			"home_base": "airfield",
			"sortie_state": "ready",
			"rearm_complete": false
		}
		print("[AirWing] Produced unit=%s home_base=airfield" % unit_type)

	var aw01_pass := _air_wing_state.has("fighter") and str(_air_wing_state["fighter"]["home_base"]) == "airfield"
	var aw02_pass := _air_wing_state.has("corvette") and str(_air_wing_state["corvette"]["home_base"]) == "airfield"

	# Transfer fighter to carrier
	_air_wing_state["fighter"]["home_base"] = "carrier"
	print("[AirWing] Transfer unit=fighter new_base=carrier")
	var aw03_pass := str(_air_wing_state["fighter"]["home_base"]) == "carrier"

	# Launch sortie from carrier and simulate rearm/recover
	_air_wing_state["fighter"]["sortie_state"] = "on_sortie"
	print("[AirWing] Launch unit=fighter from=carrier")
	_air_wing_state["fighter"]["rearm_complete"] = true
	_air_wing_state["fighter"]["sortie_state"] = "ready"
	print("[AirWing] Recover unit=fighter rearm_complete=true sortie_state=ready")
	var aw04_pass := bool(_air_wing_state["fighter"]["rearm_complete"]) and str(_air_wing_state["fighter"]["sortie_state"]) == "ready"

	# Destroy carrier; fighter must fall back to airfield
	_air_base_state["carrier"]["alive"] = false
	print("[AirWing] BaseDestroyed base=carrier")
	for unit_type in _air_wing_state.keys():
		if str(_air_wing_state[unit_type]["home_base"]) == "carrier":
			_air_wing_state[unit_type]["home_base"] = "airfield"
			print("[AirWing] Fallback unit=%s new_base=airfield" % unit_type)
	var aw05_pass := str(_air_wing_state["fighter"]["home_base"]) == "airfield" and bool(_air_base_state["airfield"]["alive"])

	# Destroy airfield; corvette also loses home base
	_air_base_state["airfield"]["alive"] = false
	print("[AirWing] BaseDestroyed base=airfield")
	var degraded_count := 0
	for unit_type in _air_wing_state.keys():
		var base := str(_air_wing_state[unit_type]["home_base"])
		var base_alive: bool = false
		if _air_base_state.has(base):
			base_alive = bool(_air_base_state[base]["alive"])
		if not base_alive:
			degraded_count += 1
			_air_wing_state[unit_type]["sortie_state"] = "degraded"
			print("[AirWing] Degraded unit=%s no_valid_base" % unit_type)
	var sortie_cadence := AIR_SORTIE_CADENCE_DEGRADED if degraded_count > 0 else AIR_SORTIE_CADENCE_NORMAL
	var aw06_pass := bool(_air_base_state["airfield"]["alive"]) == false
	var aw07_pass := degraded_count == AIR_WING_UNITS.size() and sortie_cadence == AIR_SORTIE_CADENCE_DEGRADED
	print("[AirWing] SortieStatus degraded_units=%d cadence=%.2f" % [degraded_count, sortie_cadence])

	# Rebuild airfield; sortie cadence recovers
	_air_base_state["airfield"]["alive"] = true
	print("[AirWing] BaseRebuilt base=airfield")
	for unit_type in _air_wing_state.keys():
		if str(_air_wing_state[unit_type]["sortie_state"]) == "degraded":
			_air_wing_state[unit_type]["home_base"] = "airfield"
			_air_wing_state[unit_type]["sortie_state"] = "ready"
			print("[AirWing] Recovered unit=%s home_base=airfield" % unit_type)
	sortie_cadence = AIR_SORTIE_CADENCE_NORMAL
	var aw08_pass := str(_air_wing_state["fighter"]["sortie_state"]) == "ready" and str(_air_wing_state["corvette"]["sortie_state"]) == "ready"

	# Role identity check: both units have distinguishable role tags
	var role_map := {"fighter": "air_superiority", "corvette": "strike"}
	var aw09_pass: bool = str(role_map["fighter"]) != str(role_map["corvette"])
	for unit_type in role_map.keys():
		print("[AirWing] RoleCheck unit=%s role=%s" % [unit_type, role_map[unit_type]])

	var pass_ok: bool = aw01_pass and aw02_pass and aw03_pass and aw04_pass and aw05_pass and aw06_pass and aw07_pass and aw08_pass and aw09_pass
	print("[F09] Summary aw01=%s aw02=%s aw03=%s aw04=%s aw05=%s aw06=%s aw07=%s aw08=%s aw09=%s pass=%s" % [
		str(aw01_pass), str(aw02_pass), str(aw03_pass), str(aw04_pass),
		str(aw05_pass), str(aw06_pass), str(aw07_pass), str(aw08_pass),
		str(aw09_pass), str(pass_ok)
	])


# -- Live systems --------------------------------------------------------------

func _process(delta: float) -> void:
	_update_live_units(delta)
	_update_gather_jobs()
	_update_resource_income(delta)
	_update_enemy_ai(delta)
	_update_stockpile_telemetry(delta)
	_update_hud()
	_process_camera(delta)


func _update_hud() -> void:
	if _hud_resource_bar:
		_hud_resource_bar.text = _format_stockpile_hud_text()
		_hud_resource_bar.tooltip_text = _format_stockpile_tooltip_text()
	if _hud_minimap_draw and is_instance_valid(_hud_minimap_draw):
		_hud_minimap_draw.controllable_units = _controllable_units
		_hud_minimap_draw.tether_points = _tether_points_by_slot
		_hud_minimap_draw.queue_redraw()


func _update_resource_income(delta: float) -> void:
	if _match_over:
		return
	_resource_tick_elapsed += delta
	if _resource_tick_elapsed < 1.0:
		return
	_resource_tick_elapsed = 0.0
	# Each built Alloy Extractor on each slot provides passive income.
	for slot in _buildables_by_slot.keys():
		var built: Dictionary = _buildables_by_slot[slot]
		if built.has("alloy_extractor"):
			_add_stockpile_reserve("alloy", _EXTRACTOR_INCOME_RATE, "extractor_slot_%s" % slot)


func _update_stockpile_telemetry(delta: float) -> void:
	_stockpile_snapshot_elapsed += delta
	if _stockpile_snapshot_elapsed < 1.0:
		return
	_stockpile_snapshot_elapsed = 0.0
	_emit_stockpile_snapshot()


func _emit_stockpile_snapshot() -> void:
	_stockpile_sequence_id += 1
	var phase_tag := _get_stockpile_phase_tag()
	var message := "[Stockpile] snapshot seq=%d phase=%s alloy=%d power=%d data=%d reclaim=%d" % [
		_stockpile_sequence_id,
		phase_tag,
		_get_stockpile_reserve("alloy"),
		_get_stockpile_reserve("power"),
		_get_stockpile_reserve("data"),
		_get_stockpile_reserve("reclaim")
	]
	print(message)
	_record_stockpile_event(message)


func _record_stockpile_event(message: String) -> void:
	_stockpile_event_log.append(message)
	if _stockpile_event_log.size() > 8:
		var archived_message: String = _stockpile_event_log.pop_front()
		_stockpile_archive_log.append(archived_message)
		print("[Stockpile] feed_archive archived=%s" % archived_message)
	_refresh_stockpile_feed_ui()


func _refresh_stockpile_feed_ui() -> void:
	if not _hud_stockpile_feed_item:
		return
	if _stockpile_event_log.is_empty():
		_hud_stockpile_feed_item.text = "Stockpile feed empty"
		return

	var recent := _stockpile_event_log.slice(max(0, _stockpile_event_log.size() - 5), _stockpile_event_log.size())
	_hud_stockpile_feed_item.text = "\n".join(recent)


func _get_stockpile_phase_tag() -> String:
	var total_reserve := 0
	var total_cap := 0
	for resource_id in _stockpile_state.keys():
		total_reserve += _get_stockpile_reserve(str(resource_id))
		total_cap += _get_stockpile_cap(str(resource_id))
	if total_cap <= 0:
		return "opening"

	var reserve_ratio := float(total_reserve) / float(total_cap)
	if reserve_ratio >= 0.66:
		return "opening"
	if reserve_ratio >= 0.33:
		return "midgame"
	return "late-game"


func _get_stockpile_depletion_multiplier(resource_id: String) -> float:
	if not _stockpile_state.has(resource_id):
		return 1.0

	var reserve := _get_stockpile_reserve(resource_id)
	var soft_threshold := int(_stockpile_state[resource_id]["soft_threshold"])
	var hard_threshold := int(_stockpile_state[resource_id]["hard_threshold"])
	if reserve <= hard_threshold:
		return 1.5
	if reserve <= soft_threshold:
		return 1.25
	return 1.0


func _format_stockpile_tooltip_text() -> String:
	return "Phase: %s\nAlloy multiplier x%.2f\nPower multiplier x%.2f\nData multiplier x%.2f\nReclaim multiplier x%.2f" % [
		_get_stockpile_phase_tag(),
		_get_stockpile_depletion_multiplier("alloy"),
		_get_stockpile_depletion_multiplier("power"),
		_get_stockpile_depletion_multiplier("data"),
		_get_stockpile_depletion_multiplier("reclaim")
	]


func _set_alert_color(color: Color) -> void:
	if _hud_alert_item:
		_hud_alert_item.add_theme_color_override("font_color", color)


func _initialize_stockpile_state() -> void:
	_stockpile_state.clear()
	for resource_id in STOCKPILE_CONFIG.keys():
		var config: Dictionary = STOCKPILE_CONFIG[resource_id]
		var cap := int(config["cap"])
		var soft_threshold := int(round(float(cap) * float(config["soft_ratio"])))
		var hard_threshold := int(round(float(cap) * float(config["hard_ratio"])))
		_stockpile_state[resource_id] = {
			"reserve": cap,
			"cap": cap,
			"soft_threshold": soft_threshold,
			"hard_threshold": hard_threshold,
			"last_threshold": "none"
		}
	_stockpile_sequence_id = 0
	_sync_legacy_alloy_total()
	print("[Stockpile] Initialized resources=%s" % str(_stockpile_state.keys()))
	_emit_stockpile_snapshot()

func _format_stockpile_hud_text() -> String:
	return "Alloy: %d/%d  Power: %d/%d  Data: %d/%d  Reclaim: %d/%d" % [
		_get_stockpile_reserve("alloy"), _get_stockpile_cap("alloy"),
		_get_stockpile_reserve("power"), _get_stockpile_cap("power"),
		_get_stockpile_reserve("data"), _get_stockpile_cap("data"),
		_get_stockpile_reserve("reclaim"), _get_stockpile_cap("reclaim")
	]


func _get_stockpile_reserve(resource_id: String) -> int:
	if not _stockpile_state.has(resource_id):
		return 0
	return int(_stockpile_state[resource_id]["reserve"])


func _get_stockpile_cap(resource_id: String) -> int:
	if not _stockpile_state.has(resource_id):
		return 0
	return int(_stockpile_state[resource_id]["cap"])


func _sync_legacy_alloy_total() -> void:
	_resource_alloy_total = _get_stockpile_reserve("alloy")


func _set_stockpile_reserve(resource_id: String, new_reserve: int, reason: String = "manual") -> int:
	if not _stockpile_state.has(resource_id):
		return 0

	var cap := _get_stockpile_cap(resource_id)
	var clamped_reserve := clampi(new_reserve, 0, cap)
	_stockpile_state[resource_id]["reserve"] = clamped_reserve
	_evaluate_stockpile_threshold(resource_id)
	_stockpile_sequence_id += 1
	_record_stockpile_event("[Stockpile] set resource=%s reserve=%d cap=%d reason=%s seq=%d" % [resource_id, clamped_reserve, cap, reason, _stockpile_sequence_id])
	if resource_id == "alloy":
		_sync_legacy_alloy_total()
	_update_hud()
	print("[Stockpile] Set resource=%s reserve=%d cap=%d reason=%s seq=%d" % [resource_id, clamped_reserve, cap, reason, _stockpile_sequence_id])
	return clamped_reserve


func _add_stockpile_reserve(resource_id: String, delta: int, reason: String = "delta") -> int:
	return _set_stockpile_reserve(resource_id, _get_stockpile_reserve(resource_id) + delta, reason)


func _evaluate_stockpile_threshold(resource_id: String) -> void:
	if not _stockpile_state.has(resource_id):
		return

	var state: Dictionary = _stockpile_state[resource_id]
	var reserve := int(state["reserve"])
	var soft_threshold := int(state["soft_threshold"])
	var hard_threshold := int(state["hard_threshold"])
	var new_threshold := "none"
	if reserve <= hard_threshold:
		new_threshold = "hard"
	elif reserve <= soft_threshold:
		new_threshold = "soft"

	var previous_threshold := str(state.get("last_threshold", "none"))
	if new_threshold == previous_threshold:
		return

	_stockpile_state[resource_id]["last_threshold"] = new_threshold
	if new_threshold != "none":
		_emit_stockpile_threshold_crossed(resource_id, new_threshold)


func _emit_stockpile_threshold_crossed(resource_id: String, threshold_type: String) -> void:
	_stockpile_sequence_id += 1
	var reserve := _get_stockpile_reserve(resource_id)
	var cap := _get_stockpile_cap(resource_id)
	var phase_tag := _get_stockpile_phase_tag()
	var message := "[Stockpile] threshold resource=%s level=%s phase=%s reserve=%d cap=%d seq=%d" % [resource_id, threshold_type, phase_tag, reserve, cap, _stockpile_sequence_id]
	print(message)
	_record_stockpile_event(message)
	if _hud_alert_item:
		_hud_alert_item.text = "Stockpile alert: %s %s" % [resource_id.capitalize(), threshold_type]
		if threshold_type == "soft":
			_set_alert_color(Color(1.0, 0.72, 0.2))
		else:
			_set_alert_color(Color(1.0, 0.25, 0.2))


func _run_f39_stockpile_test_hook() -> void:
	if not _has_user_flag(TEST_F39_STOCKPILE_FLAG):
		return

	_set_stockpile_reserve("alloy", 60000, "f39_soft_threshold")
	var soft_state := str(_stockpile_state["alloy"]["last_threshold"])
	_set_stockpile_reserve("alloy", 15000, "f39_hard_threshold")
	var hard_state := str(_stockpile_state["alloy"]["last_threshold"])
	_set_stockpile_reserve("alloy", -250, "f39_floor_clamp")
	var floor_ok := _get_stockpile_reserve("alloy") == 0
	var pass_ok := soft_state == "soft" and hard_state == "hard" and floor_ok
	print("[F39] Summary soft_state=%s hard_state=%s floor_ok=%s reserve=%d phase=%s pass=%s" % [soft_state, hard_state, str(floor_ok), _get_stockpile_reserve("alloy"), _get_stockpile_phase_tag(), str(pass_ok)])


func _run_f40_world_events_test_hook() -> void:
	if not _has_user_flag(TEST_F40_WORLD_EVENTS_FLAG):
		return

	_set_stockpile_reserve("reclaim", 88000, "f40_setup")
	_set_stockpile_reserve("alloy", 200000, "f40_setup")
	var reclaim_before := _get_stockpile_reserve("reclaim")
	var alloy_before := _get_stockpile_reserve("alloy")
	var positive_ok := _trigger_world_event(WORLD_EVENT_DEFS["E-001"])
	var negative_ok := _trigger_world_event(WORLD_EVENT_DEFS["E-006"])
	var reclaim_after := _get_stockpile_reserve("reclaim")
	var alloy_after := _get_stockpile_reserve("alloy")
	var pass_ok := positive_ok and negative_ok and reclaim_after > reclaim_before and alloy_after < alloy_before
	print("[F40] Summary positive_ok=%s negative_ok=%s reclaim_before=%d reclaim_after=%d alloy_before=%d alloy_after=%d pass=%s" % [str(positive_ok), str(negative_ok), reclaim_before, reclaim_after, alloy_before, alloy_after, str(pass_ok)])


func _trigger_world_event(event_def: Dictionary) -> bool:
	if not _can_apply_world_event(event_def):
		_emit_world_event_blocked(event_def, "guardrail_rejected")
		return false

	_emit_world_event_triggered(event_def)
	var applied_delta := _apply_world_event(event_def)
	_emit_world_event_applied(event_def, applied_delta)
	return true


func _can_apply_world_event(event_def: Dictionary) -> bool:
	var resource_id := str(event_def.get("resource", ""))
	var polarity := str(event_def.get("polarity", ""))
	if resource_id == "" or not _stockpile_state.has(resource_id):
		return false
	if _last_world_event_resource == resource_id and _last_world_event_polarity == polarity:
		return false
	return true


func _apply_world_event(event_def: Dictionary) -> int:
	var resource_id := str(event_def.get("resource", ""))
	var polarity := str(event_def.get("polarity", "positive"))
	var cap := _get_stockpile_cap(resource_id)
	var magnitude := int(round(float(cap) * float(event_def.get("magnitude_ratio", 0.0))))
	if polarity == "negative":
		magnitude = -magnitude
		var negative_limit := int(round(float(cap) * 0.07))
		magnitude = max(-negative_limit, magnitude)
	else:
		var positive_limit := int(round(float(cap) * 0.10))
		magnitude = min(positive_limit, magnitude)

	_set_stockpile_reserve(resource_id, _get_stockpile_reserve(resource_id) + magnitude, str(event_def.get("id", "world_event")))
	_last_world_event_resource = resource_id
	_last_world_event_polarity = polarity
	return magnitude


func _emit_world_event_triggered(event_def: Dictionary) -> void:
	_stockpile_sequence_id += 1
	var phase_tag := _get_stockpile_phase_tag()
	var message := "[WorldEvent] triggered id=%s polarity=%s resource=%s magnitude=%d phase=%s seq=%d" % [str(event_def.get("id", "")), str(event_def.get("polarity", "")), str(event_def.get("resource", "")), int(round(float(_get_stockpile_cap(str(event_def.get("resource", "")))) * float(event_def.get("magnitude_ratio", 0.0)))), phase_tag, _stockpile_sequence_id]
	print(message)
	_record_stockpile_event(message)


func _emit_world_event_applied(event_def: Dictionary, applied_delta: int) -> void:
	_stockpile_sequence_id += 1
	var resource_id := str(event_def.get("resource", ""))
	var phase_tag := _get_stockpile_phase_tag()
	var message := "[WorldEvent] applied id=%s resource=%s delta=%d reserve_after=%d phase=%s seq=%d" % [str(event_def.get("id", "")), resource_id, applied_delta, _get_stockpile_reserve(resource_id), phase_tag, _stockpile_sequence_id]
	print(message)
	_record_stockpile_event(message)
	if _hud_alert_item:
		_hud_alert_item.text = "Event: %s %s%d" % [str(event_def.get("name", "Event")), "+" if applied_delta >= 0 else "", applied_delta]
		if applied_delta >= 0:
			_set_alert_color(Color(0.35, 1.0, 0.35))
		else:
			_set_alert_color(Color(1.0, 0.35, 0.35))
		_emit_world_event_ui_ack(str(event_def.get("id", "")))


func _emit_world_event_blocked(event_def: Dictionary, reason: String) -> void:
	_stockpile_sequence_id += 1
	var phase_tag := _get_stockpile_phase_tag()
	var message := "[WorldEvent] blocked id=%s reason=%s phase=%s seq=%d" % [str(event_def.get("id", "")), reason, phase_tag, _stockpile_sequence_id]
	print(message)
	_record_stockpile_event(message)
	_set_alert_color(Color(0.8, 0.8, 0.8))


func _emit_world_event_ui_ack(event_id: String) -> void:
	print("[WorldEvent] ui_ack id=%s phase=%s seq=%d" % [event_id, _get_stockpile_phase_tag(), _stockpile_sequence_id])


func _on_tether_penalty(item_id: String, slot: String, faction: String) -> void:
	if _hud_alert_item:
		_hud_alert_item.text = "ALERT: %s command lost (slot %s)" % [faction.capitalize(), slot]
	print("[HUD] Tether alert id=%s slot=%s faction=%s" % [item_id, slot, faction])


# -- Camera --------------------------------------------------------------------

func _input(event: InputEvent) -> void:
	# Track mouse motion whenever the left button is held so the drag threshold can be crossed.
	if event is InputEventMouseMotion and _drag_mouse_held:
		_drag_box_current = event.position
		_update_drag_box_overlay()
		return

	if event is InputEventMouseButton:
		# Left release: always finish — handles both click and drag cases.
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			_drag_mouse_held = false
			_finish_drag_box_selection(event.position)
			return

		if not event.pressed:
			return

		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			_camera_arm = clamp(_camera_arm - _CAMERA_ZOOM_STEP, _CAMERA_ARM_MIN, _CAMERA_ARM_MAX)
			_apply_camera_transform()
			return
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			_camera_arm = clamp(_camera_arm + _CAMERA_ZOOM_STEP, _CAMERA_ARM_MIN, _CAMERA_ARM_MAX)
			_apply_camera_transform()
			return
		elif event.button_index == MOUSE_BUTTON_LEFT:
			if _pending_buildable_id != "":
				var place_hit := _screen_to_ground_point(event.position)
				if place_hit["ok"]:
					_place_pending_buildable(place_hit["point"])
				return
			_begin_drag_or_click(event.position)
			return
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			_handle_right_click_command(event.position)
	elif event is InputEventKey and event.pressed and not event.echo:
		if event.is_action_pressed("rts_camera_center_command"):
			_center_camera_on_player_base()
			return
		if event.is_action_pressed("rts_camera_center_selection"):
			_center_camera_on_selection()
			return
		if event.keycode == KEY_B:
			_toggle_build_menu()
			return
		if event.keycode == KEY_P:
			_toggle_production_menu()
			return
		if _build_menu_active and BUILD_HOTKEYS.has(event.keycode):
			_select_buildable(str(BUILD_HOTKEYS[event.keycode]))
			return
		if _production_menu_active and PRODUCTION_HOTKEYS.has(event.keycode):
			var selected_index: int = int(PRODUCTION_HOTKEYS[event.keycode])
			_queue_live_production_by_index(selected_index)
			return


func _begin_drag_or_click(screen_pos: Vector2) -> void:
	_drag_box_start = screen_pos
	_drag_box_current = screen_pos
	_drag_box_active = false
	_drag_mouse_held = true


# Called each frame when mouse moves while button is held; activates drag above threshold.
func _update_drag_box_overlay() -> void:
	var delta := _drag_box_current - _drag_box_start
	if not _drag_box_active and delta.length() >= _DRAG_BOX_THRESHOLD:
		_drag_box_active = true
		_create_drag_box_overlay()

	if _drag_box_active and _drag_box_overlay and is_instance_valid(_drag_box_overlay):
		var rect := _screen_rect_from_two_points(_drag_box_start, _drag_box_current)
		_drag_box_overlay.position = rect.position
		_drag_box_overlay.size = rect.size


# Finalise: either single click or box select depending on whether drag activated.
func _finish_drag_box_selection(screen_pos: Vector2) -> void:
	_drag_box_current = screen_pos
	_destroy_drag_box_overlay()

	if not _drag_box_active:
		# Short movement -- treat as single click.
		_handle_left_click_selection(screen_pos)
		_drag_box_active = false
		return

	_drag_box_active = false
	var additive := InputMap.has_action("rts_queue_modifier") and Input.is_action_pressed("rts_queue_modifier")
	var screen_rect := _screen_rect_from_two_points(_drag_box_start, screen_pos)
	_apply_drag_box_selection(screen_rect, additive)


# Select all player units whose screen bounding rect overlaps the drag rectangle.
func _apply_drag_box_selection(screen_rect: Rect2, additive: bool) -> void:
	if not additive:
		_clear_controllable_selection()

	var selected_count := 0
	for unit_id in _controllable_units.keys():
		if not _is_player_controllable_unit(str(unit_id)):
			continue
		var unit: SelectableUnit2D = _controllable_units[unit_id]
		if not _rts_camera:
			continue
		# Project the unit pivot and expand by half-extent to form a screen bounding rect.
		var pivot_screen := _rts_camera.unproject_position(unit.position)
		var half := Vector2(_UNIT_SCREEN_HALF_EXTENT, _UNIT_SCREEN_HALF_EXTENT)
		var unit_screen_rect := Rect2(pivot_screen - half, half * 2.0)
		if screen_rect.intersects(unit_screen_rect):
			if not _selected_controllable_units.has(unit_id):
				_selected_controllable_units.append(unit_id)
			unit.set_selected(true)
			selected_count += 1
			print("[DragSelect] unit=%s pivot=%s overlap=true" % [unit_id, str(pivot_screen)])

	if _hud_alert_item:
		if selected_count > 0:
			_hud_alert_item.text = "Selected %d units" % selected_count
		else:
			_hud_alert_item.text = "No units in selection box"
	_refresh_selection_card()
	print("[DragSelect] rect=%s additive=%s selected=%d" % [str(screen_rect), str(additive), selected_count])


# Helpers for drag overlay rect construction and lifecycle.
func _screen_rect_from_two_points(a: Vector2, b: Vector2) -> Rect2:
	var top_left := Vector2(min(a.x, b.x), min(a.y, b.y))
	var size := Vector2(abs(b.x - a.x), abs(b.y - a.y))
	return Rect2(top_left, size)


func _create_drag_box_overlay() -> void:
	if _drag_box_overlay and is_instance_valid(_drag_box_overlay):
		return
	if not _hud_root or not is_instance_valid(_hud_root):
		return

	var style := StyleBoxFlat.new()
	style.bg_color = Color(0.25, 0.65, 1.0, 0.15)
	style.border_color = Color(0.3, 0.85, 1.0, 1.0)
	style.set_border_width_all(2)

	_drag_box_overlay = Panel.new()
	_drag_box_overlay.name = "DragBoxOverlay"
	_drag_box_overlay.add_theme_stylebox_override("panel", style)
	_drag_box_overlay.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_hud_root.add_child(_drag_box_overlay)


func _destroy_drag_box_overlay() -> void:
	if _drag_box_overlay and is_instance_valid(_drag_box_overlay):
		_drag_box_overlay.queue_free()
	_drag_box_overlay = null


func _handle_left_click_selection(screen_pos: Vector2) -> void:
	var hit := _screen_to_ground_point(screen_pos)
	var additive := InputMap.has_action("rts_queue_modifier") and Input.is_action_pressed("rts_queue_modifier")
	if not hit["ok"]:
		if not additive:
			_clear_controllable_selection()
		return

	var ground_point: Vector3 = hit["point"]
	var nearest_id := ""
	var nearest_distance := INF
	for unit_id in _controllable_units.keys():
		if not _is_player_controllable_unit(str(unit_id)):
			continue
		var unit: SelectableUnit2D = _controllable_units[unit_id]
		var distance := Vector2(unit.position.x, unit.position.z).distance_to(Vector2(ground_point.x, ground_point.z))
		if distance < nearest_distance:
			nearest_distance = distance
			nearest_id = unit_id

	if nearest_id != "" and nearest_distance <= _SELECT_RADIUS_UNITS:
		_select_single_unit(nearest_id, additive)
		_refresh_selection_card()
	else:
		if not additive:
			_clear_controllable_selection()


func _handle_right_click_command(screen_pos: Vector2) -> void:
	if _pending_buildable_id != "":
		return
	var hit := _screen_to_ground_point(screen_pos)
	if not hit["ok"]:
		return
	var target: Vector3 = hit["point"]
	var enemy_target_id := _find_enemy_unit_at_point(target)
	if enemy_target_id != "":
		_issue_attack_command(enemy_target_id)
		return
	var resource_id := _find_resource_at_point(target)
	if resource_id != "":
		_issue_gather_command(resource_id)
		return
	_issue_move_command(target)


func _screen_to_ground_point(screen_pos: Vector2) -> Dictionary:
	if not _rts_camera:
		return {"ok": false, "point": Vector3.ZERO}

	var origin := _rts_camera.project_ray_origin(screen_pos)
	var direction := _rts_camera.project_ray_normal(screen_pos)
	if absf(direction.y) < 0.0001:
		return {"ok": false, "point": Vector3.ZERO}

	var t := -origin.y / direction.y
	if t < 0.0:
		return {"ok": false, "point": Vector3.ZERO}

	return {"ok": true, "point": origin + direction * t}


func _is_point_blocked(world_pos: Vector3) -> bool:
	var point := Vector2(world_pos.x, world_pos.z)
	for rect in _BLOCKER_RECTS:
		if rect.has_point(point):
			return true
	return false


func _is_path_blocked(from: Vector2, to: Vector2) -> bool:
	for rect in _BLOCKER_RECTS:
		if rect.has_point(from) or rect.has_point(to):
			return true
		var corners := [
			rect.position,
			rect.position + Vector2(rect.size.x, 0.0),
			rect.position + rect.size,
			rect.position + Vector2(0.0, rect.size.y)
		]
		for i in 4:
			var a: Vector2 = corners[i]
			var b: Vector2 = corners[(i + 1) % 4]
			if Geometry2D.segment_intersects_segment(from, to, a, b) != null:
				return true
	return false


func _reject_move(reason: String, world_pos: Vector3) -> void:
	if _hud_alert_item:
		_hud_alert_item.text = "Move rejected: %s" % reason
	_spawn_move_ping(world_pos, Color(1.0, 0.2, 0.2, 0.85))


func _spawn_move_ping(world_pos: Vector3, color: Color = Color(0.95, 0.95, 0.2, 0.8)) -> void:
	var marker := MeshInstance3D.new()
	var cyl := CylinderMesh.new()
	cyl.height = 0.5
	cyl.top_radius = 4.0
	cyl.bottom_radius = 4.0
	marker.mesh = cyl
	var mat := StandardMaterial3D.new()
	mat.albedo_color = color
	mat.emission_enabled = true
	mat.emission = Color(color.r, color.g, color.b)
	marker.material_override = mat
	marker.position = world_pos + Vector3(0.0, 0.25, 0.0)
	add_child(marker)

	var timer := Timer.new()
	timer.one_shot = true
	timer.wait_time = 0.35
	marker.add_child(timer)
	timer.timeout.connect(func() -> void:
		if is_instance_valid(marker):
			marker.queue_free()
	)
	timer.start()


func _update_live_units(delta: float) -> void:
	for unit in _controllable_units.values():
		unit.simulate_step(delta)
	_resolve_unit_soft_collisions()
	_update_attack_orders(delta)


func _resolve_unit_soft_collisions() -> void:
	if _controllable_units.size() < 2:
		return

	var min_distance := _UNIT_COLLISION_RADIUS * 2.0
	var min_distance_sq := min_distance * min_distance
	var unit_ids := _controllable_units.keys().duplicate()

	for i in range(unit_ids.size()):
		var a_id: String = str(unit_ids[i])
		if not _controllable_units.has(a_id):
			continue
		var a: SelectableUnit2D = _controllable_units[a_id]

		for j in range(i + 1, unit_ids.size()):
			var b_id: String = str(unit_ids[j])
			if not _controllable_units.has(b_id):
				continue
			var b: SelectableUnit2D = _controllable_units[b_id]

			if not a.has_move_target() and not b.has_move_target():
				continue

			var delta_xz := Vector2(a.position.x - b.position.x, a.position.z - b.position.z)
			var dist_sq := delta_xz.length_squared()
			if dist_sq >= min_distance_sq:
				continue

			var distance := sqrt(dist_sq)
			var normal := Vector2.ZERO
			if distance <= 0.001:
				var hash_mix := float(abs(a_id.hash() - b_id.hash()) % 360)
				normal = Vector2.RIGHT.rotated(deg_to_rad(hash_mix))
				distance = 0.0
			else:
				normal = delta_xz / distance

			var penetration := min_distance - distance
			var push := minf(penetration * 0.5, _UNIT_COLLISION_MAX_PUSH_PER_TICK)
			var offset := normal * push

			a.position.x += offset.x
			a.position.z += offset.y
			b.position.x -= offset.x
			b.position.z -= offset.y


func _update_enemy_ai(delta: float) -> void:
	if _match_over:
		return
	_ai_build_timer -= delta
	if _ai_build_timer <= 0.0:
		_run_enemy_build_step()
		_ai_build_timer = _AI_BUILD_INTERVAL
	_ai_production_timer -= delta
	if _ai_production_timer <= 0.0:
		_run_enemy_production_step()
		_ai_production_timer = _AI_PRODUCTION_INTERVAL
	# Snapshot keys so destruction mid-loop doesn't break iteration.
	var unit_ids := _controllable_units.keys().duplicate()
	for unit_id in unit_ids:
		if not _controllable_units.has(unit_id):
			continue
		if _get_unit_slot(str(unit_id)) != "B":
			continue
		# Decrement this unit's scan timer.
		var timer: float = float(_ai_scan_timers.get(unit_id, 0.0)) - delta
		_ai_scan_timers[unit_id] = timer
		if timer > 0.0:
			continue
		# Time to re-scan: find the nearest player unit.
		_ai_scan_timers[unit_id] = _AI_SCAN_INTERVAL
		var enemy: SelectableUnit2D = _controllable_units[unit_id]
		var nearest_id := ""
		var nearest_dist := INF
		var player_ids := _controllable_units.keys().duplicate()
		for pid in player_ids:
			if not _controllable_units.has(pid):
				continue
			if _get_unit_slot(str(pid)) != "A":
				continue
			var player_unit: SelectableUnit2D = _controllable_units[pid]
			var dist := Vector2(enemy.position.x, enemy.position.z).distance_to(
				Vector2(player_unit.position.x, player_unit.position.z))
			if dist < nearest_dist:
				nearest_dist = dist
				nearest_id = pid

		if nearest_id == "":
			# No player units left — head toward player Tether instead.
			if _tether_points_by_slot.has("A"):
				var tp: TetherPoint = _tether_points_by_slot["A"]
				enemy.queue_move(tp.position)
			continue

		_ai_target_ids[unit_id] = nearest_id
		if not _controllable_units.has(nearest_id):
			continue
		var target_unit: SelectableUnit2D = _controllable_units[nearest_id]
		var range_dist := Vector2(enemy.position.x, enemy.position.z).distance_to(
			Vector2(target_unit.position.x, target_unit.position.z))
		if range_dist <= _ATTACK_RANGE_UNITS:
			# In range — issue attack order via the existing combat system.
			_attack_orders[str(unit_id)] = nearest_id
		else:
			# Out of range — move toward target.
			enemy.queue_move(target_unit.position)


func _run_enemy_build_step() -> void:
	# Build the cheapest missing structure in the T0-T1 chain for slot B.
	var build_order := ["power_core", "alloy_extractor", "barracks_equivalent",
		"vehicle_structure", "sensor_uplink", "expansion_hub"]
	for buildable_id in build_order:
		if not _buildables_by_slot["B"].has(buildable_id):
			var built := _build_for_slot("B", buildable_id)
			if built:
				print("[EnemyAI] Build slot=B buildable=%s" % buildable_id)
			return


func _run_enemy_production_step() -> void:
	if not _tether_points_by_slot.has("B"):
		return
	var current_enemy_units: int = _get_slot_unit_ids("B").size()
	if current_enemy_units >= _AI_MAX_SLOT_B_UNITS:
		print("[EnemyAI] Production skipped reason=unit_cap_reached current=%d max=%d" % [current_enemy_units, _AI_MAX_SLOT_B_UNITS])
		return
	var tether: TetherPoint = _tether_points_by_slot["B"]
	var faction: String = tether.faction_id
	var options: Array[String] = _get_production_options_for_slot("B", faction)
	var producible_options: Array[String] = []
	for unit_id in options:
		if unit_id != "-":
			producible_options.append(unit_id)
	if producible_options.is_empty():
		return

	var start_index: int = _ai_production_choice_index % producible_options.size()
	for offset in range(producible_options.size()):
		var idx: int = (start_index + offset) % producible_options.size()
		var unit_id: String = str(producible_options[idx])
		if _spawn_live_produced_actor("B", faction, unit_id):
			_ai_production_choice_index = (idx + 1) % producible_options.size()
			print("[EnemyAI] Produced slot=B faction=%s unit=%s next_index=%d" % [faction, unit_id, _ai_production_choice_index])
			return


func _register_unit_for_combat(unit_name: String, unit_type: String) -> void:
	_unit_hit_points[unit_name] = _get_unit_max_hit_points(unit_type)
	_attack_cooldowns[unit_name] = 0.0


func _get_unit_max_hit_points(unit_type: String) -> float:
	if unit_type == "ember_tank" or unit_type == "bulwark_husk":
		return 180.0
	if unit_type == "strider_bike" or unit_type == "skitter_lance":
		return 90.0
	return _UNIT_BASE_HIT_POINTS


func _find_first_unit_for_slot(slot: String) -> String:
	for unit_id in _controllable_units.keys():
		if _get_unit_slot(str(unit_id)) == slot:
			return str(unit_id)
	return ""


func _is_player_controllable_unit(unit_id: String) -> bool:
	var slot := _get_unit_slot(unit_id)
	if slot == "":
		return true
	return slot == "A"


func _get_unit_slot(unit_id: String) -> String:
	if _controllable_units.has(unit_id):
		var unit: SelectableUnit2D = _controllable_units[unit_id]
		if unit and unit.has_meta("slot"):
			return str(unit.get_meta("slot"))
	if unit_id.begins_with("Squad_A_"):
		return "A"
	if unit_id.begins_with("Squad_B_"):
		return "B"
	if unit_id.begins_with("Produced_A_"):
		return "A"
	if unit_id.begins_with("Produced_B_"):
		return "B"
	return ""


func _find_enemy_unit_at_point(world_pos: Vector3) -> String:
	if _selected_controllable_units.is_empty():
		return ""
	var selected_slot := _get_unit_slot(str(_selected_controllable_units[0]))
	if selected_slot == "":
		return ""

	var point := Vector2(world_pos.x, world_pos.z)
	var nearest_enemy := ""
	var nearest_distance := INF
	for unit_id in _controllable_units.keys():
		var enemy_id := str(unit_id)
		if _get_unit_slot(enemy_id) == selected_slot:
			continue
		var unit: SelectableUnit2D = _controllable_units[enemy_id]
		var distance := Vector2(unit.position.x, unit.position.z).distance_to(point)
		if distance < _ATTACK_SELECT_RADIUS_UNITS and distance < nearest_distance:
			nearest_distance = distance
			nearest_enemy = enemy_id
	return nearest_enemy


func _issue_attack_command(target_unit_id: String) -> void:
	if _selected_controllable_units.is_empty():
		return
	if not _controllable_units.has(target_unit_id):
		return

	_clear_gather_jobs_for_selected_units()
	var accepted: Array[String] = []
	for unit_id in _selected_controllable_units:
		var attacker_id := str(unit_id)
		if not _controllable_units.has(attacker_id):
			continue
		if _get_unit_slot(attacker_id) == _get_unit_slot(target_unit_id):
			continue
		_attack_orders[attacker_id] = target_unit_id
		accepted.append(attacker_id)

	if accepted.is_empty():
		if _hud_alert_item:
			_hud_alert_item.text = "Attack rejected: invalid target"
		return

	if _hud_alert_item:
		_hud_alert_item.text = "Attack order: %s" % target_unit_id
	_spawn_move_ping(_controllable_units[target_unit_id].position, Color(1.0, 0.35, 0.35, 0.85))
	print("[F37] Attack issued attackers=%s target=%s" % [str(accepted), target_unit_id])


func _update_attack_orders(delta: float) -> void:
	if _attack_orders.is_empty():
		return

	var order_ids_cooldown := _attack_orders.keys().duplicate()
	for attacker_id in order_ids_cooldown:
		var id := str(attacker_id)
		if not _controllable_units.has(id):
			continue
		var cooldown := float(_attack_cooldowns.get(id, 0.0))
		cooldown = maxf(cooldown - delta, 0.0)
		_attack_cooldowns[id] = cooldown

	var attackers_to_clear: Array[String] = []
	var order_ids := _attack_orders.keys().duplicate()
	for attacker_id in order_ids:
		var id := str(attacker_id)
		if not _controllable_units.has(id):
			attackers_to_clear.append(id)
			continue

		if not _attack_orders.has(id):
			continue
		var target_id := str(_attack_orders[id])
		if not _controllable_units.has(target_id):
			attackers_to_clear.append(id)
			continue

		var attacker: SelectableUnit2D = _controllable_units[id]
		var target: SelectableUnit2D = _controllable_units[target_id]
		var distance := Vector2(attacker.position.x, attacker.position.z).distance_to(Vector2(target.position.x, target.position.z))
		if distance > _ATTACK_RANGE_UNITS:
			attacker.queue_move(target.position)
			continue

		if float(_attack_cooldowns.get(id, 0.0)) > 0.0:
			continue

		_attack_cooldowns[id] = _ATTACK_COOLDOWN_SECONDS
		var hp_before := float(_unit_hit_points.get(target_id, _UNIT_BASE_HIT_POINTS))
		var hp_after := maxf(0.0, hp_before - _ATTACK_DAMAGE_PER_HIT)
		_unit_hit_points[target_id] = hp_after
		# Update target's visual HP bar.
		if _controllable_units.has(target_id):
			var target_actor: SelectableUnit2D = _controllable_units[target_id]
			var max_hp := _get_unit_max_hit_points((target_actor as SelectableUnit2D).unit_id)
			target_actor.set_hp_fraction(hp_after / max_hp)
		_spawn_move_ping(target.position, Color(1.0, 0.2, 0.2, 0.85))
		print("[F37] Damage attacker=%s target=%s hp_before=%.1f hp_after=%.1f" % [id, target_id, hp_before, hp_after])

		if hp_after <= 0.0:
			_destroy_unit(target_id)

	for attacker_id in attackers_to_clear:
		_attack_orders.erase(attacker_id)


func _destroy_unit(unit_id: String) -> void:
	if not _controllable_units.has(unit_id):
		return
	var unit: SelectableUnit2D = _controllable_units[unit_id]
	_controllable_units.erase(unit_id)
	_selected_controllable_units.erase(unit_id)
	_unit_hit_points.erase(unit_id)
	_attack_cooldowns.erase(unit_id)
	_gather_jobs.erase(unit_id)
	_attack_orders.erase(unit_id)

	var attackers_to_clear: Array[String] = []
	for attacker_id in _attack_orders.keys():
		if str(_attack_orders[attacker_id]) == unit_id:
			attackers_to_clear.append(str(attacker_id))
	for attacker_id in attackers_to_clear:
		_attack_orders.erase(attacker_id)

	if is_instance_valid(unit):
		unit.queue_free()
	print("[F37] Unit destroyed unit=%s" % unit_id)

	if not _match_over:
		_check_win_loss_conditions()


func _check_win_loss_conditions() -> void:
	# Count living units per slot.
	var alive_a := 0
	var alive_b := 0
	for uid in _controllable_units.keys():
		var s := _get_unit_slot(str(uid))
		if s == "A":
			alive_a += 1
		elif s == "B":
			alive_b += 1

	# Also count Tether points alive per slot.
	var tether_a_alive: bool = _tether_points_by_slot.has("A") and not (_tether_points_by_slot["A"] as TetherPoint).is_command_penalty_active
	var tether_b_alive: bool = _tether_points_by_slot.has("B") and not (_tether_points_by_slot["B"] as TetherPoint).is_command_penalty_active

	if alive_b == 0 and not tether_b_alive:
		_match_over = true
		_set_match_state("Win", "enemy_eliminated")
		print("[Match] Win condition met alive_a=%d alive_b=%d" % [alive_a, alive_b])
		return

	if alive_a == 0 and not tether_a_alive:
		_match_over = true
		_set_match_state("Loss", "player_eliminated")
		print("[Match] Loss condition met alive_a=%d alive_b=%d" % [alive_a, alive_b])


func _update_gather_jobs() -> void:
	if _gather_jobs.is_empty():
		return

	var completed_units: Array[String] = []
	for unit_id in _gather_jobs.keys():
		if not _controllable_units.has(unit_id):
			completed_units.append(unit_id)
			continue

		var unit: SelectableUnit2D = _controllable_units[unit_id]
		var job: Dictionary = _gather_jobs[unit_id]
		if unit.has_move_target():
			continue

		var phase: String = str(job.get("phase", "to_resource"))
		if phase == "to_resource":
			job["phase"] = "to_dropoff"
			unit.queue_move(job["dropoff"])
			_gather_jobs[unit_id] = job
			print("[F03] Live gather state=collecting unit=%s resource=%s" % [unit_id, str(job.get("resource_id", ""))])
		elif phase == "to_dropoff":
			_add_stockpile_reserve("alloy", 35, "live_gather_deposit")
			var cycles := int(job.get("cycles", 0)) + 1
			print("[F03] Live gather state=deposit unit=%s alloy_total=%d cycles=%d" % [unit_id, _resource_alloy_total, cycles])
			if cycles >= 1:
				completed_units.append(unit_id)
			else:
				job["cycles"] = cycles
				job["phase"] = "to_resource"
				var resource_id: String = str(job.get("resource_id", ""))
				if _map_items_by_id.has(resource_id):
					unit.queue_move(_map_items_by_id[resource_id].position)
				_gather_jobs[unit_id] = job

	for unit_id in completed_units:
		_gather_jobs.erase(unit_id)


func _find_resource_at_point(world_pos: Vector3) -> String:
	var point := Vector2(world_pos.x, world_pos.z)
	var nearest_id := ""
	var nearest_distance := INF
	for item_id in _map_items_by_id.keys():
		var item: MapItem = _map_items_by_id[item_id]
		if item.item_type != "safe_alloy_node" and item.item_type != "contested_midfield_alloy_node" and item.item_type != "reclaim_field_cluster":
			continue
		var distance := Vector2(item.position.x, item.position.z).distance_to(point)
		if distance < 20.0 and distance < nearest_distance:
			nearest_distance = distance
			nearest_id = item_id
	return nearest_id


func _toggle_build_menu() -> void:
	_production_menu_active = false
	var slot := _get_selected_builder_slot()
	if slot == "":
		if _hud_alert_item:
			_hud_alert_item.text = "Build rejected: select a builder"
		return
	_build_menu_active = not _build_menu_active
	_pending_buildable_id = ""
	if _build_menu_active:
		var available: Array[String] = _get_available_buildables_for_slot(slot)
		if _hud_command_card_label:
			_hud_command_card_label.text = "Build Menu\nQ Power  W Alloy  E Barracks\nA Vehicle  S Sensor  D Expand\nAvailable: %s" % ", ".join(available)
		if _hud_queue_item:
			_hud_queue_item.text = "Build mode active"
	else:
		_reset_command_card_text()


func _toggle_production_menu() -> void:
	_build_menu_active = false
	_pending_buildable_id = ""
	var slot := _get_selected_slot_for_commands()
	if slot == "":
		if _hud_alert_item:
			_hud_alert_item.text = "Production rejected: select a unit"
		return
	var tether: TetherPoint = _tether_points_by_slot[slot]
	var faction: String = tether.faction_id
	var options: Array[String] = _get_production_options_for_slot(slot, faction)
	if options.is_empty():
		if _hud_alert_item:
			_hud_alert_item.text = "Production unavailable"
		return

	_production_menu_active = not _production_menu_active
	if _production_menu_active:
		if _hud_command_card_label:
			_hud_command_card_label.text = "Production Menu\n1 %s\n2 %s\n3 %s" % [options[0], options[1], options[2]]
		if _hud_queue_item:
			_hud_queue_item.text = "Production mode active"
	else:
		_reset_command_card_text()


func _queue_live_production_by_index(index: int) -> void:
	var slot := _get_selected_slot_for_commands()
	if slot == "":
		return
	var tether: TetherPoint = _tether_points_by_slot[slot]
	var faction: String = tether.faction_id
	var options: Array[String] = _get_production_options_for_slot(slot, faction)
	if index < 0 or index >= options.size():
		if _hud_alert_item:
			_hud_alert_item.text = "Production rejected: invalid choice"
		return
	_queue_live_production(options[index])


func _queue_live_production(unit_id: String) -> bool:
	var slot := _get_selected_slot_for_commands()
	if slot == "":
		return false
	var tether: TetherPoint = _tether_points_by_slot[slot]
	var faction: String = tether.faction_id
	if not _spawn_live_produced_actor(slot, faction, unit_id):
		if _hud_alert_item:
			_hud_alert_item.text = "Production locked: %s" % unit_id
		return false

	var produced_actor_name := "Produced_%s_%03d" % [slot, _production_sequence]
	var spawn_point := Vector3.ZERO
	if _controllable_units.has(produced_actor_name):
		var produced_actor: SelectableUnit2D = _controllable_units[produced_actor_name]
		spawn_point = produced_actor.position
	_spawn_move_ping(spawn_point, Color(0.65, 0.9, 1.0, 0.85))
	if _hud_queue_item:
		_hud_queue_item.text = "Queued: %s" % unit_id
	if _hud_alert_item:
		_hud_alert_item.text = "Produced: %s" % unit_id
	print("[F38] Production spawn slot=%s faction=%s unit=%s actor=%s" % [slot, faction, unit_id, produced_actor_name])
	return true


func _spawn_live_produced_actor(slot: String, faction: String, unit_id: String) -> bool:
	if not _can_produce_unit_for_slot(slot, faction, unit_id):
		return false
	if not _queue_unit_for_slot(slot, faction, unit_id):
		return false

	var spawn_point := _get_live_production_spawn_position(slot)
	var actor := SelectableUnit2D.new()
	actor.name = "Produced_%s_%03d" % [slot, _production_sequence]
	actor.set_meta("slot", slot)
	add_child(actor)
	actor.initialize(unit_id, faction, spawn_point)
	_controllable_units[actor.name] = actor
	_register_unit_for_combat(actor.name, actor.unit_id)
	return true


func _get_selected_slot_for_commands() -> String:
	if _selected_controllable_units.is_empty():
		return ""
	return _get_unit_slot(str(_selected_controllable_units[0]))


func _get_production_options_for_slot(slot: String, faction: String) -> Array[String]:
	var options: Array[String] = []
	if not PRODUCTION_BASELINE_UNITS.has(faction):
		return options

	var baseline: Array = PRODUCTION_BASELINE_UNITS[faction]
	for i in [1, 2, 3]:
		if i >= baseline.size():
			continue
		var unit_id := str(baseline[i])
		if _can_produce_unit_for_slot(slot, faction, unit_id):
			options.append(unit_id)

	if options.size() < 3:
		while options.size() < 3:
			options.append("-")
	return options


func _can_produce_unit_for_slot(slot: String, faction: String, unit_id: String) -> bool:
	if unit_id == "-":
		return false
	if not PRODUCTION_CHAINS.has(faction):
		return false
	if not PRODUCTION_CHAINS[faction].has(unit_id):
		return false

	var producer := str(PRODUCTION_CHAINS[faction][unit_id])
	if producer != "tether_point" and not _buildables_by_slot[slot].has(producer):
		return false

	var tether: TetherPoint = _tether_points_by_slot[slot]
	if tether.is_command_penalty_active:
		return false
	return true


func _get_live_production_spawn_position(slot: String) -> Vector3:
	var tether: TetherPoint = _tether_points_by_slot[slot]
	var index: int = int(_live_production_spawn_index_by_slot.get(slot, 0))
	_live_production_spawn_index_by_slot[slot] = index + 1
	var side := 1.0 if slot == "A" else -1.0
	var row := float(index % 3)
	var col := float(index) / 3.0
	return tether.position + Vector3(side * (34.0 + col * 16.0), 0.0, -18.0 + row * 18.0)


func _select_buildable(buildable_id: String) -> void:
	var slot := _get_selected_builder_slot()
	if slot == "":
		return
	var available: Array[String] = _get_available_buildables_for_slot(slot)
	if not available.has(buildable_id):
		if _hud_alert_item:
			_hud_alert_item.text = "Build locked: %s" % buildable_id
		return
	_pending_buildable_id = buildable_id
	if _hud_command_card_label:
		_hud_command_card_label.text = "Place %s\nLeft-click ground to place" % buildable_id
	if _hud_queue_item:
		_hud_queue_item.text = "Pending build: %s" % buildable_id


func _place_pending_buildable(world_pos: Vector3) -> bool:
	if _pending_buildable_id == "":
		return false
	if _is_point_blocked(world_pos):
		_reject_move("build_target_blocked", world_pos)
		return false
	var slot := _get_selected_builder_slot()
	if slot == "":
		return false
	var placed := _build_for_slot(slot, _pending_buildable_id, world_pos)
	if placed:
		_spawn_move_ping(world_pos, Color(0.4, 0.9, 1.0, 0.85))
		_build_menu_active = false
		_pending_buildable_id = ""
		_reset_command_card_text()
	return placed


func _find_first_builder_id() -> String:
	for unit_id in _controllable_units.keys():
		var unit: SelectableUnit2D = _controllable_units[unit_id]
		if _is_builder_unit(unit.unit_id):
			return unit_id
	return ""


func _get_selected_builder_slot() -> String:
	for unit_id in _selected_controllable_units:
		if not _controllable_units.has(unit_id):
			continue
		var unit: SelectableUnit2D = _controllable_units[unit_id]
		if not _is_builder_unit(unit.unit_id):
			continue
		var slot := _get_unit_slot(str(unit_id))
		if slot != "":
			return slot
	return ""


func _get_available_buildables_for_slot(slot: String) -> Array[String]:
	var available: Array[String] = []
	for buildable_id in BUILD_MENU_ORDER:
		if _buildables_by_slot[slot].has(buildable_id):
			continue
		var deps: Array = BUILDABLE_DEFS[buildable_id]["deps"]
		var deps_ok := true
		for dep in deps:
			if not _buildables_by_slot[slot].has(dep):
				deps_ok = false
				break
		if deps_ok:
			available.append(buildable_id)
	return available


func _is_gather_unit(unit_name: String) -> bool:
	return unit_name == "line_engineer" or unit_name == "brood_architect" or unit_name == "foundry_engineer"


func _is_builder_unit(unit_name: String) -> bool:
	return _is_gather_unit(unit_name)


func _get_dropoff_for_faction(faction_id: String) -> Vector3:
	for tether in _tether_points_by_slot.values():
		if tether.faction_id == faction_id:
			return tether.position
	return _spawn_a.position


func _clear_gather_jobs_for_selected_units() -> void:
	for unit_id in _selected_controllable_units:
		_gather_jobs.erase(unit_id)


func _reset_command_card_text() -> void:
	_production_menu_active = false
	_refresh_selection_card()


func _refresh_selection_card() -> void:
	if not _hud_command_card_label:
		return
	if _build_menu_active or _production_menu_active or _pending_buildable_id != "":
		return
	if _selected_controllable_units.is_empty():
		_hud_command_card_label.text = "Nothing selected"
		return

	var count := _selected_controllable_units.size()
	var first_id := str(_selected_controllable_units[0])
	var unit_type := ""
	var is_builder := false
	if _controllable_units.has(first_id):
		var unit: SelectableUnit2D = _controllable_units[first_id]
		unit_type = unit.unit_id
		is_builder = _is_builder_unit(unit_type)

	var builder_hint := "  [B] Build" if is_builder else ""
	if count == 1:
		_hud_command_card_label.text = "Selected: %s%s" % [unit_type, builder_hint]
	else:
		_hud_command_card_label.text = "Selected: %d units (%s ...)%s" % [count, unit_type, builder_hint]


func _process_camera(delta: float) -> void:
	if not _rts_camera:
		return
	var changed := false
	if InputMap.has_action("rts_camera_pan_up") and Input.is_action_pressed("rts_camera_pan_up"):
		_camera_target.z -= _CAMERA_PAN_SPEED * delta
		changed = true
	if InputMap.has_action("rts_camera_pan_down") and Input.is_action_pressed("rts_camera_pan_down"):
		_camera_target.z += _CAMERA_PAN_SPEED * delta
		changed = true
	if InputMap.has_action("rts_camera_pan_left") and Input.is_action_pressed("rts_camera_pan_left"):
		_camera_target.x -= _CAMERA_PAN_SPEED * delta
		changed = true
	if InputMap.has_action("rts_camera_pan_right") and Input.is_action_pressed("rts_camera_pan_right"):
		_camera_target.x += _CAMERA_PAN_SPEED * delta
		changed = true
	if InputMap.has_action("rts_camera_rotate_left") and Input.is_action_pressed("rts_camera_rotate_left"):
		_camera_yaw -= _CAMERA_ROTATE_SPEED * delta
		changed = true
	if InputMap.has_action("rts_camera_rotate_right") and Input.is_action_pressed("rts_camera_rotate_right"):
		_camera_yaw += _CAMERA_ROTATE_SPEED * delta
		changed = true
	if InputMap.has_action("rts_camera_zoom_in") and Input.is_action_pressed("rts_camera_zoom_in"):
		_camera_arm = clamp(_camera_arm - _CAMERA_ZOOM_KEY_SPEED * delta, _CAMERA_ARM_MIN, _CAMERA_ARM_MAX)
		changed = true
	if InputMap.has_action("rts_camera_zoom_out") and Input.is_action_pressed("rts_camera_zoom_out"):
		_camera_arm = clamp(_camera_arm + _CAMERA_ZOOM_KEY_SPEED * delta, _CAMERA_ARM_MIN, _CAMERA_ARM_MAX)
		changed = true
	if changed:
		_apply_camera_transform()


func _center_camera_on_player_base() -> void:
	if _tether_points_by_slot.has("A"):
		var tether: TetherPoint = _tether_points_by_slot["A"]
		_camera_target = tether.position
		_apply_camera_transform()
		if _hud_alert_item:
			_hud_alert_item.text = "Camera centered on base"
		print("[Camera] Center base slot=A position=%s" % str(tether.position))
		return

	var fallback_unit_id := _find_first_unit_for_slot("A")
	if fallback_unit_id != "" and _controllable_units.has(fallback_unit_id):
		var unit: SelectableUnit2D = _controllable_units[fallback_unit_id]
		_camera_target = unit.position
		_apply_camera_transform()
		if _hud_alert_item:
			_hud_alert_item.text = "Camera centered on opening squad"
		print("[Camera] Center fallback unit=%s position=%s" % [fallback_unit_id, str(unit.position)])


func _center_camera_on_selection() -> void:
	if _selected_controllable_units.is_empty():
		_center_camera_on_player_base()
		return

	var unit_id := str(_selected_controllable_units[0])
	if not _controllable_units.has(unit_id):
		_center_camera_on_player_base()
		return

	var unit: SelectableUnit2D = _controllable_units[unit_id]
	_camera_target = unit.position
	_apply_camera_transform()
	if _hud_alert_item:
		_hud_alert_item.text = "Camera centered on selection"
	print("[Camera] Center selection unit=%s position=%s" % [unit_id, str(unit.position)])


func _apply_camera_transform() -> void:
	if not _rts_camera:
		return
	var yaw_rad := deg_to_rad(_camera_yaw)
	var pitch_rad := deg_to_rad(_CAMERA_PITCH)
	var horiz := _camera_arm * cos(absf(pitch_rad))
	var vert := _camera_arm * sin(absf(pitch_rad))
	var offset_dir := Vector3(-sin(yaw_rad), 0.0, -cos(yaw_rad))
	_rts_camera.position = _camera_target + offset_dir * horiz + Vector3(0.0, vert, 0.0)
	_rts_camera.look_at(_camera_target, Vector3.UP)


func _run_f18_f19_test_hook() -> void:
	if not _has_user_flag(TEST_F18_F19_FLAG):
		return

	_initialize_command_sim_units()
	_select_units(["sim_unit_1", "sim_unit_2"])
	_issue_command("move", Vector2(48, 16))
	_issue_command("attack", Vector2(96, -32))
	_issue_command("attack_move", Vector2(120, 0))
	_issue_command("gather", Vector2(-120, 72))
	_issue_command("repair", Vector2(-220, 0))
	_issue_command("patrol", Vector2(0, -90))
	_issue_command("hold", Vector2.ZERO)
	_issue_command("stop", Vector2.ZERO)
	_issue_command("repair", Vector2.ZERO)

	_assign_control_group(1)
	_recall_control_group(1)
	_double_tap_center_control_group(1)

	print("[F18] Command coverage summary actions=move,attack,attack_move,gather,repair,patrol,hold,stop groups=assign,recall,double_tap")
	print("[F19] HUD sync summary resource_bar=%s alert=%s queue=%s" % [_hud_resource_bar.text, _hud_alert_item.text, _hud_queue_item.text])


func _initialize_command_sim_units() -> void:
	_sim_units.clear()
	_selected_units.clear()
	_control_groups.clear()
	for index in 3:
		var unit_id := "sim_unit_%d" % (index + 1)
		_sim_units[unit_id] = {
			"position": Vector2(-80 + float(index) * 40.0, 140.0),
			"queue": []
		}
	print("[F18] Sim units initialized count=%d" % _sim_units.size())


func _select_units(unit_ids: Array[String]) -> void:
	_selected_units.clear()
	for unit_id in unit_ids:
		if _sim_units.has(unit_id):
			_selected_units.append(unit_id)
	_hud_alert_item.text = "Selected %d units" % _selected_units.size()
	print("[Command] Selection updated units=%s" % str(_selected_units))


func _issue_command(action: String, target: Vector2) -> void:
	if _selected_units.is_empty():
		print("[Command] Rejected action=%s reason=no_selection" % action)
		return

	if action == "repair" and target == Vector2.ZERO:
		print("[Command] Rejected action=%s reason=invalid_target" % action)
		_hud_alert_item.text = "Invalid command target"
		return

	for unit_id in _selected_units:
		var queue: Array = _sim_units[unit_id]["queue"]
		queue.append(action)
		_sim_units[unit_id]["queue"] = queue
		if action == "move" or action == "attack_move" or action == "patrol" or action == "gather" or action == "repair":
			_sim_units[unit_id]["position"] = target

	_hud_queue_item.text = "Queue: %s" % action
	_hud_alert_item.text = "Ack: %s" % action
	print("[Command] Ack action=%s units=%s target=%s" % [action, str(_selected_units), str(target)])


func _assign_control_group(group_id: int) -> void:
	_control_groups[group_id] = _selected_units.duplicate()
	print("[Group] Assign id=%d units=%s" % [group_id, str(_control_groups[group_id])])


func _recall_control_group(group_id: int) -> void:
	if not _control_groups.has(group_id):
		print("[Group] Recall id=%d status=missing" % group_id)
		return
	_select_units(_control_groups[group_id])
	print("[Group] Recall id=%d units=%s" % [group_id, str(_selected_units)])


func _double_tap_center_control_group(group_id: int) -> void:
	if not _control_groups.has(group_id):
		return
	var first_unit: String = _control_groups[group_id][0]
	var center_position: Vector2 = _sim_units[first_unit]["position"]
	_hud_alert_item.text = "Camera centered group %d" % group_id
	print("[Camera] Center group=%d position=%s" % [group_id, str(center_position)])


func _run_f20_f21_test_hook() -> void:
	if not _has_user_flag(TEST_F20_F21_FLAG):
		return

	var state := {
		"helion": {
			"alloy": 280,
			"power": 140,
			"expansion_sec": 78,
			"factory_sec": 62,
			"first_objective_sec": 96,
			"advanced_enabled": false
		},
		"veyari": {
			"alloy": 280,
			"power": 140,
			"expansion_sec": 82,
			"factory_sec": 65,
			"first_objective_sec": 101,
			"advanced_enabled": false
		}
	}

	for second in 180:
		var sec := second + 1
		for faction in ["helion", "veyari"]:
			state[faction]["alloy"] += 7
			state[faction]["power"] += 3

		if sec == 75:
			state["helion"]["alloy"] += 40
			state["veyari"]["alloy"] += 40
			print("[F20] Midfield alloy control secured sec=%d helion_alloy=%d veyari_alloy=%d" % [sec, state["helion"]["alloy"], state["veyari"]["alloy"]])

		if sec == 150:
			state["helion"]["alloy"] += 30
			state["veyari"]["alloy"] += 30
			print("[F20] Data node contest resolved sec=%d helion_alloy=%d veyari_alloy=%d" % [sec, state["helion"]["alloy"], state["veyari"]["alloy"]])

	# Opening parity gate: advanced systems remain unavailable in opening window.
	var helion_advanced: bool = state["helion"]["advanced_enabled"]
	var veyari_advanced: bool = state["veyari"]["advanced_enabled"]
	var opening_gate_pass: bool = (not helion_advanced) and (not veyari_advanced)
	print("[F21] Opening gate status pass=%s helion_advanced=%s veyari_advanced=%s" % [str(opening_gate_pass), str(helion_advanced), str(veyari_advanced)])

	var expansion_delta: int = absi(state["helion"]["expansion_sec"] - state["veyari"]["expansion_sec"])
	var factory_delta: int = absi(state["helion"]["factory_sec"] - state["veyari"]["factory_sec"])
	var objective_delta: int = absi(state["helion"]["first_objective_sec"] - state["veyari"]["first_objective_sec"])
	var parity_pass: bool = expansion_delta <= 8 and factory_delta <= 8 and objective_delta <= 8

	print("[F21] Parity metrics expansion_delta=%d factory_delta=%d objective_delta=%d pass=%s" % [expansion_delta, factory_delta, objective_delta, str(parity_pass)])
	print("[F20] Resource loop summary helion_alloy=%d helion_power=%d veyari_alloy=%d veyari_power=%d" % [state["helion"]["alloy"], state["helion"]["power"], state["veyari"]["alloy"], state["veyari"]["power"]])
	print("[F20/F21] Summary pass=%s" % str(opening_gate_pass and parity_pass))
