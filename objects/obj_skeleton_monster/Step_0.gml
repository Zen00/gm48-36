/// @description 

if(!active_) { exit; }

//Play random sounds
if(sound_timer_ <= 0) {
	var _audio = choose(snd_juvenile_bark, snd_juvenile_purr, snd_juvenile_growl);
	audio_play_sound(_audio, 1, false);
	sound_timer_ = (irandom(12) + 8) * SEC;
}
sound_timer_--;
