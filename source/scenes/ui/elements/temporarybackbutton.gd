extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_on_pressed)


func _on_pressed() -> void:
	# Switch scene to main scene, to avoid getting stuck during development.
	get_tree().change_scene_to_file("res://source/scenes/ui/menus/main_menu.tscn")
