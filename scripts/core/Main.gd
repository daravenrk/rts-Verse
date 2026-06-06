extends Node

const SPLASH_DURATION_SECONDS := 5.0
const SKIRMISH_SCENE_PATH := "res://scenes/core/Skirmish.tscn"

var _menu_shown: bool = false
var _splash_timer: Timer
var _splash_layer: CanvasLayer
var _menu_layer: CanvasLayer


func _ready() -> void:
	print("[Startup] Bootstrap initialized")
	set_process_unhandled_input(true)
	_show_splash()


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

	print("[Startup] Splash shown")


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

	print("[Startup] Main menu shown (trigger=%s)" % reason)


func _on_skirmish_pressed() -> void:
	if not ResourceLoader.exists(SKIRMISH_SCENE_PATH):
		push_warning("[Menu] Skirmish scene missing: %s" % SKIRMISH_SCENE_PATH)
		return

	var result: Error = get_tree().change_scene_to_file(SKIRMISH_SCENE_PATH)
	if result != OK:
		push_error("[Menu] Failed to change scene (%s): %s" % [str(result), SKIRMISH_SCENE_PATH])
