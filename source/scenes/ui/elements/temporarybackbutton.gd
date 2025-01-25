extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_on_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	# Switch scene to main menu scene, to avoid getting stuck during development.
	get_tree().change_scene_to_file("res://source/scenes/ui/menus/main_menu.tscn")
