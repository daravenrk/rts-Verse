extends Node3D

const PrimitiveVisualKit = preload("res://scripts/core/PrimitiveVisualKit.gd")
const UnitCombatProfiles = preload("res://scripts/core/UnitCombatProfiles.gd")

const UNIT_TORSO_SIZE := Vector3(8.0, 4.8, 8.0)
const UNIT_TORSO_Y := 2.4
const UNIT_CREST_SIZE := Vector3(3.2, 2.1, 3.2)
const UNIT_CREST_Y := 5.7
const UNIT_FORWARD_MARKER_SIZE := Vector3(5.8, 1.2, 1.8)
const UNIT_FORWARD_MARKER_Y := 1.4
const UNIT_FORWARD_MARKER_Z := 3.55

var unit_id: String = ""
var faction_id: String = ""
var combat_profile: Dictionary = {}
var move_speed: float = 96.0
var is_selected: bool = false
var _move_target: Vector3 = Vector3.ZERO
var _has_move_target: bool = false
var _move_waypoints: Array[Vector3] = []
var _settle_target: Vector3 = Vector3.ZERO
var _has_settle_target: bool = false
var _materials: Array[StandardMaterial3D] = []
var _hp_bar_fill: MeshInstance3D = null
var _hp_bar_bg: MeshInstance3D = null
var _hp_bar_fill_mat: StandardMaterial3D = null
var _weapon_flash: MeshInstance3D = null
var _weapon_flash_remaining: float = 0.0
var _visual_signature: String = ""
const _HP_BAR_WIDTH := 9.0
const _HP_BAR_HEIGHT := 1.2
const _HP_BAR_Y := 9.8


func initialize(new_unit_id: String, new_faction_id: String, start_position: Vector3) -> void:
	unit_id = new_unit_id
	faction_id = new_faction_id
	combat_profile = UnitCombatProfiles.get_profile(unit_id)
	move_speed = float(combat_profile.get("move_speed", 96.0))
	position = start_position
	_create_profile_mesh()


func _create_profile_mesh() -> void:
	var faction_color: Color = PrimitiveVisualKit.get_faction_color(faction_id)
	var body_material: StandardMaterial3D = PrimitiveVisualKit.make_material(faction_color.darkened(0.18), Color.BLACK, false, 0.78, 0.03)
	var crest_material: StandardMaterial3D = PrimitiveVisualKit.make_material(faction_color.lightened(0.18), faction_color * 0.35, true, 0.62, 0.02)
	var forward_material: StandardMaterial3D = PrimitiveVisualKit.make_material(faction_color.darkened(0.05), Color.BLACK, false, 0.66, 0.02)
	_materials = [body_material, crest_material, forward_material]
	var visual := str(combat_profile.get("visual", "line"))
	_visual_signature = "%s:%s" % [faction_id, visual]
	if faction_id == "veyari":
		_create_veyari_shape(visual, body_material, crest_material, forward_material)
	else:
		_create_helion_shape(visual, body_material, crest_material, forward_material)

	var flash_mat := PrimitiveVisualKit.make_material(Color(1.0, 0.86, 0.3), Color(1.0, 0.62, 0.15), true, 0.3, 0.0)
	_weapon_flash = PrimitiveVisualKit.make_box_mesh_instance(Vector3(2.2, 2.2, 2.2), flash_mat, Vector3(0.0, 3.0, 6.6))
	_weapon_flash.visible = false
	add_child(_weapon_flash)

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
	print("[UnitProfile] unit=%s faction=%s role=%s armor=%s hp=%.1f speed=%.1f range=%.1f damage=%.1f cooldown=%.2f visual=%s" % [
		unit_id, faction_id, str(combat_profile.get("role", "line")), str(combat_profile.get("armor", "light")),
		float(combat_profile.get("max_hp", 100.0)), move_speed, float(combat_profile.get("range", 18.0)),
		float(combat_profile.get("damage", 16.0)), float(combat_profile.get("cooldown", 0.6)), _visual_signature
	])


func _create_helion_shape(visual: String, body: StandardMaterial3D, accent: StandardMaterial3D, forward: StandardMaterial3D) -> void:
	# Helion silhouettes are symmetric, angular, and forward-heavy.
	var body_size := UNIT_TORSO_SIZE
	if visual == "raider": body_size = Vector3(5.0, 3.0, 11.5)
	elif visual == "armor": body_size = Vector3(12.5, 4.5, 14.0)
	elif visual == "siege": body_size = Vector3(11.0, 4.0, 13.0)
	elif visual == "breach": body_size = Vector3(9.5, 6.0, 7.0)
	add_child(PrimitiveVisualKit.make_box_mesh_instance(body_size, body, Vector3(0.0, body_size.y * 0.5, 0.0)))
	match visual:
		"builder":
			add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(2.2, 6.5, 2.2), accent, Vector3(-3.2, 6.0, -1.0)))
			add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(6.5, 1.2, 2.0), forward, Vector3(0.0, 2.0, 4.2)))
		"line":
			add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(2.0, 2.0, 7.5), forward, Vector3(0.0, 4.2, 4.5)))
			add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(6.0, 2.0, 3.0), accent, Vector3(0.0, 6.0, -0.5)))
		"breach":
			add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(10.5, 5.0, 1.4), accent, Vector3(0.0, 3.5, 3.8)))
			add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(3.0, 3.0, 4.0), forward, Vector3(0.0, 5.0, 5.0)))
		"raider":
			for x in [-3.5, 3.5]: add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(2.2, 2.2, 8.0), accent, Vector3(x, 1.4, 0.0)))
			add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(2.0, 2.0, 8.0), forward, Vector3(0.0, 3.4, 4.5)))
		"armor":
			add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(8.0, 3.2, 8.0), accent, Vector3(0.0, 6.0, 0.5)))
			add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(2.4, 2.2, 11.0), forward, Vector3(0.0, 6.2, 7.0)))
		"siege":
			for x in [-4.5, 4.5]: add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(2.0, 5.5, 2.0), accent, Vector3(x, 3.0, -3.0)))
			add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(2.8, 2.8, 17.0), forward, Vector3(0.0, 6.0, 7.0)))


