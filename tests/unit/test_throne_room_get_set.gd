extends GutTest

var ThroneRoom = load("res://source/scenes/throne_room/throne_room.tscn").instantiate();

func test_set_get_influence_value():
	ThroneRoom.set_influence(11);
	assert_eq(ThroneRoom.get_influence(), 11, "Influence is being set to 11");

func test_influence_max():
	ThroneRoom.set_influence(150);
	assert_eq(ThroneRoom.get_influence(), 100, "Influence clamps to 100");

func test_influence_min():
	ThroneRoom.set_influence(-150);
	assert_eq(ThroneRoom.get_influence(), 0, "Influence clamps to 0");

func test_set_get_chaos_value():
	ThroneRoom.set_chaos(11);
	assert_eq(ThroneRoom.get_chaos(), 11, "Chaos is being set to 11");

func test_chaos_max():
	ThroneRoom.set_chaos(150);
	assert_eq(ThroneRoom.get_chaos(), 100, "Chaos clamps to 100");

func test_chaos_min():
	ThroneRoom.set_chaos(-150);
	assert_eq(ThroneRoom.get_chaos(), 0, "Chaos clamps to 0");

func test_set_get_money_value():
	ThroneRoom.set_money(11);
	assert_eq(ThroneRoom.get_money(), 11, "Money is being set to 11");

func test_money_max():
	ThroneRoom.set_money(150);
	assert_eq(ThroneRoom.get_money(), 100, "Money clamps to 100");

func test_money_min():
	ThroneRoom.set_money(-150);
	assert_eq(ThroneRoom.get_money(), 0, "Money clamps to 0");

func test_set_get_cult_size_value():
	ThroneRoom.set_cult_size(11);
	assert_eq(ThroneRoom.get_cult_size(), 11, "Cult Size is being set to 11");

func test_cult_size_max():
	ThroneRoom.set_cult_size(150);
	assert_eq(ThroneRoom.get_cult_size(), 100, "Cult Size clamps to 100");

func test_cult_size_min():
	ThroneRoom.set_cult_size(-150);
	assert_eq(ThroneRoom.get_cult_size(), 0, "Cult Size clamps to 0");

func test_set_get_reagents_value():
	ThroneRoom.set_reagents(11);
	assert_eq(ThroneRoom.get_reagents(), 11, "Reagents is being set to 11");

func test_reagents_max():
	ThroneRoom.set_reagents(150);
	assert_eq(ThroneRoom.get_reagents(), 100, "Reagents clamps to 100");

func test_reagents_min():
	ThroneRoom.set_reagents(-150);
	assert_eq(ThroneRoom.get_reagents(), 0, "Reagents clamps to 0");
