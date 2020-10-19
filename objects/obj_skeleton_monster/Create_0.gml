/// @description 

//States and animation
enum JUVENILE_STATES {
	idle,
	knock,
	cracking
}



state_ = EGG_STATES.idle;
animation_timer_ = irandom(SEC * 5);
primary_color_ = c_white;
secondary_color_ = c_fuchsia;
current_animation_ = "idle";
skeleton_animation_set("idle");
active_ = false;
sound_timer_ = (irandom(12) + 8) * SEC;


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

function generate_color_three(_col1) {
    
    var range = 50;
    var _hue = color_get_hue(_col1) + (255 / 2) + irandom(range) - (range / 2);
    if (_hue >= 255) _hue -= 255;
    var _sat = min(255,color_get_saturation(_col1) + 50);
    var _val = min(255,color_get_value(_col1) + 50);
    
    var _col = make_color_hsv(_hue,_sat,_val); 
    return _col;
}

col1_ = generate_color_one();
col2_ = generate_color_two(col1_);
col3_ = generate_color_three(col1_);

var slots = ["head",
            "eyes",
            "nose",
            "mouth",
            "front ear",
            "back ear",
            "torso",
            "front legs",
            "back legs",
            "tail"];
            
for (var i = 0; i < 10; ++i) {
    skeleton_slot_color_set(slots[i] + " base", col1_, 1);
    skeleton_slot_color_set(slots[i] + " pattern", col2_, 1);
}

function set_eyes(eyes){
    switch eyes {
        case 1:
            skeleton_attachment_set("eyes base","eyes 01 base");
            skeleton_attachment_set("eyes color","eyes 01 color");
            skeleton_attachment_set("eyes outline","eyes 01 outline");
            skeleton_attachment_set("eyes secondary",-1);
            break;
        case 2:
            skeleton_attachment_set("eyes base",-1);
            skeleton_attachment_set("eyes color","eyes 02 color");
            skeleton_attachment_set("eyes outline","eyes 02 outline");
            skeleton_attachment_set("eyes secondary","eyes 02 secondary");
            break;
        case 3:
            skeleton_attachment_set("eyes base","eyes 03 base");
            skeleton_attachment_set("eyes color",-1);
            skeleton_attachment_set("eyes outline","eyes 03 outline");
            skeleton_attachment_set("eyes secondary",-1);
            break;
        case 4:
            skeleton_attachment_set("eyes base","eyes 04 base");
            skeleton_attachment_set("eyes color","eyes 04 color");
            skeleton_attachment_set("eyes outline","eyes 04 outline");
            skeleton_attachment_set("eyes secondary",-1);
            break;
        case 5:
            skeleton_attachment_set("eyes base",-1);
            skeleton_attachment_set("eyes color","eyes 05 color");
            skeleton_attachment_set("eyes outline","eyes 05 outline");
            skeleton_attachment_set("eyes secondary","eyes 05 secondary");
            break;
        default:
            skeleton_attachment_set("eyes base",-1);
            skeleton_attachment_set("eyes color",-1);
            skeleton_attachment_set("eyes outline",-1);
            skeleton_attachment_set("eyes secondary",-1);
            break;
    }
    
    skeleton_slot_color_set("eyes base", col1_, 1);
    skeleton_slot_color_set("eyes secondary", col2_, 1);
    skeleton_slot_color_set("eyes color", col3_, 1);
}

eyes_ = irandom(4) + 1;
set_eyes(eyes_);

function set_nose(_nose){
    switch _nose {
        case 1:
            skeleton_attachment_set("nose base","nose 01 base");
            skeleton_attachment_set("nose color","nose 01 color");
            skeleton_attachment_set("nose outline","nose 01 outline");
            skeleton_attachment_set("nose secondary",-1);
            break;
        case 2:
            skeleton_attachment_set("nose base",-1);
            skeleton_attachment_set("nose color","nose 02 color");
            skeleton_attachment_set("nose outline","nose 02 outline");
            skeleton_attachment_set("nose secondary","nose 02 secondary");
            break;
        case 3:
            skeleton_attachment_set("nose base","nose 03 base");
            skeleton_attachment_set("nose color",-1);
            skeleton_attachment_set("nose outline","nose 03 outline");
            skeleton_attachment_set("nose secondary",-1);
            break;
        default:
            skeleton_attachment_set("nose base",-1);
            skeleton_attachment_set("nose color",-1);
            skeleton_attachment_set("nose outline",-1);
            skeleton_attachment_set("nose secondary",-1);
            break;
    }
    
    skeleton_slot_color_set("nose base", col1_, 1);
    skeleton_slot_color_set("nose secondary", col2_, 1);
    skeleton_slot_color_set("nose color", col3_, 1);
}

nose_ = irandom(2) + 1;
set_eyes(nose_);

function set_nose(_mouth){
    switch _mouth {
        case 1:
            skeleton_attachment_set("mouth base","mouth 01 base");
            skeleton_attachment_set("mouth color","mouth 01 color");
            skeleton_attachment_set("mouth outline","mouth 01 outline");
            skeleton_attachment_set("mouth secondary",-1);
            break;
        case 3:
            skeleton_attachment_set("mouth base","mouth 03 base");
            skeleton_attachment_set("mouth color",-1);
            skeleton_attachment_set("mouth outline","mouth 03 outline");
            skeleton_attachment_set("mouth secondary",-1);
            break;
        default:
            skeleton_attachment_set("mouth base",-1);
            skeleton_attachment_set("mouth color",-1);
            skeleton_attachment_set("mouth outline",-1);
            skeleton_attachment_set("mouth secondary",-1);
            break;
    }
    
    skeleton_slot_color_set("mouth base", col1_, 1);
    skeleton_slot_color_set("mouth secondary", col2_, 1);
    skeleton_slot_color_set("mouth color", col3_, 1);
}

mouth_ = irandom(2) + 1;
set_eyes(mouth_);

//set pattern
pattern_ = irandom(9) + 1;
var slots = ["head",
            "front ear",
            "back ear",
            "torso",
            "front legs",
            "back legs",
            "tail"];

var pattern_string = " pattern ";
if (pattern_ < 10) pattern_string += "0";
pattern_string += string(pattern_);
for (var i = 0; i < 7; ++i) {
    skeleton_attachment_set(slots[i] + " pattern",slots[i] + pattern_string);
}