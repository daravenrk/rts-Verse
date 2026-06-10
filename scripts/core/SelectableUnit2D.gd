extends Node3D

const FACTION_COLORS := {
	"helion": Color(0.2, 0.5, 1.0),
	"veyari": Color(0.2, 0.8, 0.3),
	"obsidian": Color(0.8, 0.35, 0.1),
}
const UNIT_BOX_SIZE := Vector3(8.0, 6.0, 8.0)
const UNIT_MESH_Y_OFFSET := 3.0

var unit_id: String = ""
var faction_id: String = ""
var move_speed: float = 96.0
var is_selected: bool = false
var _move_target: Vector3 = Vector3.ZERO
var _has_move_target: bool = false
var _mesh_instance: MeshInstance3D
var _mat: StandardMaterial3D


func initialize(new_unit_id: String, new_faction_id: String, start_position: Vector3) -> void:
	unit_id = new_unit_id
	faction_id = new_faction_id
	position = start_position
	_create_placeholder_mesh()


func _create_placeholder_mesh() -> void:
	_mesh_instance = MeshInstance3D.new()
	var box := BoxMesh.new()
	box.size = UNIT_BOX_SIZE
	_mesh_instance.mesh = box
	_mat = StandardMaterial3D.new()
	_mat.albedo_color = FACTION_COLORS.get(faction_id, Color(0.7, 0.7, 0.7))
	_mesh_instance.material_override = _mat
	_mesh_instance.position = Vector3(0.0, UNIT_MESH_Y_OFFSET, 0.0)
	add_child(_mesh_instance)


func set_selected(selected: bool) -> void:
	is_selected = selected
	if _mat:
		_mat.emission_enabled = selected
		_mat.emission = Color(1.0, 0.9, 0.2) if selected else Color.BLACK


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
