extends Node2D
class_name UnitActor

const REQUIRED_BASELINE_STATES := ["idle", "move", "action_primary", "react_hit", "death"]

var faction_id: String = ""
var unit_id: String = ""
var action_primary_clip: String = "action_primary"
var optional_clips: Array[String] = []
var _animation_player: AnimationPlayer
var _animation_library: AnimationLibrary


func initialize(profile: Dictionary) -> void:
	faction_id = str(profile.get("faction", "unknown"))
	unit_id = str(profile.get("unit", "unknown_unit"))
	action_primary_clip = str(profile.get("primary_clip", "action_primary"))
	optional_clips = []
	var optional_variant: Variant = profile.get("optional", [])
	if optional_variant is Array:
		for optional_clip in optional_variant:
			optional_clips.append(str(optional_clip))

	_animation_player = AnimationPlayer.new()
	_animation_player.name = "AnimationPlayer"
	add_child(_animation_player)
	_animation_library = AnimationLibrary.new()
	_animation_player.add_animation_library("", _animation_library)

	_register_clip("idle")
	_register_clip("move")
	_register_clip("action_primary")
	_register_clip("react_hit")
	_register_clip("death")
	_register_clip(action_primary_clip)
	for optional_clip in optional_clips:
		_register_clip(optional_clip)

	print("[Unit] Spawned faction=%s unit=%s primary_clip=%s optional=%s" % [faction_id, unit_id, action_primary_clip, str(optional_clips)])


func has_required_baseline() -> bool:
	for state_name in REQUIRED_BASELINE_STATES:
		if not _animation_player.has_animation(state_name):
			return false
	return true


func get_missing_required_states() -> Array[String]:
	var missing: Array[String] = []
	for state_name in REQUIRED_BASELINE_STATES:
		if not _animation_player.has_animation(state_name):
			missing.append(state_name)
	return missing


func _register_clip(clip_name: String) -> void:
	if _animation_player.has_animation(clip_name):
		return
	var animation := Animation.new()
	animation.length = 0.2
	_animation_library.add_animation(clip_name, animation)
