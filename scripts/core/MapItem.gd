extends Node3D
class_name MapItem

const PrimitiveVisualKit = preload("res://scripts/core/PrimitiveVisualKit.gd")

const LANE_COLORS := {
	"home": Color(0.26, 0.58, 1.0),
	"mid": Color(0.9, 0.78, 0.34),
	"flank": Color(0.34, 0.88, 0.56),
	"center": Color(0.82, 0.46, 0.96),
	"direct": Color(0.95, 0.55, 0.25),
	"natural": Color(0.42, 0.86, 0.42),
	"high_risk": Color(1.0, 0.42, 0.35),
}

const OBJECTIVE_SEGMENT_COUNT := 12
const OBJECTIVE_OWNER_COLORS := {
	"A": Color(0.2, 0.5, 1.0),
	"B": Color(1.0, 0.34, 0.2),
	"": Color(0.64, 0.68, 0.72),
}

var stable_item_id: String = ""
var item_type: String = ""
var lane_tag: String = ""
var objective_owner: String = ""
var objective_acting_slot: String = ""
var objective_phase: String = "neutral"
var objective_progress: float = 0.0

var _objective_core: MeshInstance3D = null
var _objective_segments: Array[MeshInstance3D] = []
var _objective_label: Label3D = null
var _objective_materials: Dictionary = {}
var _objective_owner_names: Dictionary = {"A": "A", "B": "B"}
var _objective_owner_colors: Dictionary = {
	"A": OBJECTIVE_OWNER_COLORS["A"],
	"B": OBJECTIVE_OWNER_COLORS["B"],
}
var _objective_visual_signature: String = ""


func initialize(item_id: String, map_item_type: String, map_lane_tag: String) -> void:
	stable_item_id = item_id
	item_type = map_item_type
	lane_tag = map_lane_tag
	_create_visual()
	print("[MapItem] Initialized id=%s type=%s lane=%s position=%s" % [stable_item_id, item_type, lane_tag, str(position)])


func set_objective_state(owner: String, phase: String, progress: float, owner_display_name: String = "", owner_color: Variant = null, acting_slot: String = "") -> void:
	objective_owner = _normalize_objective_owner(owner)
	objective_acting_slot = _normalize_objective_owner(acting_slot)
	if not objective_owner.is_empty() and (not owner_display_name.is_empty() or owner_color is Color):
		_set_objective_owner_identity(objective_owner, owner_display_name, owner_color)
	objective_phase = phase.strip_edges().to_lower()
	if objective_phase.is_empty():
		objective_phase = "neutral"
	objective_progress = clampf(progress, 0.0, 1.0)
	_update_objective_visual()


func set_objective_faction_palette(slot_a_display_name: String, slot_a_color: Color, slot_b_display_name: String, slot_b_color: Color) -> void:
	_set_objective_owner_identity("A", slot_a_display_name, slot_a_color)
	_set_objective_owner_identity("B", slot_b_display_name, slot_b_color)
	_update_objective_visual()


func get_objective_owner_display_name(owner: String) -> String:
	var slot := _normalize_objective_owner(owner)
	return str(_objective_owner_names.get(slot, slot))


func get_objective_owner_color(owner: String) -> Color:
	var slot := _normalize_objective_owner(owner)
	return _objective_owner_colors.get(slot, OBJECTIVE_OWNER_COLORS[""])


