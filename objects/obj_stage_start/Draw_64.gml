
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

if(interval(timer_speed_,timer_) && (timer_ <= SEC * 2)) {
	draw_text(display_get_gui_width()/2,display_get_gui_height()/2,"READY");
}