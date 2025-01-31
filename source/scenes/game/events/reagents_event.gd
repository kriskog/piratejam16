extends "res://source/scenes/game/events/event.gd"
@onready var game = get_parent()


func _on_yes_pressed() -> void:
	game.set_reagents(game.get_reagents() - 20)
	game.set_money(game.get_money() + 15)
	queue_free()


func _on_no_pressed() -> void:
	game.set_reagents(game.get_reagents() - 20)
	game.set_chaos(game.get_chaos() + 15)
	queue_free()
