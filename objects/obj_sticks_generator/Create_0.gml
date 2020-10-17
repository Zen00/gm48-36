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
name_ = "Sticks";
type_ = GENERATORS.sticks;
icon_ = spr_icon;
width_ = 256;
height_ = 92;
currency_type_ = CURRENCY_TYPES.joules;

update_purchase_price();
