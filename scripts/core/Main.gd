extends Node

const SPLASH_DURATION_SECONDS := 5.0
const SKIRMISH_SCENE_PATH := "res://scenes/core/Skirmish.tscn"
const STARTUP_STEP_INPUT_PROFILE := "input_profile_load"
const STARTUP_STEP_CORE_MANAGER_INIT := "core_manager_init"
const STARTUP_STEP_GAMEPLAY_TRANSITION := "gameplay_scene_transition"
const STARTUP_TEST_AUTO_KEYPRESS_FLAG := "--startup-test-keypress"

var _menu_shown: bool = false
var _splash_timer: Timer
var _splash_layer: CanvasLayer
var _menu_layer: CanvasLayer
var _startup_checklist: Dictionary = {}
var _core_manager_root: Node
var _startup_boot_timestamp_iso: String = ""


func _ready() -> void:
	_startup_boot_timestamp_iso = Time.get_datetime_string_from_system(true)
	print("[Startup] Bootstrap initialized")
	_initialize_startup_checklist()
	_load_input_profile()
	_initialize_core_managers()
	set_process_unhandled_input(true)
	_show_splash()
	_apply_startup_test_overrides()
	print("[Startup] Checklist summary: %s" % str(_startup_checklist))


func _initialize_startup_checklist() -> void:
	_startup_checklist = {
		STARTUP_STEP_INPUT_PROFILE: "pending",
		STARTUP_STEP_CORE_MANAGER_INIT: "pending",
		STARTUP_STEP_GAMEPLAY_TRANSITION: "pending"
	}


func _mark_startup_step(step_id: String, status: String, detail: String) -> void:
	_startup_checklist[step_id] = status
	print("[Startup] Checklist %s=%s (%s)" % [step_id, status, detail])


func _load_input_profile() -> void:
	var required_actions := PackedStringArray(["ui_accept", "ui_cancel", "ui_select", "ui_right_click"])
	for action in required_actions:
		if not InputMap.has_action(action):
			InputMap.add_action(action)

	_mark_startup_step(STARTUP_STEP_INPUT_PROFILE, "done", "input actions prepared")


func _initialize_core_managers() -> void:
	if _core_manager_root and is_instance_valid(_core_manager_root):
		_mark_startup_step(STARTUP_STEP_CORE_MANAGER_INIT, "done", "core managers already initialized")
		return

	_core_manager_root = Node.new()
	_core_manager_root.name = "CoreManagers"
	add_child(_core_manager_root)

	var input_manager := Node.new()
	input_manager.name = "InputManager"
	_core_manager_root.add_child(input_manager)

	var game_state_manager := Node.new()
	game_state_manager.name = "GameStateManager"
	_core_manager_root.add_child(game_state_manager)

	_mark_startup_step(STARTUP_STEP_CORE_MANAGER_INIT, "done", "core manager stubs initialized")


func _unhandled_input(event: InputEvent) -> void:
	if _menu_shown:
		return

	if event is InputEventKey and event.pressed and not event.echo:
		_show_main_menu("keypress")


func _show_splash() -> void:
	_splash_layer = CanvasLayer.new()
	add_child(_splash_layer)

	var root := Control.new()
	root.set_anchors_preset(Control.PRESET_FULL_RECT)
	_splash_layer.add_child(root)

	var background := ColorRect.new()
	background.set_anchors_preset(Control.PRESET_FULL_RECT)
	background.color = Color(0.02, 0.02, 0.04, 1.0)
	root.add_child(background)

	var title := Label.new()
	title.text = "RTS VERSE"
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	title.add_theme_font_size_override("font_size", 56)
	title.set_anchors_preset(Control.PRESET_CENTER)
	title.position = Vector2(-220, -90)
	title.size = Vector2(440, 80)
	root.add_child(title)

	var prompt := Label.new()
	prompt.text = "Press any key to continue"
	prompt.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	prompt.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	prompt.add_theme_font_size_override("font_size", 20)
	prompt.set_anchors_preset(Control.PRESET_CENTER)
	prompt.position = Vector2(-200, -10)
	prompt.size = Vector2(400, 40)
	root.add_child(prompt)

	var timeout_note := Label.new()
	timeout_note.text = "Auto-continue in 5 seconds"
	timeout_note.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	timeout_note.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	timeout_note.add_theme_font_size_override("font_size", 16)
	timeout_note.set_anchors_preset(Control.PRESET_CENTER)
	timeout_note.position = Vector2(-200, 24)
	timeout_note.size = Vector2(400, 30)
	root.add_child(timeout_note)

	_splash_timer = Timer.new()
	_splash_timer.one_shot = true
	_splash_timer.wait_time = SPLASH_DURATION_SECONDS
	_splash_timer.timeout.connect(_on_splash_timeout)
	add_child(_splash_timer)
	_splash_timer.start()

	print("[Startup] Splash shown (timestamp=%s)" % _startup_boot_timestamp_iso)


