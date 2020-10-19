///@description 

//Kill the audio once it's faded out enough (left fuzzy in case something prevents it from reaching 0, looking at you HTML)
if(audio_is_playing(previous_track_) && (audio_sound_get_gain(previous_track_) <= 0.001)) {	audio_stop_sound(previous_track_); }

//Loop back
if(loop_back_from_ > 0) {
	if(audio_sound_get_track_position(now_playing_) >= loop_back_from_) { audio_sound_set_track_position(now_playing_, loop_back_to_); }
}

if(window_has_focus()) { audio_resume_all(); } else { audio_pause_all(); }
