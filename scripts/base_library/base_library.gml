// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

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
