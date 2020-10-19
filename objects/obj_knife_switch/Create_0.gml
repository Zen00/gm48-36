/// @description 

// Inherit the parent event
event_inherited();

//Cost
base_cost_ = 1;
growth_rate_ = 1.14;
total_owned_ = 1;

//Production
base_production_rate_ = 1;
production_ = base_production_rate_;
base_secondary_rate_ = 0.000656;
secondary_production_ = base_secondary_rate_;

//Info
name_ = "Knife Switch";
type_ = GENERATORS.knife_switch;
icon_ = sprite_index;
width_ = sprite_width;
height_ = sprite_height;
currency_type_ = CURRENCY_TYPES.zenny;
secondary_currency_type_ = CURRENCY_TYPES.joules;

update_purchase_price();
update_production();
