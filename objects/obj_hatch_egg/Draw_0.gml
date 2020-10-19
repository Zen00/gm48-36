/// @description 


if(global.CURRENCIES[| CURRENCY_TYPES.hatch_progress] >= 1) {
	if(pressed_ || activated_) { draw_sprite_ext(sprite_index, 2, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha); }
	else { draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha); }
} else {
	draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
