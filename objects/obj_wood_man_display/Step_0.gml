/// @description 

y = approach(y,y_target_,y_speed_);

if(y == y_target_){
	if(audio_sound_get_track_position(music_) > 3.2) {
		print_name_ = true;
	} else if (audio_sound_get_track_position(music_) > 1.8) {
		if(chest_pounds_ < 3) {
			sprite_index = spr_wood_man_chest_pound;
			if (animation_end()) {chest_pounds_++;}
		} else {
			sprite_index = spr_wood_man_idle;
		}
	} else {
		sprite_index = spr_wood_man_idle;
		star_alpha_ += 0.1;
		layer_background_alpha(layer_background_get_id(layer_get_id("Large_Stars")),star_alpha_);
		layer_background_alpha(layer_background_get_id(layer_get_id("Medium_Stars")),star_alpha_);
		layer_background_alpha(layer_background_get_id(layer_get_id("Small_Stars")),star_alpha_);
	}
}

if(!audio_is_playing(music_)){
	fade_transition(TRANS_MODE.goto,rm_wood_man_stage);
}