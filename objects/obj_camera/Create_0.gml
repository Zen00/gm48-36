///@description 

enum CAM_MODE {
	targeted,
	fixed,
	free
}
state_ = CAM_MODE.fixed;

//Properties
view_width_ = 1920;
view_height_ = 1080;
display_width_ = display_get_width(); //Gets your monitors aspect ratio
display_height_ = display_get_height();
zoom_ = max(floor(display_height_ / view_height_) - 1,1); //The # is arbitrary, we're using h/w because the aspect ratio of the ideal w/h is greater than 1
#macro CAM view_camera[0]

//Set the display properties
window_set_size(view_width_*zoom_,view_height_*zoom_);
display_set_gui_size(view_width_,view_height_);
surface_resize(application_surface,view_width_*zoom_*2,view_height_*zoom_*2); //Resizing the app surface gives more sub-pixels to work with, for smoother rotation and other non-pixel perfect animations

//Center the window
alarm[0] = 1;

//Targeting
x_previous_ = x;
y_previous_ = y;
target_ = noone;

//Camera shake
shake_ = false;
shake_intensity_ = 6;
