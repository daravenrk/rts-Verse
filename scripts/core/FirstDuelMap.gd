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
const BUILDABLE_DEFS := {
	"power_core": {"tier": "T0", "deps": []},
	"alloy_extractor": {"tier": "T0", "deps": []},
	"barracks_equivalent": {"tier": "T0", "deps": []},
	"vehicle_structure": {"tier": "T1", "deps": ["power_core", "barracks_equivalent"]},
	"sensor_uplink": {"tier": "T1", "deps": ["power_core", "barracks_equivalent"]},
	"expansion_hub": {"tier": "T1", "deps": ["alloy_extractor", "barracks_equivalent"]}
}

@onready var _spawn_a: Marker2D = %SpawnA
@onready var _spawn_b: Marker2D = %SpawnB
var _tether_points_by_slot: Dictionary = {}
var _buildables_by_slot: Dictionary = {"A": {}, "B": {}}
var _build_sequence: int = 0


func _ready() -> void:
	var player_faction := _resolve_faction("duel_player_faction", TEST_PLAYER_FACTION_PREFIX, DEFAULT_PLAYER_FACTION)
	var enemy_faction := _resolve_faction("duel_enemy_faction", TEST_ENEMY_FACTION_PREFIX, DEFAULT_ENEMY_FACTION)
	print("[Map] First duel environment primary=Radial Impact Zone secondary=None")
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