func _create_veyari_shape(visual: String, body: StandardMaterial3D, accent: StandardMaterial3D, forward: StandardMaterial3D) -> void:
	# Veyari silhouettes are low, radial/asymmetric, and carapace-led.
	var radius := 4.8
	var height := 4.0
	if visual == "raider": radius = 3.6; height = 3.0
	elif visual == "armor": radius = 7.2; height = 6.0
	elif visual == "siege": radius = 6.0; height = 5.0
	add_child(PrimitiveVisualKit.make_cylinder_mesh_instance(height, radius, body, Vector3(0.0, height * 0.5, 0.0)))
	match visual:
		"builder":
			add_child(PrimitiveVisualKit.make_cylinder_mesh_instance(7.0, 1.5, accent, Vector3(2.6, 5.0, -1.2), Vector3(18.0, 0.0, 12.0)))
			add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(2.0, 1.5, 7.0), forward, Vector3(-1.8, 2.2, 3.8), Vector3(0.0, -15.0, 0.0)))
		"line":
			for x in [-3.0, 0.0, 3.0]: add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(1.2, 3.5, 6.0), accent, Vector3(x, 4.0, 2.0), Vector3(-18.0, x * 5.0, 0.0)))
		"breach":
			for x in [-4.2, 4.2]: add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(3.0, 2.4, 8.0), forward, Vector3(x, 2.4, 3.5), Vector3(0.0, x * 3.0, 0.0)))
		"raider":
			for x in [-3.8, 0.0, 3.8]: add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(1.2, 4.0, 8.0), accent, Vector3(x, 2.0, 0.5), Vector3(22.0, x * 4.0, 0.0)))
			add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(1.4, 1.4, 10.0), forward, Vector3(0.0, 3.0, 5.0)))
		"armor":
			add_child(PrimitiveVisualKit.make_cylinder_mesh_instance(3.5, 5.0, accent, Vector3(0.0, 6.5, 0.0)))
			for x in [-6.0, 6.0]: add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(3.0, 3.0, 7.0), forward, Vector3(x, 2.0, 1.5), Vector3(0.0, x * 2.5, 0.0)))
		"siege":
			add_child(PrimitiveVisualKit.make_cylinder_mesh_instance(5.5, 3.8, accent, Vector3(0.0, 7.0, -2.0), Vector3(90.0, 0.0, 0.0)))
			add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(3.2, 3.2, 13.0), forward, Vector3(1.8, 6.2, 5.0), Vector3(-12.0, 8.0, 0.0)))


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
	_move_waypoints.clear()
	_settle_target = target
	_has_settle_target = true
	_move_target = target
	_has_move_target = true


func queue_path(waypoints: Array[Vector3], append: bool = false) -> void:
	if not append:
		_move_waypoints.clear()
		_has_move_target = false
	for waypoint in waypoints:
		_move_waypoints.append(waypoint)
	if not waypoints.is_empty():
		_settle_target = waypoints.back()
		_has_settle_target = true
	if not _has_move_target:
		_begin_next_waypoint()


func stop_movement() -> void:
	_move_waypoints.clear()
	_has_move_target = false
	_has_settle_target = false


func _begin_next_waypoint() -> void:
	if _move_waypoints.is_empty():
		_has_move_target = false
		return
	_move_target = _move_waypoints.pop_front()
	_has_move_target = true


func simulate_step(delta: float) -> void:
	if _weapon_flash_remaining > 0.0:
		_weapon_flash_remaining = maxf(0.0, _weapon_flash_remaining - delta)
		if _weapon_flash:
			_weapon_flash.visible = _weapon_flash_remaining > 0.0
	if not _has_move_target:
		if _has_settle_target and Vector2(position.x, position.z).distance_to(Vector2(_settle_target.x, _settle_target.z)) > 0.75:
			_move_target = _settle_target
			_has_move_target = true
		else:
			return
	var to_target := Vector3(_move_target.x - position.x, 0.0, _move_target.z - position.z)
	var distance := to_target.length()
	if distance <= 0.5:
		position.x = _move_target.x
		position.z = _move_target.z
		_begin_next_waypoint()
		return
	var step := move_speed * delta
	if step >= distance:
		position.x = _move_target.x
		position.z = _move_target.z
		_begin_next_waypoint()
	else:
		var move_vec := to_target.normalized() * step
		position.x += move_vec.x
		position.z += move_vec.z
		rotation.y = atan2(move_vec.x, move_vec.z)


func has_move_target() -> bool:
	return _has_move_target


func get_pending_waypoint_count() -> int:
	return _move_waypoints.size() + (1 if _has_move_target else 0)


func get_planned_destination() -> Vector3:
	return _settle_target if _has_settle_target else position


func play_attack_feedback() -> void:
	_weapon_flash_remaining = 0.14
	if _weapon_flash:
		_weapon_flash.visible = true


func get_visual_signature() -> String:
	return _visual_signature


func is_attack_feedback_active() -> bool:
	return _weapon_flash_remaining > 0.0 and _weapon_flash != null and _weapon_flash.visible
