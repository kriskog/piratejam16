extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%MainMenu.start_game.connect(_on_start_game)
	%MainMenu.htp_screen.connect(_on_htp_screen)
	%MainMenu.credits_screen.connect(_on_credits_screen)
	%MainMenu.exit_game.connect(_on_exit_game)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


#region Signal funcs


func _on_start_game() -> void:
	# Kills current scene, not the right way to do this if we want to keep main "in charge".
	get_tree().change_scene_to_file("res://source/scenes/throne_room/throne_room.tscn")


func _on_htp_screen() -> void:
	# Should maybe be handled inside main menu.
	pass


func _on_credits_screen() -> void:
	# Should maybe be handled inside main menu.
	pass


func _on_exit_game() -> void:
	get_tree().quit()

#endregion
