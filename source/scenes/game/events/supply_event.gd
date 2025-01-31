extends "res://source/scenes/game/events/event.gd"
@onready var game = get_parent()


func _on_yes_pressed() -> void:
	game.set_money(game.get_money() - 10)
	game.set_reagents(game.get_reagents() + 10)
	queue_free()


func _on_no_pressed() -> void:
#	nothing
	queue_free()
