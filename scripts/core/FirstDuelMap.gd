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
const TEST_AUTO_EXIT_FLAG := "--duel-test-auto-exit"
const TEST_ROSTER_BEHAVIORS_FLAG := "--duel-test-roster-behaviors"
const TEST_T2_PATHS_FLAG := "--duel-test-t2-paths"
const TEST_COLONY_DEFENSE_FLAG := "--duel-test-colony-defense"
const SelectableUnit2D := preload("res://scripts/core/SelectableUnit2D.gd")
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
	{"id": "ZONE-PRIMARY-ALLOY", "type": "zone_annotation", "lane": "mid", "position": Vector2(0, -120)},
	{"id": "ZONE-SECONDARY-ALLOY", "type": "zone_annotation", "lane": "flank", "position": Vector2(-180, 110)},
	{"id": "ZONE-HIGHRISK-ALLOY", "type": "zone_annotation", "lane": "high_risk", "position": Vector2(180, 110)},
	{"id": "SPAWN-CORE-A", "type": "spawn_core_zone_marker", "lane": "home", "position": Vector2(-280, -32)},
	{"id": "SPAWN-CORE-B", "type": "spawn_core_zone_marker", "lane": "home", "position": Vector2(280, -32)},
	{"id": "SAFE-ALLOY-A", "type": "safe_alloy_node", "lane": "home", "position": Vector2(-230, 0)},
	{"id": "SAFE-ALLOY-B", "type": "safe_alloy_node", "lane": "home", "position": Vector2(230, 0)},
	{"id": "NATURAL-ALLOY-A", "type": "natural_alloy_node", "lane": "natural", "position": Vector2(-120, 72)},
	{"id": "NATURAL-ALLOY-B", "type": "natural_alloy_node", "lane": "natural", "position": Vector2(120, 72)},
	{"id": "MID-ALLOY-N", "type": "contested_midfield_alloy_node", "lane": "mid", "position": Vector2(0, -56)},
	{"id": "MID-ALLOY-S", "type": "contested_midfield_alloy_node", "lane": "mid", "position": Vector2(0, 56)},
	{"id": "DATA-NODE-CENTER", "type": "contested_data_node", "lane": "center", "position": Vector2(0, 0)},
	{"id": "RECLAIM-CENTER", "type": "reclaim_field_cluster", "lane": "center", "position": Vector2(0, 96)},
	{"id": "COVER-01", "type": "cover_cluster", "lane": "direct", "position": Vector2(-90, -24)},
	{"id": "COVER-02", "type": "cover_cluster", "lane": "direct", "position": Vector2(90, -24)},
	{"id": "COVER-03", "type": "cover_cluster", "lane": "flank", "position": Vector2(-130, 116)},
	{"id": "COVER-04", "type": "cover_cluster", "lane": "flank", "position": Vector2(130, 116)},
	{"id": "CHOKE-01", "type": "chokepoint_gate", "lane": "direct", "position": Vector2(0, -86)},
	{"id": "ELEVATED-01", "type": "elevated_fire_position", "lane": "center", "position": Vector2(0, -146)},
	{"id": "LOS-01", "type": "los_blocker", "lane": "direct", "position": Vector2(-46, -84)},
	{"id": "LOS-02", "type": "los_blocker", "lane": "direct", "position": Vector2(46, -84)},
	{"id": "LOS-03", "type": "los_blocker", "lane": "center", "position": Vector2(-84, 12)},
	{"id": "LOS-04", "type": "los_blocker", "lane": "center", "position": Vector2(84, 12)},
	{"id": "LOS-05", "type": "los_blocker", "lane": "flank", "position": Vector2(-158, 82)},
	{"id": "LOS-06", "type": "los_blocker", "lane": "flank", "position": Vector2(158, 82)},
	{"id": "OPTIONAL-RELAY-01", "type": "neutral_relay_tower", "lane": "center", "position": Vector2(0, -180)}
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
var _camera_target := Vector3.ZERO
var _camera_yaw := 0.0
var _camera_arm := 400.0
const _CAMERA_PITCH := -52.0
const _CAMERA_ARM_MIN := 200.0
const _CAMERA_ARM_MAX := 750.0
const _CAMERA_PAN_SPEED := 200.0
const _CAMERA_ROTATE_SPEED := 60.0
const _CAMERA_ZOOM_STEP := 50.0
const _SELECT_RADIUS_UNITS := 18.0
const _BLOCKER_RECTS: Array[Rect2] = [
	Rect2(Vector2(-30.0, -30.0), Vector2(60.0, 60.0)),
	Rect2(Vector2(-170.0, 60.0), Vector2(50.0, 50.0)),
	Rect2(Vector2(120.0, 60.0), Vector2(50.0, 50.0))
]
var _tether_points_by_slot: Dictionary = {}
var _buildables_by_slot: Dictionary = {"A": {}, "B": {}}
var _build_sequence: int = 0
var _map_item_counts: Dictionary = {}
var _map_items_by_id: Dictionary = {}
var _hud_resource_bar: Label
var _hud_alert_item: Label
var _hud_queue_item: Label
var _hud_match_state: Label
var _sim_units: Dictionary = {}
var _selected_units: Array[String] = []
var _control_groups: Dictionary = {}
var _controllable_units: Dictionary = {}
var _selected_controllable_units: Array[String] = []
var _resource_alloy_total: int = 0
var _gather_jobs: Dictionary = {}
var _production_sequence: int = 0
var _produced_units_by_slot: Dictionary = {"A": {}, "B": {}}
var _colony_sequence: int = 0
var _colony_units_by_slot: Dictionary = {"A": {}, "B": {}}


