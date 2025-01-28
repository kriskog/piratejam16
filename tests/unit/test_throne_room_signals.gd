extends GutTest

var ThroneRoom = load("res://source/scenes/throne_room/throne_room.tscn").instantiate();

var my_script = load("res://source/scenes/throne_room/throne_room.gd");

func test_influence_full():
	var doubled = double(my_script).new()
	doubled.influence_full.connect(doubled._influence_win)
	doubled.influence_full.emit()
	assert_called(doubled, "_influence_win")
	watch_signals(ThroneRoom)
	ThroneRoom.set_influence(ThroneRoom.MAX_INFLUENCE)
	assert_signal_emitted(ThroneRoom, "influence_full")

func test_influence_empty():
	var doubled = double(my_script).new()
	doubled.influence_empty.connect(doubled._influence_loss)
	doubled.influence_empty.emit()
	assert_called(doubled, "_influence_loss")
	watch_signals(ThroneRoom)
	ThroneRoom.set_influence(0)
	assert_signal_emitted(ThroneRoom, "influence_empty")

func test_chaos_full():
	var doubled = double(my_script).new()
	doubled.chaos_full.connect(doubled._chaos_full)
	doubled.chaos_full.emit()
	assert_called(doubled, "_chaos_full")
	watch_signals(ThroneRoom)
	ThroneRoom.set_chaos(100)
	assert_signal_emitted(ThroneRoom, "chaos_full")

func test_chaos_empty():
	var doubled = double(my_script).new()
	doubled.chaos_empty.connect(doubled._chaos_empty)
	doubled.chaos_empty.emit()
	assert_called(doubled, "_chaos_empty")
	watch_signals(ThroneRoom)
	ThroneRoom.set_chaos(0)
	assert_signal_emitted(ThroneRoom, "chaos_empty")

func test_chaos_low():
	var doubled = double(my_script).new()
	doubled.chaos_low.connect(doubled._chaos_low)
	doubled.chaos_low.emit()
	assert_called(doubled, "_chaos_low")
	watch_signals(ThroneRoom)
	ThroneRoom.set_chaos(60)
	ThroneRoom.set_chaos(20)
	assert_signal_emitted(ThroneRoom, "chaos_low")

func test_chaos_high():
	var doubled = double(my_script).new()
	doubled.chaos_high.connect(doubled._chaos_high)
	doubled.chaos_high.emit()
	assert_called(doubled, "_chaos_high")
	watch_signals(ThroneRoom)
	ThroneRoom.set_chaos(40)
	ThroneRoom.set_chaos(80)
	assert_signal_emitted(ThroneRoom, "chaos_high")

func test_chaos_mid():
	var doubled = double(my_script).new()
	doubled.chaos_mid.connect(doubled._chaos_mid)
	doubled.chaos_mid.emit()
	assert_called(doubled, "_chaos_mid")
	watch_signals(ThroneRoom)
	ThroneRoom.set_chaos(80)
	ThroneRoom.set_chaos(50)
	assert_signal_emitted(ThroneRoom, "chaos_mid")

func test_money_full():
	var doubled = double(my_script).new()
	doubled.money_full.connect(doubled._money_full)
	doubled.money_full.emit()
	assert_called(doubled, "_money_full")
	watch_signals(ThroneRoom)
	ThroneRoom.set_money(100)
	assert_signal_emitted(ThroneRoom, "money_full")

func test_money_empty():
	var doubled = double(my_script).new()
	doubled.money_empty.connect(doubled._money_empty)
	doubled.money_empty.emit()
	assert_called(doubled, "_money_empty")
	watch_signals(ThroneRoom)
	ThroneRoom.set_money(0)
	assert_signal_emitted(ThroneRoom, "money_empty")

func test_money_low():
	var doubled = double(my_script).new()
	doubled.money_low.connect(doubled._money_low)
	doubled.money_low.emit()
	assert_called(doubled, "_money_low")
	watch_signals(ThroneRoom)
	ThroneRoom.set_money(60)
	ThroneRoom.set_money(20)
	assert_signal_emitted(ThroneRoom, "money_low")

func test_money_high():
	var doubled = double(my_script).new()
	doubled.money_high.connect(doubled._money_high)
	doubled.money_high.emit()
	assert_called(doubled, "_money_high")
	watch_signals(ThroneRoom)
	ThroneRoom.set_money(40)
	ThroneRoom.set_money(80)
	assert_signal_emitted(ThroneRoom, "money_high")

