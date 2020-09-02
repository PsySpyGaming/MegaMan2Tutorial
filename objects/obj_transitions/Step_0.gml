/// @description 

if (mode_ == TRANS_MODE.off) { 
	exit; 
	}

if (mode_ == TRANS_MODE.intro) {
	percent_ = max( 0, percent_ - max(( percent_ * 0.1 ), 0.05 ));
} else { 
	percent_ = min( starting_percent_, percent_ + max((( starting_percent_ - percent_ ) * 0.1), 0.005 ));
}

// What to do at full trans/black
if((percent_ >= starting_percent_) || (percent_ <= 0)) {
	switch(mode_) {
		case TRANS_MODE.intro: //If we just became fully visible
			mode_ = TRANS_MODE.off;
			obj_input.state_ = INPUT_STATES.standard; //Returns controls to normal once the transition is over
		break;
		case TRANS_MODE.next:
			mode_ = TRANS_MODE.intro;
			room_goto_next();
		break;
		case TRANS_MODE.goto:
			mode_ = TRANS_MODE.intro;
			room_goto(target_);
		break;
		case TRANS_MODE.restart: //Restart/quit the game once we go to full black
			game_restart();
		break;
		case TRANS_MODE.room_reset: //Restart the room once we go to full black
			mode_ = TRANS_MODE.intro;
			room_restart();
		break;
		case TRANS_MODE.quit:
			game_end();
		break;
	
	}
}
