extends Control

@onready var click: AudioStreamPlayer = $Click


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
	var tutorial = ResourceLoader.load("res://assets/how_to_play.txt")
	var howtoplay = FileAccess.open(tutorial, FileAccess.READ)

	var content: String = howtoplay.get_as_text()
	%TutorialText.text = content


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
