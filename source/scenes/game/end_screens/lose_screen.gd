extends Control

@onready var wompwomp: AudioStreamPlayer = $wompwomp
@onready var text_box: RichTextLabel = $RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text_box.text = Texts.end_text
	wompwomp.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://source/scenes/ui/menus/main_menu.tscn")
