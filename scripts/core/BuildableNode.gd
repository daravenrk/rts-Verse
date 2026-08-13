extends Node3D
class_name BuildableNode

const PrimitiveVisualKit = preload("res://scripts/core/PrimitiveVisualKit.gd")

const TIER_BASE_SIZES := {
	"T0": Vector3(16.0, 12.0, 16.0),
	"T1": Vector3(22.0, 16.0, 22.0),
	"T2": Vector3(28.0, 22.0, 28.0),
}

const MINIMUM_CONSTRUCTION_VISUAL_SCALE := 0.12
const CONSTRUCTION_PROGRESS_BAR_WIDTH := 10.0

var stable_item_id: String = ""
var slot: String = ""
var buildable_id: String = ""
var tier: String = ""
var construction_progress: float = 1.0
var is_under_construction: bool = false
var is_operational: bool = true

var _visual_root: Node3D
var _construction_progress_root: Node3D
var _construction_progress_fill: MeshInstance3D
var _base_size: Vector3 = TIER_BASE_SIZES["T0"]


func initialize(item_id: String, owner_slot: String, id: String, build_tier: String, starts_operational: bool = true) -> void:
	stable_item_id = item_id
	slot = owner_slot
	buildable_id = id
	tier = build_tier
	_clear_visual()
	_create_visual()
	if starts_operational:
		complete_construction()
	else:
		begin_construction()
	print("[Build] Node initialized id=%s slot=%s buildable=%s tier=%s operational=%s" % [
		stable_item_id, slot, buildable_id, tier, str(is_operational)
	])


func begin_construction(initial_progress: float = 0.0) -> void:
	is_under_construction = true
	is_operational = false
	set_construction_progress(initial_progress)


func set_construction_progress(value: float) -> void:
	construction_progress = clampf(value, 0.0, 1.0)
	if is_under_construction and is_equal_approx(construction_progress, 1.0):
		complete_construction()
		return
	_apply_construction_visual()


func complete_construction() -> void:
	construction_progress = 1.0
	is_under_construction = false
	is_operational = true
	_apply_construction_visual()


func set_operational(value: bool) -> void:
	is_operational = value and not is_under_construction


func is_construction_complete() -> bool:
	return not is_under_construction and is_equal_approx(construction_progress, 1.0)


func is_ready_for_commands() -> bool:
	return is_operational and is_construction_complete()


func get_selection_radius() -> float:
	return maxf(_base_size.x, _base_size.z) * 0.65


func get_selection_world_position() -> Vector3:
	return global_position


func _create_visual() -> void:
	_base_size = TIER_BASE_SIZES.get(tier, TIER_BASE_SIZES["T0"])
	var size := _base_size
	var base_color: Color = PrimitiveVisualKit.get_tier_color(tier)
	var foundation_material: StandardMaterial3D = PrimitiveVisualKit.make_material(base_color.darkened(0.2), Color.BLACK, false, 0.72, 0.04)
	var crown_material: StandardMaterial3D = PrimitiveVisualKit.make_material(base_color.lightened(0.18), base_color * 0.25, true, 0.56, 0.02)
	var front_material: StandardMaterial3D = PrimitiveVisualKit.make_material(base_color.darkened(0.05), Color.BLACK, false, 0.64, 0.02)
	_visual_root = Node3D.new()
	_visual_root.name = "StructureVisual"
	add_child(_visual_root)

	var foundation: MeshInstance3D = PrimitiveVisualKit.make_box_mesh_instance(size, foundation_material, Vector3(0.0, size.y * 0.5, 0.0))
	_visual_root.add_child(foundation)

	var crown_height: float = size.y * 0.28
	if crown_height < 4.0:
		crown_height = 4.0
	var crown_size: Vector3 = Vector3(size.x * 0.45, crown_height, size.z * 0.45)
	var crown_position: Vector3 = Vector3(0.0, size.y + crown_height * 0.5 - 0.75, 0.0)
	var crown: MeshInstance3D = PrimitiveVisualKit.make_box_mesh_instance(crown_size, crown_material, crown_position)
	_visual_root.add_child(crown)

	var front_panel_depth: float = size.z * 0.12
	if front_panel_depth < 1.5:
		front_panel_depth = 1.5
	var front_panel: MeshInstance3D = PrimitiveVisualKit.make_box_mesh_instance(Vector3(size.x * 0.55, size.y * 0.12, front_panel_depth), front_material, Vector3(0.0, size.y * 0.45, size.z * 0.5 - 0.75))
	_visual_root.add_child(front_panel)

	_create_construction_progress_visual(size, base_color)


func _create_construction_progress_visual(size: Vector3, base_color: Color) -> void:
	_construction_progress_root = Node3D.new()
	_construction_progress_root.name = "ConstructionProgress"
	_construction_progress_root.position = Vector3(0.0, maxf(size.y * 0.18, 2.0), size.z * 0.5 + 1.2)
	add_child(_construction_progress_root)

	var background_material := PrimitiveVisualKit.make_material(Color(0.04, 0.05, 0.07), Color.BLACK, false, 0.9, 0.0)
	var fill_color := base_color.lightened(0.25)
	var fill_material := PrimitiveVisualKit.make_material(fill_color, fill_color * 0.35, true, 0.5, 0.02)
	var background := PrimitiveVisualKit.make_box_mesh_instance(
		Vector3(CONSTRUCTION_PROGRESS_BAR_WIDTH + 0.5, 0.8, 0.45),
		background_material
	)
	_construction_progress_root.add_child(background)
	_construction_progress_fill = PrimitiveVisualKit.make_box_mesh_instance(
		Vector3(CONSTRUCTION_PROGRESS_BAR_WIDTH, 0.45, 0.52),
		fill_material,
		Vector3(0.0, 0.0, -0.05)
	)
	_construction_progress_root.add_child(_construction_progress_fill)


func _apply_construction_visual() -> void:
	if is_instance_valid(_visual_root):
		var height_scale := lerpf(MINIMUM_CONSTRUCTION_VISUAL_SCALE, 1.0, construction_progress)
		_visual_root.scale = Vector3(1.0, height_scale, 1.0)
	if not is_instance_valid(_construction_progress_root):
		return
	_construction_progress_root.visible = is_under_construction
	if not is_instance_valid(_construction_progress_fill):
		return
	var visible_progress := maxf(construction_progress, 0.001)
	_construction_progress_fill.scale = Vector3(visible_progress, 1.0, 1.0)
	_construction_progress_fill.position.x = -CONSTRUCTION_PROGRESS_BAR_WIDTH * 0.5 + CONSTRUCTION_PROGRESS_BAR_WIDTH * visible_progress * 0.5


func _clear_visual() -> void:
	if is_instance_valid(_visual_root):
		_visual_root.free()
	if is_instance_valid(_construction_progress_root):
		_construction_progress_root.free()
	_visual_root = null
	_construction_progress_root = null
	_construction_progress_fill = null
