// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

var _button_font_map =	"_!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~- ";//"!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
global.BUTTON_FONT = font_add_sprite_ext(spr_font_buttons, _button_font_map, true, 1);
global.BUTTON_FONT_SMALL = font_add_sprite_ext(spr_font_buttons_small, _button_font_map, true, 1);

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

///@func queue_new_song(song,priority,loop,[fade_length],[loop_back_from],[loop_back_to])
///@desc Kill the current song and start a new one (or noone if you want silence)
///@arg song
///@arg priority
///@arg loop
///@arg fade_length
///@arg loop_back_from
///@arg loop_back_to
function queue_new_song(_song, _priority, _loop, _fade_length, _loop_back_from, _loop_back_to) {
	//Define the fade length
	var _fl = argument_count >= 4 ? _fade_length : 0;
	var _lbf = argument_count >= 5 ? _loop_back_from : 0;
	var _lbt = argument_count >= 6 ? _loop_back_to : 0;

	//Use the music manager for variable wrapping
	with(obj_music_manager) {
		if(_song == noone) {
			audio_sound_gain(now_playing_,0,_fl);
		}
		else if(!audio_is_playing(_song)) {
			previous_track_ = now_playing_;
			now_playing_ = audio_play_sound(_song, _priority, _loop);
			loop_back_from_ = _lbf;
			loop_back_to_ = _lbt;
			audio_sound_gain(now_playing_,0,0); //Crossfade implementation
			audio_sound_gain(now_playing_,mus_vol_,_fl);
			audio_sound_gain(previous_track_,0,_fl);
		}
	
		return now_playing_;
	}
}

///@func queue_silence(fade_length)
///@desc Similar to queue_new_song, but hard coded to only give silence
///@arg fade_length
function queue_silence(_fade_length) {
	//Define the fade length
	var _fl = argument_count == 1 ? _fade_length : 0;

	//Use the music manager for variable wrapping
	with(obj_music_manager) { audio_sound_gain(now_playing_, 0, _fl); }
}

///@func approach(current,target,amount)
///@desc Takes the given value to the target value by the amount
///@arg current
///@arg target
///@arg amount
function approach(_current, _target, _amount) {
	return _current < _target ? min(_current + _amount,_target) : max(_current - _amount,_target);
}
