extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var fuel:float = 15.0
@onready var mesh = $Mesh
@onready var fuelLabel = get_parent().get_node("HUD").get_node("Fuel")

func _ready() -> void:
    fuelLabel.text = "Fuel: " + str(snapped(fuel, 0.1))

func _physics_process(delta: float) -> void:
    if not is_on_floor():
        velocity += get_gravity() * delta

    # if Input.is_action_just_pressed("Jump") and is_on_floor():
    #     velocity.y = JUMP_VELOCITY

    var input_dir := Input.get_vector("Left", "Right", "Up", "Down")
    var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
    if direction and fuel > 0:
        velocity.x = direction.x * SPEED
        velocity.z = direction.z * SPEED
        mesh.rotation.y = lerp_angle(mesh.rotation.y, atan2(direction.x, direction.z), 0.1)
        fuel -= delta
        fuelLabel.text = "Fuel: " + str(snapped(fuel, 0.1))
    else:
        velocity.x = move_toward(velocity.x, 0, SPEED)
        velocity.z = move_toward(velocity.z, 0, SPEED)
        

    move_and_slide()
