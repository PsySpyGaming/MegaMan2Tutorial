/// @description 

draw_self();
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(bbox_left+16,bbox_bottom+64, "PRESS START");

//Draw options
for(var i=0; i<array_length_1d(options_); i++) {
	draw_text(bbox_left+32, bbox_bottom+16+(i*16), options_[i]);
}

//Caret
if(interval(interval_speed_,interval_timer_) && draw_caret_){
	draw_sprite(spr_selection_caret,0,bbox_left+16,bbox_bottom+16+(selection_*16));
}