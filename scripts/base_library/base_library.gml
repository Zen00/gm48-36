// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

var _button_font_map =	"_!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~-";//"!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
global.BUTTON_FONT = font_add_sprite_ext(spr_font_buttons, _button_font_map, true, 1);

///@func draw_set_font_ext(font,halign,valign,col,alpha)
///@desc Set your font with all options
///@arg font
///@arg halign
///@arg valign
///@arg col
///@arg alpha
function draw_set_font_ext(_font, _halign, _valign, _col, _alpha){
	draw_set_font(_font);
	draw_set_halign(_halign);
	draw_set_valign(_valign);
	draw_set_color(_col);
	draw_set_alpha(_alpha);
}

///@func restore_alpha()
///@desc Restore the alpha to 1
function restore_alpha() {
	draw_set_alpha(1);
}

///@func display_write_all_specs(x,y)
///@desc Writes all relevant display information onto whatever draw event you put this
///@arg x
///@arg y
function display_write_all_specs(_x,_y) {
	var _str;
	_str  =		"Display: "+string(display_get_width())+" x "+string(display_get_height())+" ("+string(display_get_width()/display_get_height())+")";
	_str +=		"\nWindow: "+string(window_get_width())+" x "+string(window_get_height())+" ("+string(window_get_width()/window_get_height())+")";
	_str +=		"\nGUI: "+string(display_get_gui_width())+" x "+string(display_get_gui_height())+" ("+string(display_get_gui_width()/display_get_gui_height())+")";
	_str +=		"\nApp Surface: "+string(surface_get_width(application_surface))+" x "+string(surface_get_height(application_surface))+" ("+string(surface_get_width(application_surface)/surface_get_height(application_surface))+")";
	_str +=		"\nView: "+string(camera_get_view_width(view_camera[0]))+" x "+string(camera_get_view_height(view_camera[0]))+" ("+string(camera_get_view_width(view_camera[0])/camera_get_view_height(view_camera[0]))+")";

	draw_text(_x,_y,_str);	
}