func _create_visual() -> void:
	_objective_core = null
	_objective_segments.clear()
	_objective_label = null
	_objective_materials.clear()
	_objective_visual_signature = ""
	for child in get_children():
		if child is Node3D:
			child.queue_free()

	var lane_color: Color = LANE_COLORS.get(lane_tag, Color(0.72, 0.72, 0.72))
	var tint: Color = lane_color
	var accent: Color = lane_color.lightened(0.18)
	var base_material: StandardMaterial3D = PrimitiveVisualKit.make_material(tint.darkened(0.12), Color.BLACK, false, 0.72, 0.02)
	var accent_material: StandardMaterial3D = PrimitiveVisualKit.make_material(accent, accent * 0.35, true, 0.58, 0.02)
	var marker_material: StandardMaterial3D = PrimitiveVisualKit.make_material(tint.lightened(0.08), Color.BLACK, false, 0.64, 0.02)

	if item_type == "zone_annotation":
		add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(24.0, 1.5, 12.0), accent_material, Vector3(0.0, 0.75, 0.0)))
		add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(10.0, 4.0, 10.0), base_material, Vector3(0.0, 3.0, 0.0)))
	elif item_type.begins_with("spawn_core_zone_marker"):
		add_child(PrimitiveVisualKit.make_cylinder_mesh_instance(8.0, 6.0, base_material, Vector3(0.0, 4.0, 0.0)))
		add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(8.0, 4.0, 8.0), accent_material, Vector3(0.0, 10.0, 0.0)))
	elif item_type.find("alloy") >= 0:
		add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(10.0, 3.5, 10.0), base_material, Vector3(0.0, 1.75, 0.0)))
		add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(4.0, 7.0, 4.0), marker_material, Vector3(0.0, 7.0, 0.0)))
	elif item_type == "contested_data_node":
		_create_objective_visual(base_material)
	elif item_type.find("data") >= 0:
		add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(9.0, 2.0, 9.0), base_material, Vector3(0.0, 1.0, 0.0)))
		add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(3.0, 11.0, 3.0), accent_material, Vector3(0.0, 6.5, 0.0)))
	elif item_type.find("reclaim") >= 0:
		add_child(PrimitiveVisualKit.make_cylinder_mesh_instance(5.0, 8.0, base_material, Vector3(0.0, 2.5, 0.0)))
		add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(4.0, 4.0, 4.0), marker_material, Vector3(0.0, 6.0, 0.0)))
	elif item_type.find("cover") >= 0:
		add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(14.0, 5.0, 8.0), base_material, Vector3(0.0, 2.5, 0.0)))
		add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(6.0, 3.0, 4.0), accent_material, Vector3(0.0, 5.5, 0.0)))
	elif item_type.find("choke") >= 0:
		add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(8.0, 10.0, 8.0), base_material, Vector3(0.0, 5.0, 0.0)))
		add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(20.0, 2.0, 4.0), accent_material, Vector3(0.0, 9.5, 0.0)))
	elif item_type.find("elevated") >= 0:
		add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(8.0, 2.0, 8.0), base_material, Vector3(0.0, 1.0, 0.0)))
		add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(6.0, 10.0, 6.0), marker_material, Vector3(0.0, 7.0, 0.0)))
	elif item_type.find("los") >= 0:
		add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(5.0, 14.0, 5.0), base_material, Vector3(0.0, 7.0, 0.0)))
		add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(8.0, 2.0, 8.0), accent_material, Vector3(0.0, 14.5, 0.0)))
	elif item_type.find("relay") >= 0:
		add_child(PrimitiveVisualKit.make_cylinder_mesh_instance(10.0, 5.0, base_material, Vector3(0.0, 5.0, 0.0)))
		add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(4.0, 12.0, 4.0), accent_material, Vector3(0.0, 13.0, 0.0)))
	else:
		add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(8.0, 4.0, 8.0), base_material, Vector3(0.0, 2.0, 0.0)))
		add_child(PrimitiveVisualKit.make_box_mesh_instance(Vector3(4.0, 6.0, 4.0), accent_material, Vector3(0.0, 6.0, 0.0)))


func _create_objective_visual(base_material: StandardMaterial3D) -> void:
	_objective_materials = {
		"inactive": PrimitiveVisualKit.make_material(Color(0.16, 0.18, 0.22), Color.BLACK, false, 0.78, 0.04),
		"neutral": PrimitiveVisualKit.make_material(OBJECTIVE_OWNER_COLORS[""], Color(0.12, 0.14, 0.16), true, 0.54, 0.08),
		"A": _make_objective_owner_material(_objective_owner_colors["A"]),
		"B": _make_objective_owner_material(_objective_owner_colors["B"]),
		"contested": PrimitiveVisualKit.make_material(Color(1.0, 0.72, 0.18), Color(0.42, 0.18, 0.02), true, 0.42, 0.08),
	}

	add_child(PrimitiveVisualKit.make_cylinder_mesh_instance(1.6, 7.0, base_material, Vector3(0.0, 0.8, 0.0)))
	_objective_core = PrimitiveVisualKit.make_cylinder_mesh_instance(
		8.5,
		2.1,
		_objective_materials["neutral"],
		Vector3(0.0, 5.6, 0.0)
	)
	_objective_core.name = "ObjectiveCore"
	add_child(_objective_core)

	for segment_index in OBJECTIVE_SEGMENT_COUNT:
		var angle := TAU * float(segment_index) / float(OBJECTIVE_SEGMENT_COUNT)
		var segment_position := Vector3(cos(angle) * 8.2, 1.9, sin(angle) * 8.2)
		var segment := PrimitiveVisualKit.make_box_mesh_instance(
			Vector3(2.9, 0.8, 1.25),
			_objective_materials["inactive"],
			segment_position,
			Vector3(0.0, -rad_to_deg(angle), 0.0)
		)
		segment.name = "ObjectiveSegment%02d" % segment_index
		_objective_segments.append(segment)
		add_child(segment)

	_objective_label = Label3D.new()
	_objective_label.name = "ObjectiveStateLabel"
	_objective_label.position = Vector3(0.0, 11.5, 0.0)
	_objective_label.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	_objective_label.font_size = 42
	_objective_label.outline_size = 8
	_objective_label.modulate = Color.WHITE
	_objective_label.outline_modulate = Color(0.02, 0.03, 0.05, 0.94)
	add_child(_objective_label)
	_update_objective_visual()


