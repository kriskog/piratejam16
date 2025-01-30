extends Control

#region Signals
signal influence_full
signal influence_empty
signal chaos_full
signal chaos_empty
signal chaos_low
signal chaos_high
signal chaos_mid
signal money_full
signal money_empty
signal money_low
signal money_high
signal money_mid
signal cult_size_full
signal cult_size_empty
signal cult_size_low
signal cult_size_high
signal cult_size_mid
signal reagents_full
signal reagents_empty
signal reagents_low
signal reagents_high
signal reagents_mid
#endregion

#region Enums

enum StatState { EMPTY, LOW, MID, HIGH, FULL }

#endregion

#region Constants
# Max constants
const MAX_INFLUENCE: int = 100
const MAX_CHAOS: int = 100
const MAX_MONEY: int = 100
const MAX_CULT_SIZE: int = 100
const MAX_REAGENTS: int = 100
#endregion

#region Private Variables
# Saves
var _saves: Array = []

# Events
var _events: Array = []

# Main game resource
var _influence: int = 0:
	get = get_influence,
	set = set_influence

# Secondary resources
var _chaos: int = 50:
	get = get_chaos,
	set = set_chaos
var _money: int = 50:
	get = get_money,
	set = set_money
var _cult_size: int = 50:
	get = get_cult_size,
	set = set_cult_size
var _reagents: int = 50:
	get = get_reagents,
	set = set_reagents

# Resource states
var _chaos_state: StatState = StatState.MID:
	get = get_chaos_state,
	set = set_chaos_state
var _money_state: StatState = StatState.MID:
	get = get_money_state,
	set = set_money_state
var _cult_size_state: StatState = StatState.MID:
	get = get_cult_size_state,
	set = set_cult_size_state
var _reagents_state: StatState = StatState.MID:
	get = get_reagents_state,
	set = set_reagents_state

#endregion

#region Node Variables
# Progress bars as variables
@onready var influence_bar: ProgressBar = $UI/InfluenceBar
@onready var chaos_bar: ProgressBar = $UI/VBoxContainer/SecondaryResources/ChaosBar
@onready var money_bar: ProgressBar = $UI/VBoxContainer/SecondaryResources/MoneyBar
@onready var cult_bar: ProgressBar = $UI/VBoxContainer/SecondaryResources/CultSizeBar
@onready var reagent_bar: ProgressBar = $UI/VBoxContainer/SecondaryResources/ReagentsBar
@onready var resource_menu: MenuButton = $UI/ResourceDebugging
@onready var save_states: MenuButton = $UI/SaveStates/Saves
@onready var event_position: Control = $EventPosition
#endregion


#region Game Functions
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_set_saves()
	var dir = DirAccess.open("res://source/scenes/game/events")
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			_events.append(file_name)
			file_name = dir.get_next()
	influence_bar.value = get_influence()
	chaos_bar.value = get_chaos()
	money_bar.value = get_money()
	cult_bar.value = get_cult_size()
	reagent_bar.value = get_reagents()
	save_states.get_popup().id_pressed.connect(_handle_load_save)
	resource_menu.get_popup().add_item("Influence Up")
	resource_menu.get_popup().add_item("Influence Down")
	resource_menu.get_popup().add_item("Chaos Up")
	resource_menu.get_popup().add_item("Chaos Down")
	resource_menu.get_popup().add_item("Money Up")
	resource_menu.get_popup().add_item("Money Down")
	resource_menu.get_popup().add_item("Cult Size Up")
	resource_menu.get_popup().add_item("Cult Size Down")
	resource_menu.get_popup().add_item("Reagents Up")
	resource_menu.get_popup().add_item("Reagents Down")
	resource_menu.get_popup().id_pressed.connect(_handle_resources)
	influence_full.connect(_influence_win)
	influence_empty.connect(_influence_loss)
	chaos_full.connect(_chaos_full)
	chaos_empty.connect(_chaos_empty)
	chaos_low.connect(_chaos_low)
	chaos_high.connect(_chaos_high)
	chaos_mid.connect(_chaos_mid)
	money_full.connect(_money_full)
	money_empty.connect(_money_empty)
	money_low.connect(_money_low)
	money_high.connect(_money_high)
	money_mid.connect(_money_mid)
	cult_size_full.connect(_cult_size_full)
	cult_size_empty.connect(_cult_size_empty)
	cult_size_low.connect(_cult_size_low)
	cult_size_high.connect(_cult_size_high)
	cult_size_mid.connect(_cult_size_mid)
	reagents_full.connect(_reagents_full)
	reagents_empty.connect(_reagents_empty)
	reagents_low.connect(_reagents_low)
	reagents_high.connect(_reagents_high)
	reagents_mid.connect(_reagents_mid)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _set_saves() -> void:
	# Reset saves array to avoid duplicates
	_saves = []
	save_states.get_popup().clear()
	var dir = DirAccess.open("res://saves")
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			_saves.append(file_name)
			file_name = dir.get_next()
	for save in _saves:
		save_states.get_popup().add_item(save)


