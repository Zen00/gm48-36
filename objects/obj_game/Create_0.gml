/// @description 

enum CURRENCY_TYPES {
	zenny,
	joules,
	hatch_progress
}
enum GENERATORS {
	egg,
	comfort,
	music,
	warmth,
	type_number
}
#macro SEC game_get_speed(gamespeed_fps)

//Stats
global.CURRENCIES = ds_list_create();
global.CURRENCIES[| CURRENCY_TYPES.joules] = 0;

//Discounts
global.GENERATOR_DISCOUNTS = ds_list_create();
for(var i = 0; i < GENERATORS.type_number; i++) {
	global.GENERATOR_DISCOUNTS[| i] = ds_list_create();
	ds_list_mark_as_list(global.GENERATOR_DISCOUNTS, i);
}

//Multipliers
global.GENERATOR_MULTIPLIERS = ds_list_create();
for(var i = 0; i < GENERATORS.type_number; i++) {
	global.GENERATOR_MULTIPLIERS[| i] = ds_list_create();
	ds_list_mark_as_list(global.GENERATOR_MULTIPLIERS, i);
}

purchase_amount_ = 1;
game_time_passed_ = 0;
tick_rate_ = SEC;
