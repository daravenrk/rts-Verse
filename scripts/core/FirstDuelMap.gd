extends Node2D

const DEFAULT_PLAYER_FACTION := "helion"
const DEFAULT_ENEMY_FACTION := "veyari"
const TEST_PLAYER_FACTION_PREFIX := "--duel-test-player-faction="
const TEST_ENEMY_FACTION_PREFIX := "--duel-test-enemy-faction="
const TEST_DESTROY_SLOT_PREFIX := "--duel-test-destroy-slot="
const TEST_RECOVERY_STRUCTURE_PREFIX := "--duel-test-recovery-structure="
const TEST_BUILD_CHAIN_FLAG := "--duel-test-build-chain"
const TetherPoint := preload("res://scripts/core/TetherPoint.gd")
const BuildableNode := preload("res://scripts/core/BuildableNode.gd")
const MapItem := preload("res://scripts/core/MapItem.gd")
const BUILDABLE_DEFS := {
	"power_core": {"tier": "T0", "deps": []},
	"alloy_extractor": {"tier": "T0", "deps": []},
	"barracks_equivalent": {"tier": "T0", "deps": []},
	"vehicle_structure": {"tier": "T1", "deps": ["power_core", "barracks_equivalent"]},
	"sensor_uplink": {"tier": "T1", "deps": ["power_core", "barracks_equivalent"]},
	"expansion_hub": {"tier": "T1", "deps": ["alloy_extractor", "barracks_equivalent"]}
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

@onready var _spawn_a: Marker2D = %SpawnA
@onready var _spawn_b: Marker2D = %SpawnB
var _tether_points_by_slot: Dictionary = {}
var _buildables_by_slot: Dictionary = {"A": {}, "B": {}}
var _build_sequence: int = 0
var _map_item_counts: Dictionary = {}


func _ready() -> void:
	var player_faction := _resolve_faction("duel_player_faction", TEST_PLAYER_FACTION_PREFIX, DEFAULT_PLAYER_FACTION)
	var enemy_faction := _resolve_faction("duel_enemy_faction", TEST_ENEMY_FACTION_PREFIX, DEFAULT_ENEMY_FACTION)
	print("[Map] First duel environment primary=Radial Impact Zone secondary=None")
	_create_mvp_hud()
	_spawn_map_items()
	_validate_map_item_catalog()
	_spawn_tether_point("A", player_faction, _spawn_a)
	_spawn_tether_point("B", enemy_faction, _spawn_b)
	_run_tether_test_hooks()
	_run_build_chain_test_hook()


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


func _spawn_tether_point(slot: String, faction_id: String, spawn_marker: Marker2D) -> void:
	var tether := TetherPoint.new()
	tether.name = "TetherPoint%s" % slot
	tether.position = spawn_marker.position
	add_child(tether)
	_tether_points_by_slot[slot] = tether

	var stable_item_id := "TP-SPAWN-%s" % slot
	tether.initialize(stable_item_id, slot, faction_id)
	print("[Tether] Spawn slot=%s marker=%s position=%s faction=%s stable_item_id=%s" % [slot, spawn_marker.name, str(spawn_marker.position), faction_id, stable_item_id])


func _spawn_map_items() -> void:
	for spec in MAP_ITEM_SPECS:
		var item := MapItem.new()
		item.name = str(spec["id"])
		item.position = spec["position"]
		add_child(item)
		item.initialize(str(spec["id"]), str(spec["type"]), str(spec["lane"]))

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
	buildable_node.position = tether.position + Vector2(24.0 * float(_build_sequence), 0.0)
	add_child(buildable_node)

	var stable_item_id := "BLD-%s-%03d" % [slot, _build_sequence]
	var tier: String = str(BUILDABLE_DEFS[buildable_id]["tier"])
	buildable_node.initialize(stable_item_id, slot, buildable_id, tier)
	_buildables_by_slot[slot][buildable_id] = stable_item_id
	print("[Build] Completed slot=%s buildable=%s tier=%s stable_item_id=%s" % [slot, buildable_id, tier, stable_item_id])
