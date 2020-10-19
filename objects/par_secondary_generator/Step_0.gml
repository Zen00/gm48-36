/// @description 

//Check if I'm affordable
affordable_ = (activation_cost_ <= global.CURRENCIES[| activation_currency_]) ? true : false;

//Check if I was pressed
var _collision = point_in_rectangle(device_mouse_x(0), device_mouse_y(0), x, y, x + width_, y + height_);
if(_collision) { hover_ = true; } else { hover_ = false; }

//Press only if we're selected
if(device_mouse_check_button_pressed(0, mb_left) && affordable_) {
	if(hover_) {
		pressed_ = true;
	}
}
if(device_mouse_check_button_released(0, mb_left) && pressed_) {
	if(hover_) {
		generate_currency();
		if(!audio_is_playing(audio_)) { audio_play_sound(audio_, 1, false); }
	}
	
	pressed_ = false;
}
