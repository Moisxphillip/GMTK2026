extends Area3D
@export var outline: Material
var chirimoya = preload("res://content/item/chirimoya.glb")
var maracuja = preload("res://content/item/maracuja.glb")

var fruit: Node3D = null
var interactable:bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    if randi() % 2 == 0:
        fruit = chirimoya.instantiate()
    else:
        fruit = maracuja.instantiate()
    add_child(fruit)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
    if interactable and Input.is_action_just_pressed("Interact"):
        queue_free() # Remove the item from the scene
        pass #Add gather code
    pass


func _on_area_entered(_area: Area3D) -> void:
    interactable = true
    fruit.get_child(0).material_overlay = outline


func _on_area_exited(_area: Area3D) -> void:
    interactable = false
    fruit.get_child(0).material_overlay = null
