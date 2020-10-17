/// @description 

switch(state_) {
	case EGG_STATES.idle:
		if(animation_timer_ == 0) {
			visible = false;
			current_sequence_ = layer_sequence_create("Instances", x, y, seq_egg_idle);
			layer_sequence_play(current_sequence_);
		}
		if(layer_sequence_is_finished(current_sequence_)) {
			visible = true;
			layer_sequence_destroy(current_sequence_);
			animation_timer_ = irandom_range(SEC * 3, SEC * 5);
		}
		animation_timer_--;
	break;
	case EGG_STATES.shaking:
	
	break;
}

//Check if I was pressed
if(device_mouse_check_button_pressed(0, mb_left)) {
	var _collision = point_in_rectangle(device_mouse_x(0), device_mouse_y(0), x, y, x + width_, y + height_);
	if(_collision) {
		pressed_ = true;
	}
}
if(device_mouse_check_button_released(0, mb_left) && pressed_) {
	var _collision = point_in_rectangle(device_mouse_x(0), device_mouse_y(0), x, y, x + width_, y + height_);
	if(_collision) {
		global.CURRENCIES[| currency_type_] += production_;
	}
	
	pressed_ = false;
}