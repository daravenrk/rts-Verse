extends Node2D
class_name BuildableNode

var stable_item_id: String = ""
var slot: String = ""
var buildable_id: String = ""
var tier: String = ""


func initialize(item_id: String, owner_slot: String, id: String, build_tier: String) -> void:
	stable_item_id = item_id
	slot = owner_slot
	buildable_id = id
	tier = build_tier
	print("[Build] Node initialized id=%s slot=%s buildable=%s tier=%s" % [stable_item_id, slot, buildable_id, tier])
