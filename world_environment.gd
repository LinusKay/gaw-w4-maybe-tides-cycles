extends WorldEnvironment

@export var go: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if go:
		environment.volumetric_fog_density -= 0.00005
		#environment.volumetric_fog_density = 0.5
		if environment.volumetric_fog_anisotropy < 0.81:
			environment.volumetric_fog_anisotropy += 0.005