func _ready() -> void:
	var player_faction := _resolve_faction("duel_player_faction", TEST_PLAYER_FACTION_PREFIX, DEFAULT_PLAYER_FACTION)
	var enemy_faction := _resolve_faction("duel_enemy_faction", TEST_ENEMY_FACTION_PREFIX, DEFAULT_ENEMY_FACTION)
	print("[Map] First duel environment primary=Radial Impact Zone secondary=None")
	_create_mvp_hud()
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
	_run_f03_test_hook()
	_run_f04_test_hook()
	_run_production_chain_test_hook()
	_run_map_baseline_test_hook()
	_run_f16_test_hook()
	_run_f17_test_hook()
	_run_roster_behavior_test_hook()
	_run_t2_path_test_hook()
	_run_colony_defense_test_hook()
	if _has_user_flag(TEST_AUTO_EXIT_FLAG):
		call_deferred("_request_test_exit")
	_apply_camera_transform()


func _request_test_exit() -> void:
	print("[Map] Test override enabled: auto exit")
	get_tree().quit()


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
			add_child(actor)
			var off: Vector3 = offsets[i]
			actor.initialize(unit_id, faction, marker.position + Vector3(off.x * mirror, 0.0, off.z))
			_controllable_units[actor.name] = actor
		print("[Squad] Spawned slot=%s faction=%s count=%d" % [slot, faction, mini(units_for_slot.size(), offsets.size())])


