/// @description 

if(!selected_){
	if(obj_input.up_pressed_){
		y -= 64;
		interval_timer_ = 0;
		if((audio_sound_get_track_position(sound_) > 200) || !audio_exists(sound_)) {
			audio_stop_sound(sound_);
			sound_ = audio_play_sound_ext(snd_caret,1,false,noone,2);
		}
	}
	if(obj_input.down_pressed_){
		y += 64;
		interval_timer_ = 0;
		if((audio_sound_get_track_position(sound_) > 200) || !audio_exists(sound_)) {
			audio_stop_sound(sound_);
			sound_ = audio_play_sound_ext(snd_caret,1,false,noone,2);
		}
	}
		if(obj_input.left_pressed_){
		x -= 64;
		interval_timer_ = 0;
		if((audio_sound_get_track_position(sound_) > 200) || !audio_exists(sound_)) {
			audio_stop_sound(sound_);
			sound_ = audio_play_sound_ext(snd_caret,1,false,noone,2);
		}
	}
		if(obj_input.right_pressed_){
		x += 64;
		interval_timer_ = 0;
		if((audio_sound_get_track_position(sound_) > 200) || !audio_exists(sound_)) {
			audio_stop_sound(sound_);
			sound_ = audio_play_sound_ext(snd_caret,1,false,noone,2);
		}
	}
	
	//Clamp to Grid
	x = clamp(x,43,171);
	y = clamp(y,27,155);
	
	//Determine the selection via the position
	var _x = x div 64;
	var _y = y div 64;
	selection_ = _y*3 + _x;
	
	//Make a selection
	if(obj_input.start_pressed_) {
		if(selection_ != 4) {
			selected_ = true;
			audio_play_sound(snd_teleporting,1,false);
		}
	}
}

if(selected_){
	countdown_--;
	if(!audio_is_playing(snd_teleporting)){
		global.SELECTED_MASTER = selection_;
		audio_stop_all();
		room_goto(rm_master_display); //No transition here
	}
}

interval_timer_++;








