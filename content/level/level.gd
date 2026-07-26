extends Node3D

const levelSize = 20

var fruit: Resource = preload("res://content/item/item.tscn")
var gas: Resource = preload("res://content/env_models/gas.tscn")

var score = 0
var killCount = 0
var gasTimer: Timer = null
var fruitTimer: Timer = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score = 0
	killCount = 0
	gasTimer = $GasTimer
	fruitTimer = $FruitTimer

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:

	pass


func _on_gas_timer_timeout() -> void:
	gasTimer.start()
	spawnItem(gas)

	pass # Replace with function body.

func _on_fruit_timer_timeout() -> void:
	fruitTimer.start()
	spawnItem(fruit)
	
	pass # Replace with function body.

func spawnItem(resource: Resource) -> void:

	var item: Node3D = resource.instantiate()
	
	item.position.x = randi_range(-levelSize, levelSize);
	item.position.z = randi_range(-levelSize, levelSize);
	
	add_child(item)

	pass
