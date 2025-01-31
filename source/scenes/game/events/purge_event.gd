extends "res://source/scenes/game/events/event.gd"
@onready var game = get_parent()


func _on_yes_pressed() -> void:
	game.set_influence(game.get_influence() - 5)
	game.set_cult_size(game.get_cult_size() - 20)
	queue_free()


func _on_no_pressed() -> void:
	game.set_influence(game.get_influence() - 5)
	game.set_chaos(game.get_chaos() + 15)
	queue_free()
