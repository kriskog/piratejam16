extends "res://source/scenes/game/events/event.gd"
@onready var game = get_parent()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_yes_pressed() -> void:
	game.set_reagents(game.get_reagents() - 20)
	game.set_money(game.get_money() + 20)
	queue_free()


func _on_no_pressed() -> void:
	queue_free()
