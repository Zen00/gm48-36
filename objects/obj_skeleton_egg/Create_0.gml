/// @description 

//States and animation
enum EGG_STATES {
	idle,
	knock,
	hatch
}

function generate_color_one() {
    var _hue_min = 255 * 0;
    var _hue_max = 255 * 1;
    var _sat_min = 255 * 0.15;
    var _sat_max = 255 * 0.5;
    var _val_min = 255 * 0.55;
    var _val_max = 255 * 0.8;
    
    var _col = make_color_hsv(irandom_range(_hue_min,_hue_max), irandom_range(_sat_min, _sat_max), irandom_range(_val_min, _val_max));
    return _col;
}

function generate_color_two(_col1) {
    var _sat_min = 255 * 0.15;
    var _sat_max = 255 * 0.5;
    var _val_min = 255 * 0.55;
    var _val_max = 255 * 0.8;
    
    var _dead_zone = 255 * 0.3;
    
    var _hue = color_get_hue(_col1);
    var _hue_shift = _hue + irandom(255 - _dead_zone) + (_dead_zone / 2);
    if(_hue_shift > 255) { _hue_shift -= 255; }
    
    var _col = make_color_hsv(_hue_shift, irandom_range(_sat_min, _sat_max), irandom_range(_val_min, _val_max));
    return _col;
}

state_ = EGG_STATES.idle;
current_animation_ = "idle";
animation_timer_ = irandom(SEC * 5);
primary_color_ = generate_color_one();
secondary_color_ = generate_color_two(primary_color_);
pattern_ = string(irandom(3) + 1);
skeleton_slot_color_set("egg base", primary_color_, 1);
skeleton_slot_color_set("egg pattern", secondary_color_, 1);
skeleton_slot_color_set("fragment base", primary_color_, 1);
skeleton_slot_color_set("fragment pattern", secondary_color_, 1);
skeleton_attachment_set("egg pattern","pattern 0" + pattern_);
skeleton_attachment_set("fragment pattern","pattern 0" + pattern_);
skeleton_animation_set(current_animation_);
hatch_animation_length_ = skeleton_animation_get_duration("hatch");



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
on_ground_ = false;
y_speed_ = 0;

//function update_production() {
//	production_ = base_production_rate_;
//	for(var i = 0; i < ds_list_size(global.GENERATOR_MULTIPLIERS[| type_]); i++) {
//		production_ *= global.GENERATOR_MULTIPLIERS[| type_][| i];
//	}
//}

//function generate_currency() {
//	global.CURRENCIES[| currency_type_] += production_;
//}

