extends Control


func _ready() -> void:
    $Score.text = "Final score: " + str(Data.score)

func _on_button_pressed() -> void:
    get_tree().change_scene_to_file("res://content/level/menu.tscn")
