/// @description 

//Draw label
var xx = (sprite_width - sprite_get_width(sprite_text_)) / 2;
var yy = sprite_get_height(sprite_text_);
draw_sprite(sprite_text_, 0, x + xx, y - yy);

//Draw progress bar
var _col = c_lime;
draw_rectangle_color(x, y, x + sprite_width * obj_egg.hatching_progress_ - sprite_get_width(spr_progress_bar_endcap), y + sprite_height - 1, _col, _col, _col, _col, false);
draw_sprite(spr_progress_bar_endcap, 0, x + sprite_width * obj_egg.hatching_progress_ - sprite_get_width(spr_progress_bar_endcap), y);

draw_self();
