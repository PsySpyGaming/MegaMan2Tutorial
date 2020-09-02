/// @description 

// Don't start until transition is over
if(obj_transitions.mode_ != TRANS_MODE.off) {exit;}

//Fade in/out text
if((alpha_ >= 1) && (wait_timer_ <= -1)) {
	mode_ = !mode_;
	wait_timer_ = wait_duration_;
}
if(wait_timer_ <= 0) {
	if(mode_) {alpha_ = min(1,alpha_+max(((1-alpha_)*0.1),fade_speed_));}
	else {alpha_ = max(0,alpha_-max((alpha_*0.1),fade_speed_));}
}

if(alpha_ <= 0) {
	mode_ = !mode_;
	line_++;
}

wait_timer_--;

//Start Scrolling
if(line_ >= array_length_1d(dialogue_)){
	y -= 1.0;
	obj_camera.y -= 1.5;
}

//Create the title
if(!audio_is_playing(song_)) {
	instance_create_layer(32,32,"Instances", obj_title);
	queue_new_song(mus_title,1,false);
	instance_destroy();
}

//Skip
if(obj_input.start_pressed_ || skip_){
	instance_create_layer(32,32,"Instances", obj_title);
	queue_new_song(mus_title,1,false);
	instance_destroy();
	obj_camera.state_ = CAM_MODE.fixed;
}