
obj_camera.x = cam_x_;
obj_camera.y = cam_y_;
obj_camera.state_ = CAM_MODE.free;
if(!audio_is_playing(mus_wood_man_stage)) { queue_new_song(mus_wood_man_stage,1,false); }