/// @description 

// Set off the timer that sends us to the next room
if ((alpha_ >= 1) && (wait_timer_ <= -1)){
	mode_ = !mode_;
	wait_timer_ = wait_duration_;
}

if (wait_timer_ <= 0) {
	if(mode_) {
		alpha_ = min(1,alpha_+max(((1-alpha_)*0.1),fade_speed_));
	} else {
		alpha_ = max(0,alpha_-max((alpha_*0.1),fade_speed_));
	}
}

if(alpha_ <= 0){
	fade_transition(TRANS_MODE.goto, rm_intro);
}

wait_timer_--;

//Skip copyright

if(obj_input.start_pressed_) {
	persistent = true;
	room_goto_next();
	alarm[0] = 1;
}