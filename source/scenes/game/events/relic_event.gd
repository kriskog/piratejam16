extends "res://source/scenes/game/events/event.gd"
@onready var game = get_parent()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_yes_pressed() -> void:
	game.set_reagants(game.get_reagents() - 15)
	game.set_money(game.get_money() + 20)


func _on_no_pressed() -> void:
	game.set_influence(game.get_influence() + 5)
	game.set_chaos(game.get_chaos() - 10)
