extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%CloseButton.pressed.connect(_on_close_pressed)
	visibility_changed.connect(_on_visibility_changed)
	hide()
	load_from_files()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func load_from_files():
	var team = FileAccess.open("res://assets/team_members.txt", FileAccess.READ)
	var attributions = FileAccess.open("res://assets/attributions.txt", FileAccess.READ)

	var content: String = (
		"TEAM MEMBERS:\n" + team.get_as_text() + "\n\nATTRIBUTIONS:\n" + attributions.get_as_text()
	)
	%CreditsText.text = content


#region signal funcs


func _on_close_pressed() -> void:
	# Signals main to kill current scenes and bring up main menu.
	hide()


func _on_visibility_changed() -> void:
	# Keybind pressed, focus buttons etc
	if visible:
		%CloseButton.grab_focus()

#endregion
