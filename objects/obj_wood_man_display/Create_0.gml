/// @description 

obj_camera.state_ = CAM_MODE.fixed;

image_speed = 0.5;
music_ = queue_new_song(mus_master_choosen,1,false);
y_target_ = 120;
y_speed_ = 8;
print_name_ = false;
name_timer_ = 0;
star_alpha_ = 0;
name_ = "WOODMAN";
chest_pounds_ = 0;

layer_background_alpha(layer_background_get_id(layer_get_id("Large_Stars")),0);
layer_background_alpha(layer_background_get_id(layer_get_id("Medium_Stars")),0);
layer_background_alpha(layer_background_get_id(layer_get_id("Small_Stars")),0);