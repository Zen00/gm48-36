/// @description 

draw_set_font_ext(fnt_wow, fa_left, fa_middle, c_black, 1);
var _curr = string(global.CURRENCIES[| CURRENCY_TYPES.zenny]);
var _height = string_height(_curr);
draw_text(x + sprite_width, y + _height, _curr);
var _width = string_width(_curr);
draw_sprite(sprite_index, 0, x, y);