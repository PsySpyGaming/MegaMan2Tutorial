/// @description 

draw_self();

//Draw text
if(line_ < array_length_1d(dialogue_)) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_alpha(alpha_);
	draw_text(room_width / 2, room_height - 32, dialogue_[line_]);
	draw_set_alpha(1);
}
