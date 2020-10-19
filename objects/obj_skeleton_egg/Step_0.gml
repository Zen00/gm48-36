/// @description 

switch(state_) {
	case EGG_STATES.idle:

	break;
	case EGG_STATES.knock:
		if((animation_timer_ / SEC) >= skeleton_animation_get_duration(current_animation_)) {
			animation_timer_ = 0;
			state_ = EGG_STATES.idle;
			current_animation_ = "idle";
			skeleton_animation_set(current_animation_);
		}

		animation_timer_++;
	break;
	case EGG_STATES.hatch:
		if(skeleton_attachment_get("egg base") == "hatched base") {
			skeleton_attachment_set("fragment pattern","pattern 0" + pattern_);
			skeleton_attachment_set("egg pattern","pattern 0" + pattern_ + " hatched");
		}
		if(animation_timer_ >= hatch_animation_length_ - 1 / SEC) {
			obj_skeleton_monster.x = x;
			obj_skeleton_monster.y = y;
			obj_skeleton_monster.active_ = true;
			instance_destroy();
		}

		animation_timer_ += 1/SEC;
	break;
}

//Check if I was pressed
if(device_mouse_check_button_pressed(0, mb_left)) {
	//var _collision = point_in_rectangle(device_mouse_x(0), device_mouse_y(0), x, y, x + width_, y + height_);
	var _collision = position_meeting(device_mouse_x(0), device_mouse_y(0), object_index);
	if(_collision) {
		pressed_ = true;
	}
}
if(device_mouse_check_button_released(0, mb_left) && pressed_) {
	//var _collision = point_in_rectangle(device_mouse_x(0), device_mouse_y(0), x, y, x + width_, y + height_);
	var _collision = position_meeting(device_mouse_x(0), device_mouse_y(0), object_index);
	if(_collision && (state_ == EGG_STATES.idle)) {
		//global.CURRENCIES[| currency_type_] += production_;
		state_ = EGG_STATES.knock;
		current_animation_ = choose("knock", "knock2");
		skeleton_animation_set(current_animation_);
	}
	
	pressed_ = false;
}

//Fall in
if(!on_ground_) {
	y_speed_ += 0.25;
	y += y_speed_;
	if(y >= 736) {
		y = 736;
		image_yscale = 0.75;
		on_ground_ = true;
	}
} else if(image_yscale != 1) {
	image_yscale = approach(image_yscale, 1, 0.025);
}
