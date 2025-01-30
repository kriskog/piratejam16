extends Control

@onready var click: AudioStreamPlayer = $Click


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# connect signals to buttons
	%StartGameButton.pressed.connect(_on_start_game_pressed)
	%HowToPlayButton.pressed.connect(_on_how_to_play_pressed)
	%CreditsButton.pressed.connect(_on_credits_pressed)
	%ExitGameButton.pressed.connect(_on_exit_game_pressed)
	tree_entered.connect(_on_tree_entered)
	tree_exited.connect(_on_tree_exited)
	_on_tree_entered()  # First signal went off before connecting.


#region Signal funcs


# Makes sure we do the important things when the menu opens. Set button focus, menu music?
func _on_tree_entered() -> void:
	%StartGameButton.grab_focus()


func _on_tree_exited() -> void:
	# Stop menu music etc? This might not be needed if handled in main.
	pass


func _on_start_game_pressed() -> void:
	# Switch scene to game scene, alternatively handle this transition in the main scene.
	click.play()
	get_tree().change_scene_to_file("res://source/scenes/throne_room/throne_room.tscn")


func _on_how_to_play_pressed() -> void:
	click.play()
	# Hide(?) other objects, bring up HTP scene in front
	pass


func _on_credits_pressed() -> void:
	click.play()
	# Hide(?) other objects, bring up Credits scene in front
	pass


func _on_exit_game_pressed() -> void:
	click.play()
	# Should have a confirmation
	get_tree().quit()
