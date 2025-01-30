extends "res://source/scenes/game/events/event.gd"
@onready var game = get_parent()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_yes_pressed() -> void:
	game.set_influence(game.get_influence() + 5)
	game.set_chaos(game.get_chaos() + 10)
	game.set_cult_size(game.get_cult_size() - 10)

func _on_no_pressed() -> void:
	game.set_influence(game.get_influence() - 5)
	game.set_chaos(game.get_chaos() - 5)
