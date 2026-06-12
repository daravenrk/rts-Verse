extends Node3D
class_name TetherPoint

const PrimitiveVisualKit = preload("res://scripts/core/PrimitiveVisualKit.gd")

signal command_penalty_activated(item_id: String, slot: String, faction: String)

const MAX_HEALTH := 1000.0
const OPENING_UNLOCK_SET := ["power_core", "alloy_extractor", "barracks_equivalent"]
const COMMAND_STRUCTURE_NAMES := {
	"helion": "Command Spire",
	"obsidian": "Forge Nexus",
	"veyari": "Descent Spire"
}


var stable_item_id: String = ""
var spawn_slot: String = ""
var faction_id: String = ""
var health: float = MAX_HEALTH
var is_command_penalty_active: bool = false
var recovery_state: String = "stable"


func initialize(item_id: String, slot: String, faction: String) -> void:
	stable_item_id = item_id
	spawn_slot = slot
	faction_id = faction
	health = MAX_HEALTH
	is_command_penalty_active = false
	recovery_state = "stable"
	_create_visual()
	print("[Tether] Initialized id=%s slot=%s faction=%s command_structure=%s opening_unlocks=%s" % [stable_item_id, spawn_slot, faction_id, get_structure_name(), str(OPENING_UNLOCK_SET)])


func _create_visual() -> void:
	var faction_color: Color = PrimitiveVisualKit.get_faction_color(faction_id)
	var base_material: StandardMaterial3D = PrimitiveVisualKit.make_material(faction_color.darkened(0.16), Color.BLACK, false, 0.62, 0.04)
	var tower_material: StandardMaterial3D = PrimitiveVisualKit.make_material(faction_color, faction_color * 0.45, true, 0.56, 0.02)
	var cap_material: StandardMaterial3D = PrimitiveVisualKit.make_material(faction_color.lightened(0.22), faction_color * 0.55, true, 0.48, 0.02)

	var base: MeshInstance3D = PrimitiveVisualKit.make_cylinder_mesh_instance(24.0, 14.0, base_material, Vector3(0.0, 12.0, 0.0))
	add_child(base)

	var tower: MeshInstance3D = PrimitiveVisualKit.make_box_mesh_instance(Vector3(12.0, 16.0, 12.0), tower_material, Vector3(0.0, 28.0, 0.0))
	add_child(tower)

	var cap: MeshInstance3D = PrimitiveVisualKit.make_box_mesh_instance(Vector3(10.0, 10.0, 10.0), cap_material, Vector3(0.0, 38.0, 0.0))
	add_child(cap)


func get_structure_name() -> String:
	if COMMAND_STRUCTURE_NAMES.has(faction_id):
		return str(COMMAND_STRUCTURE_NAMES[faction_id])
	return "Unknown Command Structure"


func apply_damage(amount: float) -> void:
	if amount <= 0.0:
		return
	if health <= 0.0:
		return

	health = max(0.0, health - amount)
	print("[Tether] Damage id=%s amount=%.1f health=%.1f" % [stable_item_id, amount, health])
	if health <= 0.0:
		_activate_command_penalty()


func _activate_command_penalty() -> void:
	is_command_penalty_active = true
	recovery_state = "destroyed"
	print("[Tether] Destroyed id=%s slot=%s faction=%s command_penalty=active" % [stable_item_id, spawn_slot, faction_id])
	command_penalty_activated.emit(stable_item_id, spawn_slot, faction_id)


func begin_recovery(secondary_structure_id: String) -> void:
	if not is_command_penalty_active:
		return
	recovery_state = "recovering"
	print("[Tether] Recovery begin id=%s secondary_structure=%s recovery_state=%s" % [stable_item_id, secondary_structure_id, recovery_state])


func complete_recovery() -> void:
	if not is_command_penalty_active:
		return
	is_command_penalty_active = false
	recovery_state = "stable"
	health = MAX_HEALTH * 0.4
	print("[Tether] Recovery complete id=%s command_penalty=cleared recovery_state=%s health=%.1f" % [stable_item_id, recovery_state, health])
