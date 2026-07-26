extends Node3D

const levelSize = 20

var fruit: Resource = preload("res://content/item/item.tscn")
var gas: Resource = preload("res://content/env_models/gas.tscn")


var fruitCount = 0
@onready var fruitLabel = get_node("HUD").get_node("Fruits")

var gasTimer: Timer = null
var fruitTimer: Timer = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    fruitCount = 0
    gasTimer = $GasTimer
    fruitTimer = $FruitTimer
    fruitLabel.text = "Fruits: " + str(fruitCount)


func add_fruit() -> void:
    fruitCount += 1
    fruitLabel.text = "Fruits: " + str(fruitCount)


func _on_gas_timer_timeout() -> void:
    gasTimer.start()
    spawnItem(gas)


func _on_fruit_timer_timeout() -> void:
    fruitTimer.start()
    spawnItem(fruit)


func spawnItem(resource: Resource) -> void:

    var item: Node3D = resource.instantiate()

    item.position.x = randi_range(-levelSize, levelSize);
    item.position.z = randi_range(-levelSize, levelSize);

    add_child(item)
