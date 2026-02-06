extends Node3D

@export var world_environment: WorldEnvironment
@export var omni_light_3d: OmniLight3D
@export var camera_3d: Camera3D
@export var timer: Timer

@onready var audio_music: AudioStreamPlayer = $Control/TextureRect/AudioMusic
@onready var audio_ambience_rocket: AudioStreamPlayer = $Control/TextureRect/AudioAmbienceRocket
@onready var audio_ambience_rumble: AudioStreamPlayer = $Control/TextureRect/AudioAmbienceRumble
@onready var animation_player: AnimationPlayer = $Control/TextureRect/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	camera_3d.spinning = true
	camera_3d.moving = true
	world_environment.go = true
	audio_music.play()
	audio_ambience_rocket.stop()
	audio_ambience_rumble.stop()
	animation_player.play("new_animation")
