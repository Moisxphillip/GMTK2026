extends Camera3D

@export var target: Node3D = null
@export var speed: float = 10.0
@export var smoothness: float = 5.0
var current_position: Vector3 = Vector3.ZERO
var offset: Vector3 = Vector3.ZERO

func _ready():
	offset = global_transform.origin
	if target:
		current_position = target.global_transform.origin + offset
	
func _physics_process(delta):
	if not target:
		return
	
	var desired_position = target.global_transform.origin + offset
	var lerp_factor = smoothness * delta
	
	current_position = current_position.lerp(desired_position, lerp_factor)
	
	global_transform.origin = current_position