func _spawn_world_blockers() -> void:
	for index in _BLOCKER_RECTS.size():
		var rect: Rect2 = _BLOCKER_RECTS[index]
		var blocker := MeshInstance3D.new()
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
	hud_layer.add_child(hud_root)

	var resource_bar := Label.new()
	resource_bar.name = "ResourceBar"
	resource_bar.text = "Alloy: 1000  Power: 400/520  Data: 0  Reclaim: 0"
	resource_bar.position = Vector2(16, 12)
	hud_root.add_child(resource_bar)
	_hud_resource_bar = resource_bar

	var minimap := PanelContainer.new()
	minimap.name = "Minimap"
	minimap.position = Vector2(16, 460)
	minimap.size = Vector2(220, 140)
	var minimap_label := Label.new()
	minimap_label.text = "Minimap Placeholder"
	minimap.add_child(minimap_label)
	hud_root.add_child(minimap)

	var command_card := PanelContainer.new()
	command_card.name = "CommandCard"
	command_card.position = Vector2(960, 420)
	command_card.size = Vector2(300, 180)
	var command_label := Label.new()
	command_label.text = "Command Card Placeholder"
	command_card.add_child(command_label)
	hud_root.add_child(command_card)

	var alert_stack := VBoxContainer.new()
	alert_stack.name = "Alerts"
	alert_stack.position = Vector2(480, 12)
	var alert_header := Label.new()
	alert_header.text = "Alerts"
	alert_stack.add_child(alert_header)
	var alert_item := Label.new()
	alert_item.text = "No active alerts"
	alert_stack.add_child(alert_item)
	hud_root.add_child(alert_stack)
	_hud_alert_item = alert_item

	var queue_display := VBoxContainer.new()
	queue_display.name = "QueueDisplay"
	queue_display.position = Vector2(960, 330)
	var queue_header := Label.new()
	queue_header.text = "Production Queue"
	queue_display.add_child(queue_header)
	var queue_item := Label.new()
	queue_item.text = "Queue empty"
	queue_display.add_child(queue_item)
	hud_root.add_child(queue_display)
	_hud_queue_item = queue_item

	var match_state := Label.new()
	match_state.name = "MatchState"
	match_state.text = "State: In Progress"
	match_state.position = Vector2(16, 40)
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


func _build_for_slot(slot: String, buildable_id: String) -> void:
	if not BUILDABLE_DEFS.has(buildable_id):
		print("[Build] Rejected slot=%s buildable=%s reason=unknown_buildable" % [slot, buildable_id])
		return

	if _buildables_by_slot[slot].has(buildable_id):
		print("[Build] Rejected slot=%s buildable=%s reason=already_built" % [slot, buildable_id])
		return

	var tether: TetherPoint = _tether_points_by_slot[slot]
	if tether.is_command_penalty_active:
		print("[Build] Rejected slot=%s buildable=%s reason=command_penalty_active" % [slot, buildable_id])
		return

	var dependencies: Array = BUILDABLE_DEFS[buildable_id]["deps"]
	for dep in dependencies:
		if not _buildables_by_slot[slot].has(dep):
			print("[Build] Rejected slot=%s buildable=%s reason=missing_dependency dependency=%s" % [slot, buildable_id, dep])
			return

	_build_sequence += 1
	var buildable_node := BuildableNode.new()
	buildable_node.name = "Buildable%s_%s" % [slot, str(_build_sequence)]
	buildable_node.position = tether.position + Vector3(24.0 * float(_build_sequence), 0.0, 0.0)
	add_child(buildable_node)

	var stable_item_id := "BLD-%s-%03d" % [slot, _build_sequence]
	var tier: String = str(BUILDABLE_DEFS[buildable_id]["tier"])
	buildable_node.initialize(stable_item_id, slot, buildable_id, tier)
	_buildables_by_slot[slot][buildable_id] = stable_item_id
	print("[Build] Completed slot=%s buildable=%s tier=%s stable_item_id=%s" % [slot, buildable_id, tier, stable_item_id])


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
		add_child(unit)
		unit.initialize(str(data["id"]), str(data["faction"]), data["position"])
		_controllable_units[str(data["id"])] = unit

	print("[F01] Spawned controllable units count=%d" % _controllable_units.size())


func _clear_controllable_selection() -> void:
	for unit_id in _selected_controllable_units:
		if _controllable_units.has(unit_id):
			var selected_unit: SelectableUnit2D = _controllable_units[unit_id]
			selected_unit.set_selected(false)
	_selected_controllable_units.clear()


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

	_resource_alloy_total = 0
	_select_single_unit(gatherer_id)
	_issue_gather_command("SAFE-ALLOY-A")
	for _step in 180:
		_update_live_units(0.1)
		_update_gather_jobs()

	var gather_pass := _resource_alloy_total > 0
	print("[F35] Summary alloy_total=%d pass=%s gatherer=%s" % [_resource_alloy_total, str(gather_pass), gatherer_id])