func test_money_mid():
	var doubled = double(my_script).new()
	doubled.money_mid.connect(doubled._money_mid)
	doubled.money_mid.emit()
	assert_called(doubled, "_money_mid")
	watch_signals(ThroneRoom)
	ThroneRoom.set_money(80)
	ThroneRoom.set_money(50)
	assert_signal_emitted(ThroneRoom, "money_mid")

func test_cult_size_full():
	var doubled = double(my_script).new()
	doubled.cult_size_full.connect(doubled._cult_size_full)
	doubled.cult_size_full.emit()
	assert_called(doubled, "_cult_size_full")
	watch_signals(ThroneRoom)
	ThroneRoom.set_cult_size(100)
	assert_signal_emitted(ThroneRoom, "cult_size_full")

func test_cult_size_empty():
	var doubled = double(my_script).new()
	doubled.cult_size_empty.connect(doubled._cult_size_empty)
	doubled.cult_size_empty.emit()
	assert_called(doubled, "_cult_size_empty")
	watch_signals(ThroneRoom)
	ThroneRoom.set_cult_size(0)
	assert_signal_emitted(ThroneRoom, "cult_size_empty")

func test_cult_size_low():
	var doubled = double(my_script).new()
	doubled.cult_size_low.connect(doubled._cult_size_low)
	doubled.cult_size_low.emit()
	assert_called(doubled, "_cult_size_low")
	watch_signals(ThroneRoom)
	ThroneRoom.set_cult_size(60)
	ThroneRoom.set_cult_size(20)
	assert_signal_emitted(ThroneRoom, "cult_size_low")

func test_cult_size_high():
	var doubled = double(my_script).new()
	doubled.cult_size_high.connect(doubled._cult_size_high)
	doubled.cult_size_high.emit()
	assert_called(doubled, "_cult_size_high")
	watch_signals(ThroneRoom)
	ThroneRoom.set_cult_size(40)
	ThroneRoom.set_cult_size(80)
	assert_signal_emitted(ThroneRoom, "cult_size_high")

func test_cult_size_mid():
	var doubled = double(my_script).new()
	doubled.cult_size_mid.connect(doubled._cult_size_mid)
	doubled.cult_size_mid.emit()
	assert_called(doubled, "_cult_size_mid")
	watch_signals(ThroneRoom)
	ThroneRoom.set_cult_size(80)
	ThroneRoom.set_cult_size(50)
	assert_signal_emitted(ThroneRoom, "cult_size_mid")

func test_reagents_full():
	var doubled = double(my_script).new()
	doubled.reagents_full.connect(doubled._reagents_full)
	doubled.reagents_full.emit()
	assert_called(doubled, "_reagents_full")
	watch_signals(ThroneRoom)
	ThroneRoom.set_reagents(100)
	assert_signal_emitted(ThroneRoom, "reagents_full")

func test_reagents_empty():
	var doubled = double(my_script).new()
	doubled.reagents_empty.connect(doubled._reagents_empty)
	doubled.reagents_empty.emit()
	assert_called(doubled, "_reagents_empty")
	watch_signals(ThroneRoom)
	ThroneRoom.set_reagents(0)
	assert_signal_emitted(ThroneRoom, "reagents_empty")

func test_reagents_low():
	var doubled = double(my_script).new()
	doubled.reagents_low.connect(doubled._reagents_low)
	doubled.reagents_low.emit()
	assert_called(doubled, "_reagents_low")
	watch_signals(ThroneRoom)
	ThroneRoom.set_reagents(60)
	ThroneRoom.set_reagents(20)
	assert_signal_emitted(ThroneRoom, "reagents_low")

func test_reagents_high():
	var doubled = double(my_script).new()
	doubled.reagents_high.connect(doubled._reagents_high)
	doubled.reagents_high.emit()
	assert_called(doubled, "_reagents_high")
	watch_signals(ThroneRoom)
	ThroneRoom.set_reagents(40)
	ThroneRoom.set_reagents(80)
	assert_signal_emitted(ThroneRoom, "reagents_high")

func test_reagents_mid():
	var doubled = double(my_script).new()
	doubled.reagents_mid.connect(doubled._reagents_mid)
	doubled.reagents_mid.emit()
	assert_called(doubled, "_reagents_mid")
	watch_signals(ThroneRoom)
	ThroneRoom.set_reagents(80)
	ThroneRoom.set_reagents(50)
	assert_signal_emitted(ThroneRoom, "reagents_mid")