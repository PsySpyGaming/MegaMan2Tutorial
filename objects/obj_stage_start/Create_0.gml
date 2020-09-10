var _inst = instance_place(x,y,obj_room_boundaries);
cam_x_ = _inst.x;
cam_y_ = _inst.y;
obj_camera.x = cam_x_;
obj_camera.y = cam_y_;
obj_camera.state_ = CAM_MODE.targeted;
obj_camera.target_ = id;

queue_new_song(mus_wood_man_stage,1,false);

timer_speed_ = 16;
timer_ = -1;

spawn_x_ = x;
spawn_y_ = y;