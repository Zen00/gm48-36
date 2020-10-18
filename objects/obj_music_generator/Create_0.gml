/// @description 

// Inherit the parent event
event_inherited();

//Cost
base_cost_ = 50;
growth_rate_ = 1.12;
total_owned_ = 0;

//Production
base_production_rate_ = 7;

//Info
name_ = "Music";
type_ = GENERATORS.music;
icon_ = sprite_index;
width_ = sprite_width;
height_ = sprite_height;
currency_type_ = CURRENCY_TYPES.joules;

update_purchase_price();