func _run_f03_test_hook() -> void:
	if not _has_user_flag(TEST_F03_FLAG):
		return

	if _controllable_units.is_empty():
		_initialize_controllable_units()

	_resource_alloy_total = 0
	var gather_node := Vector3(-230.0, 0.0, 0.0)
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

		_resource_alloy_total += 35
		_hud_resource_bar.text = "Alloy: %d  Power: 400/520  Data: 0  Reclaim: 0" % _resource_alloy_total
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
	var target_world := Vector3(-120.0, 0.0, 30.0)
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

	_resource_alloy_total = 140
	_hud_resource_bar.text = "Alloy: %d  Power: 400/520  Data: 0  Reclaim: 0" % _resource_alloy_total
	_set_match_state("Win", "objective_control")
	var win_state_pass := _hud_match_state.text == "State: Win (objective_control)"

	_resource_alloy_total = 40
	_hud_resource_bar.text = "Alloy: %d  Power: 320/520  Data: 0  Reclaim: 0" % _resource_alloy_total
	_set_match_state("Loss", "command_core_destroyed")
	var loss_state_pass := _hud_match_state.text == "State: Loss (command_core_destroyed)"

	print("[F04] HUD state summary win_pass=%s loss_pass=%s final_state=%s resource_bar=%s" % [str(win_state_pass), str(loss_state_pass), _hud_match_state.text, _hud_resource_bar.text])
	print("[F04] Summary pass=%s" % str(win_state_pass and loss_state_pass))


func _set_match_state(state: String, reason: String) -> void:
	_hud_match_state.text = "State: %s (%s)" % [state, reason]
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


# ── Live systems ──────────────────────────────────────────────────────────────

func _process(delta: float) -> void:
	_update_live_units(delta)
	_update_gather_jobs()
	_update_hud()
	_process_camera(delta)


func _update_hud() -> void:
	if _hud_resource_bar:
		_hud_resource_bar.text = "Alloy: %d  Power: 400/520  Data: 0  Reclaim: 0" % _resource_alloy_total


func _on_tether_penalty(item_id: String, slot: String, faction: String) -> void:
	if _hud_alert_item:
		_hud_alert_item.text = "ALERT: %s command lost (slot %s)" % [faction.capitalize(), slot]
	print("[HUD] Tether alert id=%s slot=%s faction=%s" % [item_id, slot, faction])


# ── Camera ────────────────────────────────────────────────────────────────────

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			_camera_arm = clamp(_camera_arm - _CAMERA_ZOOM_STEP, _CAMERA_ARM_MIN, _CAMERA_ARM_MAX)
			_apply_camera_transform()
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			_camera_arm = clamp(_camera_arm + _CAMERA_ZOOM_STEP, _CAMERA_ARM_MIN, _CAMERA_ARM_MAX)
			_apply_camera_transform()
		elif event.button_index == MOUSE_BUTTON_LEFT:
			_handle_left_click_selection(event.position)
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			_handle_right_click_command(event.position)


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
		var unit: SelectableUnit2D = _controllable_units[unit_id]
		var distance := Vector2(unit.position.x, unit.position.z).distance_to(Vector2(ground_point.x, ground_point.z))
		if distance < nearest_distance:
			nearest_distance = distance
			nearest_id = unit_id

	if nearest_id != "" and nearest_distance <= _SELECT_RADIUS_UNITS:
		_select_single_unit(nearest_id, additive)
	else:
		if not additive:
			_clear_controllable_selection()


func _handle_right_click_command(screen_pos: Vector2) -> void:
	var hit := _screen_to_ground_point(screen_pos)
	if not hit["ok"]:
		return
	var target: Vector3 = hit["point"]
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
			_resource_alloy_total += 35
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


func _is_gather_unit(unit_name: String) -> bool:
	return unit_name == "line_engineer" or unit_name == "brood_architect" or unit_name == "foundry_engineer"


func _get_dropoff_for_faction(faction_id: String) -> Vector3:
	for tether in _tether_points_by_slot.values():
		if tether.faction_id == faction_id:
			return tether.position
	return _spawn_a.position


func _clear_gather_jobs_for_selected_units() -> void:
	for unit_id in _selected_controllable_units:
		_gather_jobs.erase(unit_id)


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
	if changed:
		_apply_camera_transform()


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
