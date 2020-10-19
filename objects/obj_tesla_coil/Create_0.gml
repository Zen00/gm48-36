/// @description 

// Inherit the parent event
event_inherited();

//Cost
base_cost_ = 42240;
growth_rate_ = 1.21;
total_owned_ = 0;

//Production
base_production_rate_ = 2497;
production_ = base_production_rate_;
base_secondary_rate_ = 0.48;
secondary_production_ = base_secondary_rate_;

//Info
name_ = "Tesla Coil";
type_ = GENERATORS.tesla_coil;
icon_ = sprite_index;
width_ = sprite_width;
height_ = sprite_height;
currency_type_ = CURRENCY_TYPES.zenny;
secondary_currency_type_ = CURRENCY_TYPES.joules;

update_purchase_price();
update_production();
