extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("/root/ThroneRoom/CanvasLayer/PauseMenu").unpaused.connect(_on_unpaused)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_yes_pressed() -> void:
	pass


func _on_no_pressed() -> void:
	pass  # Replace with function body.


func _on_unpaused() -> void:
	%Option1.grab_focus()
