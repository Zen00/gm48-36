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
name_ = "Straw";
type_ = GENERATORS.straw;
icon_ = spr_icon;
width_ = 256;
height_ = 92;
currency_type_ = CURRENCY_TYPES.joules;

update_purchase_price();
