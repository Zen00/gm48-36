/// @description 

// Inherit the parent event
event_inherited();

//Cost
base_cost_ = 3280;
growth_rate_ = 1.23;
total_owned_ = 0;

//Production
base_production_rate_ = 360;
production_ = base_production_rate_;
base_secondary_rate_ = 0.14;
secondary_production_ = base_secondary_rate_;

//Info
name_ = "Van De Graph";
type_ = GENERATORS.van_de_graph_generator;
icon_ = sprite_index;
width_ = sprite_width;
height_ = sprite_height;
currency_type_ = CURRENCY_TYPES.zenny;
secondary_currency_type_ = CURRENCY_TYPES.joules;

update_purchase_price();
update_production();
