/// @description 

//Check if I'm affordable
affordable_ = (purchase_price_ <= global.CURRENCIES[| currency_type_]) ? true : false;

//Check if I was pressed
if(device_mouse_check_button_pressed(0, mb_left) && affordable_) {
	var _collision = point_in_rectangle(device_mouse_x(0), device_mouse_y(0), x, y, x + width_, y + height_);
	if(_collision) {
		pressed_ = true;
	}
}
if(device_mouse_check_button_released(0, mb_left) && pressed_) {
	var _collision = point_in_rectangle(device_mouse_x(0), device_mouse_y(0), x, y, x + width_, y + height_);
	if(_collision) {
		global.CURRENCIES[| currency_type_] -= purchase_price_;
		total_owned_ += obj_game.purchase_amount_;
		update_purchase_price();
		update_production();
	}
	
	pressed_ = false;
}


