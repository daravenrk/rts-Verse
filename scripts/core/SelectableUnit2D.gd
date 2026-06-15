extends Node3D

const PrimitiveVisualKit = preload("res://scripts/core/PrimitiveVisualKit.gd")

const UNIT_TORSO_SIZE := Vector3(8.0, 4.8, 8.0)
const UNIT_TORSO_Y := 2.4
const UNIT_CREST_SIZE := Vector3(3.2, 2.1, 3.2)
const UNIT_CREST_Y := 5.7
const UNIT_FORWARD_MARKER_SIZE := Vector3(5.8, 1.2, 1.8)
const UNIT_FORWARD_MARKER_Y := 1.4
const UNIT_FORWARD_MARKER_Z := 3.55

var unit_id: String = ""
var faction_id: String = ""
var move_speed: float = 96.0
var is_selected: bool = false
var _move_target: Vector3 = Vector3.ZERO
var _has_move_target: bool = false
var _materials: Array[StandardMaterial3D] = []
var _hp_bar_fill: MeshInstance3D = null
var _hp_bar_bg: MeshInstance3D = null
var _hp_bar_fill_mat: StandardMaterial3D = null
const _HP_BAR_WIDTH := 9.0
const _HP_BAR_HEIGHT := 1.2
const _HP_BAR_Y := 9.8


func initialize(new_unit_id: String, new_faction_id: String, start_position: Vector3) -> void:
	unit_id = new_unit_id
	faction_id = new_faction_id
	position = start_position
	_create_placeholder_mesh()


func _create_placeholder_mesh() -> void:
	var faction_color: Color = PrimitiveVisualKit.get_faction_color(faction_id)
	var body_material: StandardMaterial3D = PrimitiveVisualKit.make_material(faction_color.darkened(0.18), Color.BLACK, false, 0.78, 0.03)
	var crest_material: StandardMaterial3D = PrimitiveVisualKit.make_material(faction_color.lightened(0.18), faction_color * 0.35, true, 0.62, 0.02)
	var forward_material: StandardMaterial3D = PrimitiveVisualKit.make_material(faction_color.darkened(0.05), Color.BLACK, false, 0.66, 0.02)
	_materials = [body_material, crest_material, forward_material]

	var torso: MeshInstance3D = PrimitiveVisualKit.make_box_mesh_instance(UNIT_TORSO_SIZE, body_material, Vector3(0.0, UNIT_TORSO_Y, 0.0))
	add_child(torso)

	var crest: MeshInstance3D = PrimitiveVisualKit.make_box_mesh_instance(UNIT_CREST_SIZE, crest_material, Vector3(0.0, UNIT_CREST_Y, 0.0))
	add_child(crest)

	var forward_marker: MeshInstance3D = PrimitiveVisualKit.make_box_mesh_instance(UNIT_FORWARD_MARKER_SIZE, forward_material, Vector3(0.0, UNIT_FORWARD_MARKER_Y, UNIT_FORWARD_MARKER_Z))
	add_child(forward_marker)

	# HP bar background (dark grey).
	var bg_mat := PrimitiveVisualKit.make_material(Color(0.15, 0.15, 0.15), Color.BLACK, false, 1.0, 0.0)
	_hp_bar_bg = PrimitiveVisualKit.make_box_mesh_instance(
		Vector3(_HP_BAR_WIDTH, _HP_BAR_HEIGHT, 0.4), bg_mat, Vector3(0.0, _HP_BAR_Y, 0.0))
	add_child(_hp_bar_bg)

	# HP bar fill (starts green, will update with set_hp_fraction).
	_hp_bar_fill_mat = PrimitiveVisualKit.make_material(Color(0.2, 0.9, 0.25), Color.BLACK, false, 1.0, 0.0)
	_hp_bar_fill = PrimitiveVisualKit.make_box_mesh_instance(
		Vector3(_HP_BAR_WIDTH, _HP_BAR_HEIGHT, 0.5), _hp_bar_fill_mat, Vector3(0.0, _HP_BAR_Y, 0.0))
	add_child(_hp_bar_fill)


func set_selected(selected: bool) -> void:
	is_selected = selected
	for material in _materials:
		material.emission_enabled = selected
		material.emission = Color(1.0, 0.9, 0.2) if selected else Color.BLACK


func set_hp_fraction(fraction: float) -> void:
	# fraction in 0..1; scales bar and updates colour.
	var f := clampf(fraction, 0.0, 1.0)
	if not _hp_bar_fill or not _hp_bar_fill_mat:
		return
	# Scale X around left edge by shifting position and scaling mesh.
	var filled_width := _HP_BAR_WIDTH * f
	_hp_bar_fill.scale = Vector3(f, 1.0, 1.0)
	_hp_bar_fill.position = Vector3(-(_HP_BAR_WIDTH - filled_width) * 0.5, _HP_BAR_Y, 0.0)
	if f > 0.6:
		_hp_bar_fill_mat.albedo_color = Color(0.2, 0.9, 0.25)
	elif f > 0.3:
		_hp_bar_fill_mat.albedo_color = Color(0.95, 0.8, 0.1)
	else:
		_hp_bar_fill_mat.albedo_color = Color(0.95, 0.2, 0.15)


func queue_move(target: Vector3) -> void:
	_move_target = target
	_has_move_target = true


func simulate_step(delta: float) -> void:
	if not _has_move_target:
		return
	var to_target := Vector3(_move_target.x - position.x, 0.0, _move_target.z - position.z)
	var distance := to_target.length()
	if distance <= 0.5:
		position.x = _move_target.x
		position.z = _move_target.z
		_has_move_target = false
		return
	var step := move_speed * delta
	if step >= distance:
		position.x = _move_target.x
		position.z = _move_target.z
		_has_move_target = false
	else:
		var move_vec := to_target.normalized() * step
		position.x += move_vec.x
		position.z += move_vec.z


func has_move_target() -> bool:
	return _has_move_target
