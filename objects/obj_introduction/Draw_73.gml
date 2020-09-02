/// @description

//Draw a black box to hide the tower behind as it starts crawling
if(line_ >= array_length_1d(dialogue_)){
	draw_set_color(c_black);
	draw_rectangle(x, y+168, room_width, y+296, false);
	draw_set_color(c_white);
}
