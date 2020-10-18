/// @description 

//States and animation
enum EGG_STATES {
	idle,
	knock,
	cracking
}
state_ = EGG_STATES.idle;
animation_timer_ = irandom(SEC * 5);
primary_color_ = c_white;
secondary_color_ = c_fuchsia;
current_animation_ = "idle";
skeleton_slot_color_set("egg base", primary_color_, 1);
skeleton_slot_color_set("egg pattern", secondary_color_, 1);
skeleton_attachment_set("egg pattern","pattern 0" + string(irandom(3) + 1));
skeleton_animation_set("idle");
//var _interp = 1;
//skeleton_animation_mix("idle", "knock", _interp);
//skeleton_animation_mix("idle", "knock2", _interp);
//skeleton_animation_mix("knock2", "idle", _interp);
//skeleton_animation_mix("knock", "idle", _interp);

//Production
base_production_rate_ = 1;
production_ = base_production_rate_;

//Info
name_ = "Egg";
type_ = GENERATORS.egg;
icon_ = sprite_index;
width_ = sprite_get_width(sprite_index);
height_ = sprite_get_height(sprite_index);
pressed_ = false;
currency_type_ = CURRENCY_TYPES.zenny;
hatching_progress_ = 0;

//function update_production() {
//	production_ = base_production_rate_;
//	for(var i = 0; i < ds_list_size(global.GENERATOR_MULTIPLIERS[| type_]); i++) {
//		production_ *= global.GENERATOR_MULTIPLIERS[| type_][| i];
//	}
//}

//function generate_currency() {
//	global.CURRENCIES[| currency_type_] += production_;
//}
