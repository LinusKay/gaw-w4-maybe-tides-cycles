extends Camera3D

@export var moving: bool = false
@export var spinning: bool = false




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if moving:
		position.z += 0.1
	if spinning:
		rotation.z += .0003
	pass
