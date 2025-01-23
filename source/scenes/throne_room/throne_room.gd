extends Node2D

#region Variables
# Event signals
signal influence_max
signal influence_empty
# signal chaos_full;
# signal chaos_empty;
# signal chaos_low;
# signal chaos_high;
# signal money_full;
# signal money_empty;
# signal money_low;
# signal money_high;
# signal cult_size_full;
# signal cult_size_empty;
# signal cult_size_low;
# signal cult_size_high;
# signal reagents_full;
# signal reagents_empty;
# signal reagents_low;
# signal reagents_high;

# Max constants
const MAX_INFLUENCE: int = 100
const MAX_CHAOS: int = 100
const MAX_MONEY: int = 100
const MAX_CULT_SIZE: int = 100
const MAX_REAGENTS: int = 100

# Primary win/lose resource
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

# Progress bars as variables
@onready var influence_bar: ProgressBar = $UI/InfluenceBar
@onready var chaos_bar: ProgressBar = $UI/SecondaryResources/ChaosBar
@onready var money_bar: ProgressBar = $UI/SecondaryResources/MoneyBar
@onready var cult_bar: ProgressBar = $UI/SecondaryResources/CultSizeBar
@onready var reagent_bar: ProgressBar = $UI/SecondaryResources/ReagentsBar
#endregion

#region Functions


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	influence_max.connect(influence_win)
	influence_empty.connect(influence_loss)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# These might be better handled in a signal that emits after an even runs
	influence_bar.value = _influence
	chaos_bar.value = _chaos
	money_bar.value = _money
	cult_bar.value = _cult_size
	reagent_bar.value = _reagents


# Get Set functions
func get_influence() -> int:
	return _influence


func set_influence(value: int) -> void:
	_influence = clamp(value, 0, MAX_INFLUENCE)


func get_chaos() -> int:
	return _chaos


func set_chaos(value: int) -> void:
	_chaos = clamp(value, 0, MAX_CHAOS)


func get_money() -> int:
	return _money


func set_money(value: int) -> void:
	_money = clamp(value, 0, MAX_MONEY)


func get_cult_size() -> int:
	return _cult_size


func set_cult_size(value: int) -> void:
	_cult_size = clamp(value, 0, MAX_CULT_SIZE)


func get_reagents() -> int:
	return _reagents


func set_reagents(value: int) -> void:
	_reagents = clamp(value, 0, MAX_REAGENTS)


# Function to handle the win condition from reaching max influence
func influence_win() -> void:
	pass


# Function to handle the loss condition from reaching no influence
func influence_loss() -> void:
	pass
#endregion
