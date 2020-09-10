/// @description 

obj_camera.state_ = CAM_MODE.fixed;

width_ = 104;
height_ = 56;
top_ = 79;
left_ = 79;

options_ = ["START","PASSWORD"];
selection_ = 0;
draw_caret_ = true;
interval_timer_ = 0;
interval_speed_ = 16;
sound_ = noone;

song_ = queue_new_song(mus_mode_select,1,false,SEC);