#endregion


#region Get/Set Functions
func get_influence() -> int:
	return _influence


func set_influence(value: int) -> void:
	var modifier: float = 1
	var difference: float = value - _influence
	if difference < 0:
		match _cult_size_state:
			StatState.EMPTY:
				modifier += 0.25
			StatState.LOW:
				modifier += 0.1
			StatState.HIGH || StatState.FULL:
				modifier -= 0.5
		match _money_state:
			StatState.EMPTY:
				modifier += 0
			StatState.LOW:
				modifier += 0.25
			StatState.HIGH || StatState.FULL:
				modifier -= 0.25
		match _chaos_state:
			StatState.EMPTY:
				modifier += 0.25
			StatState.LOW:
				modifier += 0.15
			StatState.HIGH || StatState.FULL:
				modifier -= 0.5
		match _reagents_state:
			StatState.EMPTY:
				modifier += 0.10
			StatState.LOW:
				modifier += 0.05
			StatState.HIGH || StatState.FULL:
				modifier -= 0.15
	difference *= modifier
	_influence = clamp(_influence + difference, 0, MAX_INFLUENCE)
	if influence_bar:
		influence_bar.value = _influence
	if _influence == MAX_INFLUENCE:
		influence_full.emit()
	elif _influence == 0:
		influence_empty.emit()


func get_chaos() -> int:
	return _chaos


func set_chaos(value: int) -> void:
	var modifier: float = 1
	var difference: float = value - _chaos
	if difference > 0:
		match _money_state:
			StatState.EMPTY:
				modifier -= 0.05
			StatState.HIGH || StatState.FULL:
				modifier += 0.05
		match _reagents_state:
			StatState.EMPTY:
				modifier += 0.05
	difference *= modifier
	_chaos = clamp(_chaos + difference, 0, MAX_CHAOS)
	if chaos_bar:
		chaos_bar.value = _chaos
	if _chaos == MAX_CHAOS && _chaos_state != StatState.FULL:
		_chaos_state = StatState.FULL
		chaos_full.emit()
	elif _chaos >= (MAX_CHAOS * 0.8) && _chaos_state != StatState.HIGH:
		_chaos_state = StatState.HIGH
		chaos_high.emit()
	elif _chaos == 0 && _chaos_state != StatState.EMPTY:
		_chaos_state = StatState.EMPTY
		chaos_empty.emit()
	elif _chaos <= (MAX_CHAOS * 0.2) && _chaos_state != StatState.LOW:
		_chaos_state = StatState.LOW
		chaos_low.emit()
	elif _chaos_state != StatState.MID:
		_chaos_state = StatState.MID
		chaos_mid.emit()


func get_money() -> int:
	return _money


func set_money(value: int) -> void:
	var modifier: float = 1
	var difference: float = value - _money
	if difference > 0:
		match _reagents_state:
			StatState.HIGH || StatState.FULL:
				modifier -= 0.05
	elif difference < 0:
		match _cult_size_state:
			StatState.EMPTY:
				modifier = 0
			StatState.LOW:
				modifier += 0.02
			StatState.MID:
				modifier += 0.05
			StatState.HIGH || StatState.FULL:
				modifier += 0.1
	difference *= modifier
	_money = clamp(_money + difference, 0, MAX_MONEY)
	if money_bar:
		money_bar.value = _money
	if _money == MAX_MONEY && _money_state != StatState.FULL:
		_money_state = StatState.FULL
		money_full.emit()
	elif _money >= (MAX_MONEY * 0.8) && _money_state != StatState.HIGH:
		_money_state = StatState.HIGH
		money_high.emit()
	elif _money == 0 && _money_state != StatState.EMPTY:
		_money_state = StatState.EMPTY
		money_empty.emit()
	elif _money <= (MAX_MONEY * 0.2) && _money_state != StatState.LOW:
		_money_state = StatState.LOW
		money_low.emit()
	elif _money_state != StatState.MID:
		_money_state = StatState.MID
		money_mid.emit()


func get_cult_size() -> int:
	return _cult_size


func set_cult_size(value: int) -> void:
	var modifier: float = 1
	var difference: float = value - _cult_size
	if difference > 0:
		match _money_state:
			StatState.EMPTY:
				modifier -= 0.05
		match _chaos_state:
			StatState.EMPTY:
				modifier -= 0.05
			StatState.HIGH || StatState.FULL:
				modifier += 0.05
	difference *= modifier
	_cult_size = clamp(_cult_size + difference, 0, MAX_CULT_SIZE)
	if cult_bar:
		cult_bar.value = _cult_size
	if _cult_size == MAX_CULT_SIZE && _cult_size_state != StatState.FULL:
		_cult_size_state = StatState.FULL
		cult_size_full.emit()
	elif _cult_size >= (MAX_CULT_SIZE * 0.8) && _cult_size_state != StatState.HIGH:
		_cult_size_state = StatState.HIGH
		cult_size_high.emit()
	elif _cult_size == 0 && _cult_size_state != StatState.EMPTY:
		_cult_size_state = StatState.EMPTY
		cult_size_empty.emit()
	elif _cult_size <= (MAX_CULT_SIZE * 0.2) && _cult_size_state != StatState.LOW:
		_cult_size_state = StatState.LOW
		cult_size_low.emit()
	elif _cult_size_state != StatState.MID:
		_cult_size_state = StatState.MID
		cult_size_mid.emit()


