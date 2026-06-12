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

var stable_item_id: String = ""
var item_type: String = ""
var lane_tag: String = ""


func initialize(item_id: String, map_item_type: String, map_lane_tag: String) -> void:
	stable_item_id = item_id
	item_type = map_item_type
	lane_tag = map_lane_tag
	_create_visual()
	print("[MapItem] Initialized id=%s type=%s lane=%s position=%s" % [stable_item_id, item_type, lane_tag, str(position)])


func _create_visual() -> void:
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
