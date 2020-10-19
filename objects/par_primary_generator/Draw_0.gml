/// @description 

//draw_sprite(icon_, image_index, x, y);
draw_self();

//Draw the cover
draw_sprite(spr_button_cover, hover_ * affordable_, x - 24, y - 8);

//Draw the text
var _col = make_color_rgb(65, 65, 73);
draw_set_font_ext(global.BUTTON_FONT_SMALL, fa_left, fa_top, _col, 1);
draw_text(x + 12, y + 24, name_);

draw_sprite_ext(spr_zenny_symbol, 0, x + 16, y + 42, 0.25, 0.25, 0, c_white, 1);
draw_text(x + 48, y + 48, string(purchase_price_));

draw_set_font_ext(global.BUTTON_FONT, fa_right, fa_top, _col, 1);
draw_text(x + width_ - 20, y + 24, string(total_owned_));




/*
draw_set_font_ext(fnt_8bitoperator, fa_left, fa_top, c_white, 1);
draw_text(x, y, name_);
draw_text(x, y + 24, "Owned: " + string(total_owned_));
draw_text(x, y + 36, "Purchase cost: " + string(purchase_price_));
draw_text(x, y + 48, "Production rate: " + string(production_));
