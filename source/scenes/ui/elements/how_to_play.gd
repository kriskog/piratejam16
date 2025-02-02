extends Control

@onready var click: AudioStreamPlayer = $Click


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%CloseButton.pressed.connect(_on_close_pressed)
	visibility_changed.connect(_on_visibility_changed)
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


#region signal funcs


func _on_close_pressed() -> void:
	# Signals main to kill current scenes and bring up main menu.
	click.play()
	hide()


func _on_visibility_changed() -> void:
	# Keybind pressed, focus buttons etc
	if visible:
		%CloseButton.grab_focus()

#endregion
