/// @description 

//Cost
base_cost_ = 1;
growth_rate_ = 1.05;
total_owned_ = 0;

//Production
base_production_rate_ = 1;
production_ = base_production_rate_;

//Info
name_ = "Generator";
type_ = GENERATORS.type_number;
icon_ = spr_icon;
width_ = 256;
height_ = 92;
pressed_ = false;
affordable_ = false;
currency_type_ = CURRENCY_TYPES.joules;

function update_purchase_price() {
	purchase_price_ = base_cost_ * (power(growth_rate_, total_owned_) * (power(growth_rate_, obj_game.purchase_amount_) - 1)) / (growth_rate_ - 1); //This will cause a div/0 if your growth rate is 1, amongst other problems
	for(var i = 0; i < ds_list_size(global.GENERATOR_DISCOUNTS[| type_]); i++) {
		purchase_price_ *= global.GENERATOR_DISCOUNTS[| type_][| i];
	}
}

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
	
	global.CURRENCIES[| currency_type_] += production_;
}
