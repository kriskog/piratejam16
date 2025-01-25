extends GutTest

var MainMenu = load("res://source/scenes/ui/menus/main_menu.tscn").instantiate();

func test_start_game_button():
	var start_button: Button = MainMenu.StartGameButton
	#start_button.pressed.emit()
	
	#assert_signal_emitted(start_button, pressed, "Start Game button sent pressed signal.")
	
	
