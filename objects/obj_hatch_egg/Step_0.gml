/// @description 

if(!activated_) {
	//Check if I was pressed
	var _affordable = global.CURRENCIES[| CURRENCY_TYPES.hatch_progress] >= 1;
	var _collision = point_in_rectangle(device_mouse_x(0), device_mouse_y(0), x, y, x + width_, y + height_);
	if(_collision) { hover_ = true; } else { hover_ = false; }
	if(_affordable) {
		if(device_mouse_check_button_pressed(0, mb_left)) {
			if(hover_) {
				pressed_ = true;
			}
		}
		if(device_mouse_check_button_released(0, mb_left) && pressed_) {
			if(hover_) {
				audio_play_sound(snd_egg_hatching, 1, false);
				with(obj_skeleton_egg) {
					state_ = EGG_STATES.hatch;
					current_animation_ = "hatch";
					//skeleton_attachment_set("egg pattern","pattern 0" + pattern_ + " hatched");
					skeleton_animation_set(current_animation_);
					animation_timer_ = 0;
				}
				activated_ = true;
				
				instance_create_layer(room_width / 2, room_height + 100, "Instances", obj_credits);
			}
	
			pressed_ = false;
		}
	}
}
