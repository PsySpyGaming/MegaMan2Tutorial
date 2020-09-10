/// @description
//Options
if(draw_caret_){
	if(obj_input.up_pressed_){
		selection_ = wrap(--selection_,0,1);
		interval_timer_ = 0;
		if(audio_sound_get_track_position(sound_) > 200 || !audio_exists(sound_)) {
			audio_stop_sound(sound_);
			sound_ = audio_play_sound_ext(snd_caret,1,false,noone,2);
		}
	}
	if(obj_input.down_pressed_){
		selection_ = wrap(++selection_,0,1);
		interval_timer_ = 0;
		if(audio_sound_get_track_position(sound_) > 200 || !audio_exists(sound_)) {
			audio_stop_sound(sound_);
			sound_ = audio_play_sound_ext(snd_caret,1,false,noone,2);
		}
	}
	
	interval_timer_++;
	
	if(obj_input.start_pressed_){
		draw_caret_ = false;
		global.DIFFICULT = selection_ == 1 ? true : false;
		with(obj_player_title) {
		audio_stop_all();
		sprite_index = spr_mega_man_transforming;
		}
	}
}

//Loop the title
if(!audio_is_playing(mus_title) && draw_caret_) {
	draw_caret_ = false;
	with(obj_player_title){
		audio_stop_all();
		restart_ = true;
		sprite_index = spr_mega_man_transforming;
	}
}