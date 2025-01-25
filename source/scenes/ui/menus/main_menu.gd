extends Control

#region Signals
signal start_game
signal htp_screen
signal credits_screen
signal exit_game
#endregion


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
	start_game.emit()


func _on_how_to_play_pressed() -> void:
	# Hide(?) other objects, bring up HTP scene in front
	htp_screen.emit()


func _on_credits_pressed() -> void:
	# Hide(?) other objects, bring up Credits scene in front
	credits_screen.emit()


func _on_exit_game_pressed() -> void:
	# Should have a confirmation
	exit_game.emit()
