extends Control

const MAIN_SCENE_PATH := "res://scenes/core/Main.tscn"
const FIRST_DUEL_MAP_SCENE_PATH := "res://scenes/core/FirstDuelMap.tscn"
const SKIRMISH_TEST_AUTO_START_FLAG := "--skirmish-test-auto-start"
const SKIRMISH_TEST_PLAYER_FACTION_PREFIX := "--skirmish-test-player-faction="
const SKIRMISH_TEST_ENEMY_FACTION_PREFIX := "--skirmish-test-enemy-faction="
const CampaignData := preload("res://scripts/core/CampaignData.gd")

const FACTIONS := [
	{"id": "helion", "name": "Helion Directorate", "available": true},
	{"id": "veyari", "name": "Veyari Swarm", "available": true},
	{"id": "obsidian", "name": "Obsidian Forge", "available": false},
	{"id": "civcolony", "name": "Civilian Colony Compact", "available": false},
	{"id": "autarch", "name": "Autarch Network", "available": false}
]

@onready var _player_selector: OptionButton = %PlayerFactionSelector
@onready var _enemy_selector: OptionButton = %EnemyFactionSelector
@onready var _campaign_order_label: Label = %CampaignOrderLabel
@onready var _status_label: Label = %StatusLabel


func _ready() -> void:
	_populate_selector(_player_selector, "player")
	_populate_selector(_enemy_selector, "enemy")
	_apply_test_faction_override(_player_selector, SKIRMISH_TEST_PLAYER_FACTION_PREFIX, "player")
	_apply_test_faction_override(_enemy_selector, SKIRMISH_TEST_ENEMY_FACTION_PREFIX, "enemy")
	_apply_campaign_order_summary()
	_update_status()
	print("[Skirmish] Faction gate initialized")
	if _has_user_flag(SKIRMISH_TEST_AUTO_START_FLAG):
		print("[Skirmish] Test override enabled: auto start match")
		call_deferred("_on_start_match_button_pressed")


func _apply_campaign_order_summary() -> void:
	var first_perspective := CampaignData.get_first_perspective()
	var final_perspective := CampaignData.get_final_perspective()
	var summary := CampaignData.describe_order()
	_campaign_order_label.text = "Campaign order: %s" % summary
	print("[Campaign] Perspective order first=%s final=%s full=%s" % [first_perspective, final_perspective, summary])


func _populate_selector(selector: OptionButton, selector_role: String) -> void:
	selector.clear()
	for faction in FACTIONS:
		var is_available: bool = faction["available"]
		var display_name: String = faction["name"]
		if not is_available:
			display_name += " (Coming Soon)"

		selector.add_item(display_name)
		var index := selector.item_count - 1
		selector.set_item_metadata(index, faction["id"])
		selector.set_item_disabled(index, not is_available)
		print("[Skirmish] %s option: %s available=%s" % [selector_role, faction["id"], str(is_available)])

	_select_first_available(selector)


func _select_first_available(selector: OptionButton) -> void:
	for index in selector.item_count:
		if not selector.is_item_disabled(index):
			selector.select(index)
			return


func _apply_test_faction_override(selector: OptionButton, prefix: String, role: String) -> void:
	var requested_faction := _get_user_arg_value(prefix)
	if requested_faction.is_empty():
		return
	for index in selector.item_count:
		if str(selector.get_item_metadata(index)) != requested_faction:
			continue
		if selector.is_item_disabled(index):
			push_error("[Skirmish] Test faction unavailable role=%s faction=%s" % [role, requested_faction])
			return
		selector.select(index)
		print("[Skirmish] Test faction selected role=%s faction=%s" % [role, requested_faction])
		return
	push_error("[Skirmish] Test faction unknown role=%s faction=%s" % [role, requested_faction])


func _on_player_faction_selector_item_selected(_index: int) -> void:
	_update_status()


func _on_enemy_faction_selector_item_selected(_index: int) -> void:
	_update_status()


func _on_start_match_button_pressed() -> void:
	var player_faction_id := _get_selected_faction_id(_player_selector)
	var enemy_faction_id := _get_selected_faction_id(_enemy_selector)
	_status_label.text = "Loading duel map: %s vs %s" % [player_faction_id, enemy_faction_id]
	get_tree().root.set_meta("duel_player_faction", player_faction_id)
	get_tree().root.set_meta("duel_enemy_faction", enemy_faction_id)
	print("[Skirmish] Start pressed: player=%s enemy=%s" % [player_faction_id, enemy_faction_id])

	var result := get_tree().change_scene_to_file(FIRST_DUEL_MAP_SCENE_PATH)
	if result != OK:
		push_error("[Skirmish] Failed to load duel map (%s)" % str(result))


func _on_back_button_pressed() -> void:
	var result := get_tree().change_scene_to_file(MAIN_SCENE_PATH)
	if result != OK:
		push_error("[Skirmish] Failed to return to main menu (%s)" % str(result))


func _get_selected_faction_id(selector: OptionButton) -> String:
	if selector.selected < 0:
		return "none"
	return str(selector.get_item_metadata(selector.selected))


func _update_status() -> void:
	var player_faction_id := _get_selected_faction_id(_player_selector)
	var enemy_faction_id := _get_selected_faction_id(_enemy_selector)
	var first_perspective := CampaignData.get_first_perspective()
	var final_perspective := CampaignData.get_final_perspective()
	_status_label.text = "Selected factions: %s vs %s | Campaign: %s -> %s" % [player_faction_id, enemy_faction_id, first_perspective, final_perspective]


func _has_user_flag(flag: String) -> bool:
	for argument in OS.get_cmdline_user_args():
		if argument == flag:
			return true
	return false


func _get_user_arg_value(prefix: String) -> String:
	for argument in OS.get_cmdline_user_args():
		if argument.begins_with(prefix):
			return argument.trim_prefix(prefix)
	return ""
