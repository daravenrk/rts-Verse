extends Node

const GAMEPLAY_SCENE_PATH := "res://scenes/core/DuelPrototype.tscn"

func _ready() -> void:
	_initialize_startup()

func _initialize_startup() -> void:
	print("[Bootstrap] Startup initialized")

	if ResourceLoader.exists(GAMEPLAY_SCENE_PATH):
		call_deferred("_transition_to_gameplay")
	else:
		push_warning("[Bootstrap] Gameplay scene missing: %s" % GAMEPLAY_SCENE_PATH)

func _transition_to_gameplay() -> void:
	var result: Error = get_tree().change_scene_to_file(GAMEPLAY_SCENE_PATH)
	if result != OK:
		push_error("[Bootstrap] Failed to change scene (%s): %s" % [str(result), GAMEPLAY_SCENE_PATH])
