extends RefCounted
class_name PrimitiveVisualKit

const FACTION_COLORS := {
	"helion": Color(0.2, 0.5, 1.0),
	"veyari": Color(0.2, 0.8, 0.3),
	"obsidian": Color(0.8, 0.35, 0.1),
}

const TIER_COLORS := {
	"T0": Color(0.55, 0.7, 0.9),
	"T1": Color(0.85, 0.75, 0.35),
	"T2": Color(0.95, 0.45, 0.3),
}


static func get_faction_color(faction_id: String) -> Color:
	return FACTION_COLORS.get(faction_id, Color(0.7, 0.7, 0.7))


static func get_tier_color(tier: String) -> Color:
	return TIER_COLORS.get(tier, Color(0.7, 0.7, 0.7))


static func make_material(base_color: Color, emission_color: Color = Color.BLACK, emission_enabled: bool = false, roughness: float = 0.7, metallic: float = 0.02) -> StandardMaterial3D:
	var material := StandardMaterial3D.new()
	material.albedo_color = base_color
	material.roughness = roughness
	material.metallic = metallic
	material.metallic_specular = 0.1
	material.emission_enabled = emission_enabled
	material.emission = emission_color
	return material


static func make_box_mesh_instance(size: Vector3, material: StandardMaterial3D, position: Vector3 = Vector3.ZERO, rotation_degrees: Vector3 = Vector3.ZERO) -> MeshInstance3D:
	var mesh_instance := MeshInstance3D.new()
	var box := BoxMesh.new()
	box.size = size
	mesh_instance.mesh = box
	mesh_instance.material_override = material
	mesh_instance.position = position
	mesh_instance.rotation_degrees = rotation_degrees
	return mesh_instance


static func make_cylinder_mesh_instance(height: float, radius: float, material: StandardMaterial3D, position: Vector3 = Vector3.ZERO, rotation_degrees: Vector3 = Vector3.ZERO) -> MeshInstance3D:
	var mesh_instance := MeshInstance3D.new()
	var cylinder := CylinderMesh.new()
	cylinder.height = height
	cylinder.top_radius = radius
	cylinder.bottom_radius = radius
	mesh_instance.mesh = cylinder
	mesh_instance.material_override = material
	mesh_instance.position = position
	mesh_instance.rotation_degrees = rotation_degrees
	return mesh_instance