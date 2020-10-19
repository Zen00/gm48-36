/// @description 

//Check if I was pressed
var _collision = point_in_rectangle(device_mouse_x(0), device_mouse_y(0), x, y, x + width_, y + height_);
if(_collision) { hover_ = true; } else { hover_ = false; }

if(device_mouse_check_button_pressed(0, mb_left)) {
	if(hover_) {
		pressed_ = true;
	}
}
if(device_mouse_check_button_released(0, mb_left) && pressed_) {
	if(hover_) {
		audio_play_sound(snd_good_click, 1, false);
		game_end();
	}
	
	pressed_ = false;
}
