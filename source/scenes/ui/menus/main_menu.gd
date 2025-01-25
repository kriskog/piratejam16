extends Control

signal start_game


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_start_game_pressed() -> void:
	start_game.emit()
	hide()


func _on_how_to_play_pressed() -> void:
	pass  # Replace with function body.


func _on_credits_pressed() -> void:
	pass  # Replace with function body.


func _on_exit_game_pressed() -> void:
	get_tree().quit()
