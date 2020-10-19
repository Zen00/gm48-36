/// @description 

//Cost
total_owned_ = 1;

//Production
base_production_rate_ = 1;
production_ = base_production_rate_;

//Info
name_ = "Generator";
type_ = GENERATORS.type_number;
icon_ = sprite_index;
width_ = sprite_width;
height_ = sprite_height;
pressed_ = false;
hover_ = false;
affordable_ = false;
activation_cost_ = 1;
activation_currency_ = CURRENCY_TYPES.joules;
currency_type_ = CURRENCY_TYPES.hatch_progress;
audio_ = noone;
image_speed = 0;

function update_production() {
	production_ = base_production_rate_ * total_owned_;
	for(var i = 0; i < ds_list_size(global.GENERATOR_MULTIPLIERS[| type_]); i++) {
		production_ *= global.GENERATOR_MULTIPLIERS[| type_][| i];
	}
}

function generate_currency() {
	production_ = base_production_rate_ * total_owned_;
	for(var i = 0; i < ds_list_size(global.GENERATOR_MULTIPLIERS[| type_]); i++) {
		production_ *= global.GENERATOR_MULTIPLIERS[| type_][| i];
	}
	global.CURRENCIES[| activation_currency_] -= activation_cost_;
	global.CURRENCIES[| currency_type_] += production_;
}
