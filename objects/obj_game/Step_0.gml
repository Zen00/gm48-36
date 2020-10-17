/// @description 

//Base tick rate
//Note: This is not "secure", nor does it support off-line play (eg: Android stasis)
if(game_time_passed_ mod tick_rate_ == 0) {
	with(par_generator) {
		generate_currency();
	}
}
game_time_passed_++;
