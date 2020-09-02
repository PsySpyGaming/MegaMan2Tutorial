/// @description 

if (mode_ == TRANS_MODE.off) exit;

if (type_ == TRANSITION_TYPE.slide) {
	draw_set_color(c_black);
	draw_rectangle(0, 0, g_width_, percent_ * gh_half_, false);
	draw_rectangle(0, g_height_, g_width_, g_height_ - (percent_ * gw_half_), false);
	draw_set_color(c_white);
}

if (type_ == TRANSITION_TYPE.fade) {
	draw_set_alpha(percent_);
	draw_set_color(c_black);
	draw_rectangle(0, 0, g_width_, g_height_, false);
	draw_set_color(c_white);
	draw_set_alpha(1);
}