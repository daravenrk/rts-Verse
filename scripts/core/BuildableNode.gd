extends Node3D
class_name BuildableNode

const TIER_COLORS := {
	"T0": Color(0.55, 0.7, 0.9),
	"T1": Color(0.85, 0.75, 0.35),
	"T2": Color(0.95, 0.45, 0.3),
}

var stable_item_id: String = ""
var slot: String = ""
var buildable_id: String = ""
var tier: String = ""


func initialize(item_id: String, owner_slot: String, id: String, build_tier: String) -> void:
	stable_item_id = item_id
	slot = owner_slot
	buildable_id = id
	tier = build_tier
	_create_visual()
	print("[Build] Node initialized id=%s slot=%s buildable=%s tier=%s" % [stable_item_id, slot, buildable_id, tier])


func _create_visual() -> void:
	var mesh_instance := MeshInstance3D.new()
	var box := BoxMesh.new()
	var size := Vector3(16.0, 12.0, 16.0)
	if tier == "T1":
		size = Vector3(22.0, 16.0, 22.0)
	elif tier == "T2":
		size = Vector3(28.0, 22.0, 28.0)
	box.size = size
	mesh_instance.mesh = box
	var mat := StandardMaterial3D.new()
	mat.albedo_color = TIER_COLORS.get(tier, Color(0.7, 0.7, 0.7))
	mat.roughness = 0.7
	mesh_instance.material_override = mat
	mesh_instance.position = Vector3(0.0, size.y * 0.5, 0.0)
	add_child(mesh_instance)
