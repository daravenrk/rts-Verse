extends Node3D
class_name TetherPoint

signal command_penalty_activated(item_id: String, slot: String, faction: String)

const MAX_HEALTH := 1000.0
const OPENING_UNLOCK_SET := ["power_core", "alloy_extractor", "barracks_equivalent"]
const COMMAND_STRUCTURE_NAMES := {
	"helion": "Command Spire",
	"obsidian": "Forge Nexus",
	"veyari": "Descent Spire"
}
const FACTION_COLORS := {
	"helion": Color(0.2, 0.5, 1.0),
	"veyari": Color(0.2, 0.8, 0.3),
	"obsidian": Color(0.8, 0.35, 0.1),
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
	var base := MeshInstance3D.new()
	var cyl := CylinderMesh.new()
	cyl.height = 24.0
	cyl.top_radius = 14.0
	cyl.bottom_radius = 14.0
	base.mesh = cyl
	var mat := StandardMaterial3D.new()
	mat.albedo_color = FACTION_COLORS.get(faction_id, Color(0.6, 0.6, 0.6))
	mat.roughness = 0.6
	base.material_override = mat
	base.position = Vector3(0.0, 12.0, 0.0)
	add_child(base)

	var top := MeshInstance3D.new()
	var box := BoxMesh.new()
	box.size = Vector3(10.0, 10.0, 10.0)
	top.mesh = box
	var top_mat := StandardMaterial3D.new()
	top_mat.albedo_color = FACTION_COLORS.get(faction_id, Color(0.6, 0.6, 0.6)).lightened(0.3)
	top_mat.emission_enabled = true
	top_mat.emission = FACTION_COLORS.get(faction_id, Color(0.6, 0.6, 0.6)) * 0.5
	top.material_override = top_mat
	top.position = Vector3(0.0, 29.0, 0.0)
	add_child(top)


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
