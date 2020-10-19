/// @description 

randomize();

enum CURRENCY_TYPES {
	zenny,
	joules,
	hatch_progress,
	type_number
}
enum GENERATORS {
	egg,
	comfort,
	music,
	warmth,
	knife_switch,
	van_de_graph_generator,
	jacobs_ladder,
	lightning_rod,
	tesla_coil,
	type_number
}
#macro SEC game_get_speed(gamespeed_fps)

//Stats
global.CURRENCIES = ds_list_create();
for(var i = 0; i < CURRENCY_TYPES.type_number; i++) {
	global.CURRENCIES[| i] = 0;
}
//global.CURRENCIES[| CURRENCY_TYPES.joules] = 111110;
//global.CURRENCIES[| CURRENCY_TYPES.zenny] = 2311110;
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

//Music
queue_new_song(mus_main_looping, 1, true, 0, 0, 0);
sound_timer_ = (irandom(48) + 37) * SEC;
