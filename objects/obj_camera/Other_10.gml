///@description Targeted State

//Simple camera follows the player
if(instance_exists(target_)) {
	//Calculate a position that is centered on the player
	var _x = target_.x - view_width_ / 2;
	var _y = target_.y - view_height_ / 2;
	
	//Clamp the view to the room
	_x = clamp(_x,0,room_width - view_width_);
	_y = clamp(_y,0,room_height - view_height_);
	
	//Position the camera
	x_previous_ = x; //Have to manually handle these
	y_previous_ = y;
	x = _x;
	y = _y;
	camera_set_view_pos(CAM,_x,_y);
}
