/// @description 

//Create an outline for the header
pixelh_uniform_ = shader_get_uniform(sha_outline, "pixelHeight");
pixelw_uniform_ = shader_get_uniform(sha_outline, "pixelWidth");
pixelw_ = 0;
pixelh_ = 0;
sprite_text_ = noone;

function outline_label() {
	draw_set_font_ext(fnt_wow, fa_left, fa_top, c_black, 1);
	var _text = "HATCHING PROGRESS";
	var _height = string_height(_text);
	var _width = string_width(_text);
	var _surf = surface_create(_width, _height);
	surface_set_target(_surf);
	draw_text(0, 0, _text);
	surface_reset_target();
	
	sprite_text_ = sprite_create_from_surface(_surf, 0, 0, _width,_height, false, false, 0, 0);
	pixelw_ = texture_get_texel_width(sprite_get_texture(sprite_text_,0));
	pixelh_ = texture_get_texel_height(sprite_get_texture(sprite_text_,0));
	
	surface_set_target(_surf);
	draw_clear_alpha(c_black, 0);
	shader_set(sha_outline);
	shader_set_uniform_f(pixelw_uniform_, pixelw_);
	shader_set_uniform_f(pixelh_uniform_, pixelh_);
	draw_sprite(sprite_text_, 0, 0, 0);
	shader_reset();
	surface_reset_target();
	
	sprite_delete(sprite_text_);
	sprite_text_ = sprite_create_from_surface(_surf, 0, 0, _width,_height, false, false, 0, 0);
	surface_free(_surf);
}
outline_label();
