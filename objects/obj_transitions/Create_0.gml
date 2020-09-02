/// @description ENUMs and Variables

enum TRANS_MODE {
	off,
	next,
	goto,
	restart,
	room_reset,
	intro,
	quit
}

enum TRANSITION_TYPE {
	none,
	slide,
	fade
}

g_width_ = display_get_gui_width();
g_height_ = display_get_gui_height();
gw_half_ = g_width_ * 0.5;
gh_half_ = g_height_ * 0.5;
mode_ = TRANS_MODE.off;
type_ = TRANSITION_TYPE.fade;
starting_percent_ = 1.2;
percent_ = starting_percent_;
target_ = room;

