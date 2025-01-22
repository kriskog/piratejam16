extends Control

signal start_game()
signal exit_game()

func _on_start_game_button_pressed() -> void:
	start_game.emit()
	hide()



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
