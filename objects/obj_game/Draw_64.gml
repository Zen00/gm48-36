/// @description 

var _alpha = 0.7;
draw_set_alpha(_alpha);
draw_set_color(c_black);
draw_rectangle(0, 0, 256, 92, false);
draw_set_font_ext(fnt_8bitoperator, fa_left, fa_top, c_white, _alpha);
draw_text(0, 0, "Joules: " + string(global.CURRENCIES[| CURRENCY_TYPES.joules]));
restore_alpha();
