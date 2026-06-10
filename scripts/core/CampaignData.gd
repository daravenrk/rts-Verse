extends RefCounted

const MISSION_PERSPECTIVE_ORDER := [
	"veyari",
	"helion"
]

const FACTION_DISPLAY_NAMES := {
	"veyari": "Veyari Swarm",
	"helion": "Helion Directorate"
}


static func get_perspective_order() -> Array:
	return MISSION_PERSPECTIVE_ORDER.duplicate()


static func get_first_perspective() -> String:
	if MISSION_PERSPECTIVE_ORDER.is_empty():
		return "none"
	return MISSION_PERSPECTIVE_ORDER[0]


static func get_final_perspective() -> String:
	if MISSION_PERSPECTIVE_ORDER.is_empty():
		return "none"
	return MISSION_PERSPECTIVE_ORDER[MISSION_PERSPECTIVE_ORDER.size() - 1]


static func get_display_name(faction_id: String) -> String:
	if FACTION_DISPLAY_NAMES.has(faction_id):
		return str(FACTION_DISPLAY_NAMES[faction_id])
	return faction_id


static func describe_order() -> String:
	var display_order: Array[String] = []
	for faction_id in MISSION_PERSPECTIVE_ORDER:
		display_order.append(get_display_name(faction_id))
	return " -> ".join(display_order)