func _apply_startup_test_overrides() -> void:
	if not _has_user_flag(STARTUP_TEST_AUTO_KEYPRESS_FLAG):
		return

	var test_keypress_timer := Timer.new()
	test_keypress_timer.one_shot = true
	test_keypress_timer.wait_time = 0.2
	test_keypress_timer.timeout.connect(_on_startup_test_keypress_timeout)
	add_child(test_keypress_timer)
	test_keypress_timer.start()
	print("[Startup] Test override enabled: auto keypress transition")


func _on_startup_test_keypress_timeout() -> void:
	_show_main_menu("keypress")


func _has_user_flag(flag: String) -> bool:
	for argument in OS.get_cmdline_user_args():
		if argument == flag:
			return true
	return false


func _on_splash_timeout() -> void:
	_show_main_menu("timeout")


func _show_main_menu(reason: String) -> void:
	if _menu_shown:
		return

	_menu_shown = true

	if _splash_timer and is_instance_valid(_splash_timer):
		_splash_timer.stop()
		_splash_timer.queue_free()

	if _splash_layer and is_instance_valid(_splash_layer):
		_splash_layer.queue_free()

	_menu_layer = CanvasLayer.new()
	add_child(_menu_layer)

	var root := Control.new()
	root.set_anchors_preset(Control.PRESET_FULL_RECT)
	_menu_layer.add_child(root)

	var background := ColorRect.new()
	background.set_anchors_preset(Control.PRESET_FULL_RECT)
	background.color = Color(0.04, 0.05, 0.09, 1.0)
	root.add_child(background)

	var vbox := VBoxContainer.new()
	vbox.set_anchors_preset(Control.PRESET_CENTER)
	vbox.position = Vector2(-220, -170)
	vbox.size = Vector2(440, 340)
	vbox.alignment = BoxContainer.ALIGNMENT_CENTER
	vbox.add_theme_constant_override("separation", 18)
	root.add_child(vbox)

	var title := Label.new()
	title.text = "RTS VERSE"
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title.add_theme_font_size_override("font_size", 48)
	vbox.add_child(title)

	var subtitle := Label.new()
	subtitle.text = "Main Menu"
	subtitle.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	subtitle.add_theme_font_size_override("font_size", 22)
	vbox.add_child(subtitle)

	var skirmish_button := Button.new()
	skirmish_button.text = "Skirmish"
	skirmish_button.custom_minimum_size = Vector2(320, 52)
	skirmish_button.pressed.connect(_on_skirmish_pressed)
	vbox.add_child(skirmish_button)

	var campaign_button := Button.new()
	campaign_button.text = "Campaign (Coming Soon)"
	campaign_button.custom_minimum_size = Vector2(320, 52)
	campaign_button.disabled = true
	vbox.add_child(campaign_button)

	_mark_startup_step(STARTUP_STEP_GAMEPLAY_TRANSITION, "pending", "awaiting skirmish scene transition")
	var menu_state_payload := {
		"transition_reason": reason,
		"transition_timestamp": Time.get_datetime_string_from_system(true),
		"splash_timestamp": _startup_boot_timestamp_iso,
		"skirmish_enabled": not skirmish_button.disabled,
		"campaign_enabled": not campaign_button.disabled,
		"campaign_label": campaign_button.text
	}
	print("[Startup] Main menu shown payload=%s" % str(menu_state_payload))


func _on_skirmish_pressed() -> void:
	if not ResourceLoader.exists(SKIRMISH_SCENE_PATH):
		_mark_startup_step(STARTUP_STEP_GAMEPLAY_TRANSITION, "failed", "skirmish scene missing")
		push_warning("[Menu] Skirmish scene missing: %s" % SKIRMISH_SCENE_PATH)
		return

	var result: Error = get_tree().change_scene_to_file(SKIRMISH_SCENE_PATH)
	if result != OK:
		_mark_startup_step(STARTUP_STEP_GAMEPLAY_TRANSITION, "failed", "scene transition error")
		push_error("[Menu] Failed to change scene (%s): %s" % [str(result), SKIRMISH_SCENE_PATH])
		return

	_mark_startup_step(STARTUP_STEP_GAMEPLAY_TRANSITION, "done", "entered skirmish scene")