func _update_objective_visual() -> void:
	if item_type != "contested_data_node" or _objective_core == null or _objective_label == null:
		return
	var visual_signature := "%s|%s|%s|%.4f|%s|%s|%s|%s" % [
		objective_owner,
		objective_acting_slot,
		objective_phase,
		objective_progress,
		str(_objective_owner_names.get("A", "A")),
		str(_objective_owner_colors.get("A", OBJECTIVE_OWNER_COLORS["A"])),
		str(_objective_owner_names.get("B", "B")),
		str(_objective_owner_colors.get("B", OBJECTIVE_OWNER_COLORS["B"])),
	]
	if visual_signature == _objective_visual_signature:
		return
	_objective_visual_signature = visual_signature

	var is_contested := objective_phase == "contested"
	var display_slot := objective_acting_slot if objective_phase == "capturing" or objective_phase == "neutralizing" or objective_phase == "recovering" else objective_owner
	var state_material_key := "contested" if is_contested else display_slot
	if state_material_key.is_empty():
		state_material_key = "neutral"
	if not _objective_materials.has(state_material_key):
		state_material_key = "neutral"
	_objective_core.material_override = _objective_materials[state_material_key]

	var filled_segments := int(ceil(objective_progress * float(OBJECTIVE_SEGMENT_COUNT)))
	for segment_index in _objective_segments.size():
		var segment := _objective_segments[segment_index]
		if is_contested:
			segment.material_override = _objective_materials["contested"] if segment_index % 2 == 0 else _objective_materials["inactive"]
		elif segment_index < filled_segments:
			segment.material_override = _objective_materials[state_material_key]
		else:
			segment.material_override = _objective_materials["inactive"]

	var progress_percent := int(round(objective_progress * 100.0))
	_objective_label.text = "DATA NODE\n%s  %d%%" % [_objective_status_text(), progress_percent]
	_objective_label.modulate = _objective_owner_colors.get(display_slot, OBJECTIVE_OWNER_COLORS[""])
	if is_contested:
		_objective_label.modulate = Color(1.0, 0.78, 0.24)


func _normalize_objective_owner(owner: String) -> String:
	match owner.strip_edges().to_lower():
		"a", "player_a", "slot_a":
			return "A"
		"b", "player_b", "slot_b":
			return "B"
		_:
			return ""


func _objective_status_text() -> String:
	if objective_phase == "contested":
		return "CONTESTED"
	if objective_phase == "capturing" and objective_acting_slot != "":
		return "%s · CAPTURING" % str(_objective_owner_names.get(objective_acting_slot, objective_acting_slot))
	if objective_phase == "neutralizing" and objective_acting_slot != "":
		return "%s · NEUTRALIZING %s" % [str(_objective_owner_names.get(objective_acting_slot, objective_acting_slot)), str(_objective_owner_names.get(objective_owner, objective_owner))]
	if objective_phase == "recovering" and objective_acting_slot != "":
		return "%s · RE-SECURING" % str(_objective_owner_names.get(objective_acting_slot, objective_acting_slot))
	if objective_owner == "A" or objective_owner == "B":
		return "%s · %s" % [str(_objective_owner_names.get(objective_owner, objective_owner)), objective_phase.to_upper()]
	return objective_phase.to_upper()


func _set_objective_owner_identity(owner: String, display_name: String, color_value: Variant) -> void:
	if not display_name.is_empty() and str(_objective_owner_names.get(owner, "")) != display_name:
		_objective_owner_names[owner] = display_name
	if color_value is Color and _objective_owner_colors.get(owner, Color.TRANSPARENT) != color_value:
		_objective_owner_colors[owner] = color_value
		if not _objective_materials.is_empty():
			_objective_materials[owner] = _make_objective_owner_material(color_value)


func _make_objective_owner_material(owner_color: Color) -> StandardMaterial3D:
	return PrimitiveVisualKit.make_material(owner_color, owner_color * 0.42, true, 0.46, 0.08)
