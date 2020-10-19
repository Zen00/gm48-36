/// @description 

//Draw label
var xx = (sprite_width - sprite_get_width(sprite_text_)) / 2;
var yy = sprite_get_height(sprite_text_);
draw_sprite(sprite_text_, 0, x + xx, y - yy);

//Draw progress bar
var _width = clamp(sprite_width * global.CURRENCIES[| CURRENCY_TYPES.hatch_progress], 0, sprite_width);
draw_sprite_part(spr_progress_bar, 0, 0, 0, _width, 110, x, y);

//Draw end-cap
var xx = clamp(x + _width - sprite_get_width(spr_progress_bar_endcap) * 0.75, x, x + sprite_width - sprite_get_width(spr_progress_bar_endcap) * 1.25);
draw_sprite(spr_progress_bar_endcap, 0, xx, y);

//var _col = c_lime;
//var _width = max(x, x + sprite_width * global.CURRENCIES[| CURRENCY_TYPES.hatch_progress]); // - sprite_get_width(spr_progress_bar_endcap)
//_width = min(_width, x + sprite_width - 1);
//draw_rectangle_color(x, y, _width, y + sprite_height - 1, _col, _col, _col, _col, false);
//draw_sprite(spr_progress_bar_endcap, 0, _width, y);

draw_self();
