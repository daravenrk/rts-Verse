extends Node2D

var unit_id: String = ""
var faction_id: String = ""
var move_speed: float = 96.0
var is_selected: bool = false
var _move_target: Vector2 = Vector2.ZERO
var _has_move_target: bool = false


func initialize(new_unit_id: String, new_faction_id: String, start_position: Vector2) -> void:
	unit_id = new_unit_id
	faction_id = new_faction_id
	position = start_position


func set_selected(selected: bool) -> void:
	is_selected = selected


func queue_move(target: Vector2) -> void:
	_move_target = target
	_has_move_target = true


func simulate_step(delta: float) -> void:
	if not _has_move_target:
		return

	var to_target := _move_target - position
	var distance := to_target.length()
	if distance <= 0.5:
		position = _move_target
		_has_move_target = false
		return

	var step := move_speed * delta
	if step >= distance:
		position = _move_target
		_has_move_target = false
	else:
		position += to_target.normalized() * step


func has_move_target() -> bool:
	return _has_move_target
