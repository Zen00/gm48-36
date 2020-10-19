/// @description 

//Check if I'm affordable
affordable_ = (purchase_price_ <= global.CURRENCIES[| currency_type_]) ? true : false;

//Check if I was pressed
var _collision = point_in_rectangle(device_mouse_x(0), device_mouse_y(0), x, y, x + width_, y + height_);
if(_collision) { hover_ = true; } else { hover_ = false; }

if(device_mouse_check_button_pressed(0, mb_left) && affordable_) {
	if(hover_) {
		pressed_ = true;
	}
}
if(device_mouse_check_button_released(0, mb_left) && hover_ && !affordable_) {
	if(!audio_is_playing(snd_bad_click)) { audio_play_sound(snd_bad_click, 1, false); }
}
if(device_mouse_check_button_released(0, mb_left) && pressed_) {
	if(hover_) {
		global.CURRENCIES[| currency_type_] -= purchase_price_;
		total_owned_ += obj_game.purchase_amount_;
		update_purchase_price();
		update_production();
		if(!audio_is_playing(audio_)) { audio_play_sound(audio_, 1, false); }
	}
	
	pressed_ = false;
}
