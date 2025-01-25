extends Node2D

#region Signals
signal influence_full
signal influence_empty
signal chaos_full
signal chaos_empty
signal chaos_low
signal chaos_high
signal money_full
signal money_empty
signal money_low
signal money_high
signal cult_size_full
signal cult_size_empty
signal cult_size_low
signal cult_size_high
signal reagents_full
signal reagents_empty
signal reagents_low
signal reagents_high
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
# Main game resource
var _influence: int = 0:
	get = get_influence,
	set = set_influence

# Secondary resources
var _chaos: int = 0:
	get = get_chaos,
	set = set_chaos
var _money: int = 0:
	get = get_money,
	set = set_money
var _cult_size: int = 0:
	get = get_cult_size,
	set = set_cult_size
var _reagents: int = 0:
	get = get_reagents,
	set = set_reagents
#endregion

#region Node Variables
# Progress bars as variables
@onready var influence_bar: ProgressBar = $UI/InfluenceBar
@onready var chaos_bar: ProgressBar = $UI/SecondaryResources/ChaosBar
@onready var money_bar: ProgressBar = $UI/SecondaryResources/MoneyBar
@onready var cult_bar: ProgressBar = $UI/SecondaryResources/CultSizeBar
@onready var reagent_bar: ProgressBar = $UI/SecondaryResources/ReagentsBar
@onready var resource_menu: MenuButton = $UI/ResourceDebugging
#endregion


#region Game Functions
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
	money_full.connect(_money_full)
	money_empty.connect(_money_empty)
	money_low.connect(_money_low)
	money_high.connect(_money_high)
	cult_size_full.connect(_cult_size_full)
	cult_size_empty.connect(_cult_size_empty)
	cult_size_low.connect(_cult_size_low)
	cult_size_high.connect(_cult_size_high)
	reagents_full.connect(_reagents_full)
	reagents_empty.connect(_reagents_empty)
	reagents_low.connect(_reagents_low)
	reagents_high.connect(_reagents_high)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _handle_resources(id: int) -> void:
	match id:
		0: set_influence(get_influence() + 10)
		1: set_influence(get_influence() - 10)
		2: set_chaos(get_chaos() + 10)
		3: set_chaos(get_chaos() - 10)
		4: set_money(get_money() + 10)
		5: set_money(get_money() - 10)
		6: set_cult_size(get_cult_size() + 10)
		7: set_cult_size(get_cult_size() - 10)
		8: set_reagents(get_reagents() + 10)
		9: set_reagents(get_reagents() - 10)
#endregion


#region Get/Set Functions
func get_influence() -> int:
	return _influence


func set_influence(value: int) -> void:
	_influence = clamp(value, 0, MAX_INFLUENCE)
	influence_bar.value = _influence
	if _influence == MAX_INFLUENCE:
		influence_full.emit()
	elif _influence == 0:
		influence_empty.emit()


func get_chaos() -> int:
	return _chaos


func set_chaos(value: int) -> void:
	_chaos = clamp(value, 0, MAX_CHAOS)
	chaos_bar.value = _chaos
	if _chaos == MAX_CHAOS:
		chaos_full.emit()
	elif _chaos >= (MAX_CHAOS * 0.7):
		chaos_high.emit()
	elif _chaos == 0:
		chaos_empty.emit()
	elif _chaos <= (MAX_CHAOS * 0.3):
		chaos_low.emit()


func get_money() -> int:
	return _money


func set_money(value: int) -> void:
	_money = clamp(value, 0, MAX_MONEY)
	money_bar.value = _money
	if _money == MAX_MONEY:
		money_full.emit()
	elif _money >= (MAX_MONEY * 0.7):
		money_high.emit()
	elif _money == 0:
		money_empty.emit()
	elif _money <= (MAX_MONEY * 0.3):
		money_low.emit()


func get_cult_size() -> int:
	return _cult_size


func set_cult_size(value: int) -> void:
	_cult_size = clamp(value, 0, MAX_CULT_SIZE)
	cult_bar.value = _cult_size
	if _cult_size == MAX_CULT_SIZE:
		cult_size_full.emit()
	elif _cult_size >= (MAX_CULT_SIZE * 0.7):
		cult_size_high.emit()
	elif _cult_size == 0:
		cult_size_empty.emit()
	elif _cult_size <= (MAX_CULT_SIZE * 0.3):
		cult_size_low.emit()


func get_reagents() -> int:
	return _reagents


func set_reagents(value: int) -> void:
	_reagents = clamp(value, 0, MAX_REAGENTS)
	reagent_bar.value = _reagents
	if _reagents == MAX_REAGENTS:
		reagents_full.emit()
	elif _reagents >= (MAX_REAGENTS * 0.7):
		reagents_high.emit()
	elif _reagents == 0:
		reagents_empty.emit()
	elif _reagents <= (MAX_REAGENTS * 0.3):
		reagents_low.emit()


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


func _money_full() -> void:
	print("Money Full")


func _money_empty() -> void:
	print("Money Empty")


func _money_low() -> void:
	print("Money Low")


func _money_high() -> void:
	print("Money High")


func _cult_size_full() -> void:
	print("Cult Size Full")


func _cult_size_empty() -> void:
	print("Cult Size Empty")


func _cult_size_low() -> void:
	print("Cult Size Low")


func _cult_size_high() -> void:
	print("Cult Size High")


func _reagents_full() -> void:
	print("Reagents Full")


func _reagents_empty() -> void:
	print("Reagents Empty")


func _reagents_low() -> void:
	print("Reagents Low")


func _reagents_high() -> void:
	print("Reagents High")
#endregion
