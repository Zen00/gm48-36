/// @description 

// Inherit the parent event
event_inherited();

//Draw the cover
draw_sprite(spr_button_cover, hover_, x - 24, y - 8);

//Draw the text
var _col = make_color_rgb(65, 65, 73);
draw_set_font_ext(global.BUTTON_FONT, fa_middle, fa_top, _col, 1);
draw_text(x + sprite_width / 2, y + 24, name_);

//Draw the indicator button
if(affordable_) {
	draw_sprite(spr_button_light, affordable_, x + sprite_width * 1.02, y);
} else {
	draw_sprite(spr_button_light, affordable_, x + sprite_width * 1.02, y);
}
