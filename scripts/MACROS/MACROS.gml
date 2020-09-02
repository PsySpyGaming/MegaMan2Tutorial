function MACROS() {
	//Run me at the start of the game, to declare these things
	gml_pragma("global","MACROS()");

	//Enums, defined before globals so globals can use the enums
	enum DIR4
	{
		right,
		up,
		left,
		down
	}

	enum DIR8
	{
		right,
		right_up,
		up,
		left_up,
		left,
		left_down,
		down,
		right_down
	}

	//Randomize
	randomize();

	//Font
	var _map = "c01289ABCDEFGHIJKLMNOPQRSTUVWXYZr.,'!-:";
	global.FONT = font_add_sprite_ext(spr_font_strip37,_map,true,1);
	draw_set_font(global.FONT);

	//Various globals
	global.MUS_VOLUME = 0.5;
	global.SFX_VOLUME = 0.5;
	global.DEBUG = false;
	global.PAUSE = false;
	global.NEW_WEAPON = noone;
	global.MASTERS_DEFEATED = ds_list_create();
	global.PREVIOUS_STAGE = rm_copyright;
	ds_list_add(global.MASTERS_DEFEATED,true,true,false,false,false,false,false,false,false);
	//ds_map_add(global.MASTERS_DEFEATED,"bubble_man",false);
	//ds_map_add(global.MASTERS_DEFEATED,"air_man",false);
	//ds_map_add(global.MASTERS_DEFEATED,"quick_man",false);
	//ds_map_add(global.MASTERS_DEFEATED,"heat_man",false);
	//ds_map_add(global.MASTERS_DEFEATED,"wood_man",false);
	//ds_map_add(global.MASTERS_DEFEATED,"metal_man",false);
	//ds_map_add(global.MASTERS_DEFEATED,"flash_man",false);
	//ds_map_add(global.MASTERS_DEFEATED,"crash_man",false);

	//Macros
#macro SEC game_get_speed(gamespeed_fps)
#macro TILE_WIDTH 16
#macro TILE_HEIGHT 16

	//Scripts
	//pal_swap_init();



}
