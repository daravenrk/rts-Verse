extends Node2D
class_name MapItem

var stable_item_id: String = ""
var item_type: String = ""
var lane_tag: String = ""


func initialize(item_id: String, map_item_type: String, map_lane_tag: String) -> void:
	stable_item_id = item_id
	item_type = map_item_type
	lane_tag = map_lane_tag
	print("[MapItem] Initialized id=%s type=%s lane=%s position=%s" % [stable_item_id, item_type, lane_tag, str(position)])
