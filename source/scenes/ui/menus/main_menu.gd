extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# connect signals to buttons
	%StartGameButton.pressed.connect(_on_start_game_pressed)
	%HowToPlayButton.pressed.connect(_on_how_to_play_pressed)
	%CreditsButton.pressed.connect(_on_credits_pressed)
	%ExitGameButton.pressed.connect(_on_exit_game_pressed)
	tree_entered.connect(_on_tree_entered)
	# set focus
	# set music
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_tree_entered() -> void:
	$"%StartGameButton".focus_mode()

func _on_start_game_pressed() -> void:
	# Switch scene to game scene, alternatively handle this transition in the main scene.
	get_tree().change_scene_to_file("res://source/scenes/throne_room/throne_room.tscn")

func _on_how_to_play_pressed() -> void:
	# Hide(?) other objects, bring up HTP scene in front
	pass


func _on_credits_pressed() -> void:
	# Hide(?) other objects, bring up Credits scene in front
	pass


func _on_exit_game_pressed() -> void:
	#Add confirmation
	get_tree().quit()

# TODO
# Focus button on load and unhide.
# 
