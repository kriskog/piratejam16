extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# connect signals to buttons
	%ContinueButton.pressed.connect(_on_continue_pressed)
	%MainMenuButton.pressed.connect(_on_main_menu_pressed)
	visibility_changed.connect(_on_visibility_changed)
	hide()  #keybind will unhide, and focus


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


#region Signal funcs


func _on_continue_pressed() -> void:
	# Switch scene to game scene, alternatively handle this transition in the main scene.
	hide()


func _on_main_menu_pressed() -> void:
	# Signals main to kill current scenes and bring up main menu.
	get_tree().change_scene_to_file("res://source/scenes/ui/menus/main_menu.tscn")


func _on_visibility_changed() -> void:
	# Keybind pressed, focus buttons etc
	if visible:
		%ContinueButton.grab_focus()

#endregion
