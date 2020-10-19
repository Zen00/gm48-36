/// @description 

//Base tick rate
//Note: This is not "secure", nor does it support off-line play (eg: Android stasis)
if(game_time_passed_ mod tick_rate_ == 0) {
	with(par_primary_generator) {
		generate_currency();
	}
}
game_time_passed_++;


//Play random sounds
if(sound_timer_ <= 0) {
	var _audio = snd_kaiju_distant
	audio_play_sound(_audio, 1, false);
	sound_timer_ = (irandom(48) + 37) * SEC;
}
sound_timer_--;