func get_reagents() -> int:
	return _reagents


func set_reagents(value: int) -> void:
	_reagents = clamp(value, 0, MAX_REAGENTS)
	if reagent_bar:
		reagent_bar.value = _reagents
	if _reagents == MAX_REAGENTS && _reagents_state != StatState.FULL:
		_reagents_state = StatState.FULL
		reagents_full.emit()
	elif _reagents >= (MAX_REAGENTS * 0.8) && _reagents_state != StatState.HIGH:
		_reagents_state = StatState.HIGH
		reagents_high.emit()
	elif _reagents == 0 && _reagents_state != StatState.EMPTY:
		_reagents_state = StatState.EMPTY
		reagents_empty.emit()
	elif _reagents <= (MAX_REAGENTS * 0.2) && _reagents_state != StatState.LOW:
		_reagents_state = StatState.LOW
		reagents_low.emit()
	elif _reagents_state != StatState.MID:
		_reagents_state = StatState.MID
		reagents_mid.emit()


func get_chaos_state() -> StatState:
	return _chaos_state


func set_chaos_state(value: StatState) -> void:
	_chaos_state = value


func get_money_state() -> StatState:
	return _money_state


func set_money_state(value: StatState) -> void:
	_money_state = value


func get_cult_size_state() -> StatState:
	return _cult_size_state


func set_cult_size_state(value: StatState) -> void:
	_cult_size_state = value


func get_reagents_state() -> StatState:
	return _reagents_state


func set_reagents_state(value: StatState) -> void:
	_reagents_state = value


#endregion


#region Signal Functions
func _influence_win() -> void:
	print("Influence Max")


func _influence_loss() -> void:
	print("Influence Empty")


func _chaos_full() -> void:
	print("Chaos Full")


func _chaos_empty() -> void:
	print("Chaos Empty")


func _chaos_low() -> void:
	print("Chaos Low")


func _chaos_high() -> void:
	print("Chaos High")


func _chaos_mid() -> void:
	print("Chaos Mid")


func _money_full() -> void:
	print("Money Full")


func _money_empty() -> void:
	print("Money Empty")


func _money_low() -> void:
	print("Money Low")


func _money_high() -> void:
	print("Money High")


func _money_mid() -> void:
	print("Money Mid")


func _cult_size_full() -> void:
	print("Cult Size Full")


func _cult_size_empty() -> void:
	print("Cult Size Empty")


func _cult_size_low() -> void:
	print("Cult Size Low")


func _cult_size_high() -> void:
	print("Cult Size High")


func _cult_size_mid() -> void:
	print("Cult Size Mid")


func _reagents_full() -> void:
	print("Reagents Full")


func _reagents_empty() -> void:
	print("Reagents Empty")


func _reagents_low() -> void:
	print("Reagents Low")


func _reagents_high() -> void:
	print("Reagents High")


func _reagents_mid() -> void:
	print("Reagents Mid")


func _handle_resources(id: int) -> void:
	match id:
		0:
			set_influence(get_influence() + 10)
		1:
			set_influence(get_influence() - 10)
		2:
			set_chaos(get_chaos() + 10)
		3:
			set_chaos(get_chaos() - 10)
		4:
			set_money(get_money() + 10)
		5:
			set_money(get_money() - 10)
		6:
			set_cult_size(get_cult_size() + 10)
		7:
			set_cult_size(get_cult_size() - 10)
		8:
			set_reagents(get_reagents() + 10)
		9:
			set_reagents(get_reagents() - 10)


# Loads state data from a saved dictionary into the resource variables
func _handle_load_save(id: int) -> void:
	var save = save_states.get_popup().get_item_text(id)
	var save_path = "res://saves/" + save
	if FileAccess.file_exists(save_path):
		var save_file = FileAccess.open(save_path, FileAccess.READ)
		var save_data = save_file.get_var()
		_influence = save_data.influence
		_chaos = save_data.chaos
		_money = save_data.money
		_cult_size = save_data.cult_size
		_reagents = save_data.reagents
		save_file.close()


# Saves current state of resource values into a dictionary for loading
func _on_save_pressed() -> void:
	var save_data: Dictionary = {
		"influence": get_influence(),
		"chaos": get_chaos(),
		"money": get_money(),
		"cult_size": get_cult_size(),
		"reagents": get_reagents()
	}
	var save_name = "res://saves/state-" + str(len(_saves)) + ".SAVE"
	var save_file = FileAccess.open(save_name, FileAccess.WRITE)
	save_file.store_var(save_data)
	save_file.close()
	_set_saves()

#endregion


func _on_influence_timer_timeout() -> void:
	pass # Replace with function body.
