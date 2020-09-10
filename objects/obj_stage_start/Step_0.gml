if (room != rm_wood_man_stage) {
	instance_destroy();
}

timer_++;

if(timer_ == SEC*2) {
	instance_create_layer(spawn_x_,spawn_y_,"Instances",obj_teleporting_in_mega_man);
}