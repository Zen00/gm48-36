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
}

//Check if I was pressed
if(device_mouse_check_button_pressed(0, mb_left)) {
	//var _collision = point_in_rectangle(device_mouse_x(0), device_mouse_y(0), x, y, x + width_, y + height_);
	var _collision = position_meeting(device_mouse_x(0), device_mouse_y(0), obj_egg);
	if(_collision) {
		pressed_ = true;
	}
}
if(device_mouse_check_button_released(0, mb_left) && pressed_) {
	//var _collision = point_in_rectangle(device_mouse_x(0), device_mouse_y(0), x, y, x + width_, y + height_);
	var _collision = position_meeting(device_mouse_x(0), device_mouse_y(0), obj_egg);
	if(_collision && (state_ == EGG_STATES.idle)) {
		//global.CURRENCIES[| currency_type_] += production_;
		state_ = EGG_STATES.knock;
		current_animation_ = choose("knock", "knock2");
		skeleton_animation_set(current_animation_);
	}
	
	pressed_ = false;
}
