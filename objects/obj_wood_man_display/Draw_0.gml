/// @description 

draw_self();

//Draw name
if(print_name_){
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var _temp_str = "";
	_temp_str = string_copy(name_,1,name_timer_);
	name_timer_ += 0.25;
	name_timer_ = clamp(name_timer_,0,string_length(name_));
	draw_text(bbox_left-12, bbox_bottom+8, _temp_str);
}