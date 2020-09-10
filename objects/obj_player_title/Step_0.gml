/// @description 

if(activate_){
	y -= 8;
	
	if(!restart_){
		if(!audio_is_playing(sound_)){
			fade_transition(TRANS_MODE.goto,rm_mode_select);
		}
	} else {
		fade_transition(TRANS_MODE.goto,rm_intro);
	}
}
