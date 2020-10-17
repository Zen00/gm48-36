/// @description 

enum EGG_STATES {
	idle,
	shaking,
	cracking
}
state_ = EGG_STATES.idle;

animation_timer_ = irandom(SEC * 5);
current_sequence_ = noone;
width_ = 128;
height_ = 128;
pressed_ = false;
currency_type_ = CURRENCY_TYPES.zenny;
base_production_rate_ = 1;

function update_production() {
	
}
