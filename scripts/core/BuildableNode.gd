extends Node3D
class_name BuildableNode

const PrimitiveVisualKit = preload("res://scripts/core/PrimitiveVisualKit.gd")

const TIER_BASE_SIZES := {
	"T0": Vector3(16.0, 12.0, 16.0),
	"T1": Vector3(22.0, 16.0, 22.0),
	"T2": Vector3(28.0, 22.0, 28.0),
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
	var size: Vector3 = TIER_BASE_SIZES.get(tier, TIER_BASE_SIZES["T0"])
	var base_color: Color = PrimitiveVisualKit.get_tier_color(tier)
	var foundation_material: StandardMaterial3D = PrimitiveVisualKit.make_material(base_color.darkened(0.2), Color.BLACK, false, 0.72, 0.04)
	var crown_material: StandardMaterial3D = PrimitiveVisualKit.make_material(base_color.lightened(0.18), base_color * 0.25, true, 0.56, 0.02)
	var front_material: StandardMaterial3D = PrimitiveVisualKit.make_material(base_color.darkened(0.05), Color.BLACK, false, 0.64, 0.02)

	var foundation: MeshInstance3D = PrimitiveVisualKit.make_box_mesh_instance(size, foundation_material, Vector3(0.0, size.y * 0.5, 0.0))
	add_child(foundation)

	var crown_height: float = size.y * 0.28
	if crown_height < 4.0:
		crown_height = 4.0
	var crown_size: Vector3 = Vector3(size.x * 0.45, crown_height, size.z * 0.45)
	var crown_position: Vector3 = Vector3(0.0, size.y + crown_height * 0.5 - 0.75, 0.0)
	var crown: MeshInstance3D = PrimitiveVisualKit.make_box_mesh_instance(crown_size, crown_material, crown_position)
	add_child(crown)

	var front_panel_depth: float = size.z * 0.12
	if front_panel_depth < 1.5:
		front_panel_depth = 1.5
	var front_panel: MeshInstance3D = PrimitiveVisualKit.make_box_mesh_instance(Vector3(size.x * 0.55, size.y * 0.12, front_panel_depth), front_material, Vector3(0.0, size.y * 0.45, size.z * 0.5 - 0.75))
	add_child(front_panel)
