/// @description 

// Inherit the parent event
event_inherited();

//Cost
base_cost_ = 1;
growth_rate_ = 1.05;
total_owned_ = 1;

//Production
base_production_rate_ = 1;

//Info
name_ = "Comfort";
type_ = GENERATORS.comfort;
icon_ = sprite_index;
width_ = sprite_width;
height_ = sprite_height;
currency_type_ = CURRENCY_TYPES.joules;

update_purchase_price();
