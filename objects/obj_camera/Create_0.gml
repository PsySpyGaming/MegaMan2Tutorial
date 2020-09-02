/// @description Create Camera

enum CAM_MODE {
	targeted,
	fixed,
	free
}

state_ = CAM_MODE.fixed;

// Properties
view_width_ = 256;
view_height_ = 240;
display_width_ = display_get_width();
display_height_ = display_get_height();
zoom_ = floor(display_height_ / view_height_) - 2;
#macro CAM view_camera[0]

// Set the display up
window_set_size(view_width_*zoom_, view_height_*zoom_);
display_set_gui_size(view_width_, view_height_);
surface_resize(application_surface, view_width_*zoom_, view_height_*zoom_);

// Center the window
alarm[0] = 1;

//Targeting
target_ = noone;