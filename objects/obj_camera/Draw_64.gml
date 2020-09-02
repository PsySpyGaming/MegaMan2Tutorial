/// @description 

if(global.DEBUG) {
	draw_set_font(fnt_default);
	display_write_all_specs(4,4);
	draw_text(32,128,"X "+string(x));
	draw_text(32,144,"Y "+string(y));
	draw_set_font(global.FONT);	
}