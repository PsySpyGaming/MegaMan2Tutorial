/// @description Transition to game from setup

show_debug_message("Async load event: " + async_load[? "type"]);
show_debug_message("Audio group: " + string(async_load[? "group_id"]));
switch(async_load[? "type"]) {
	case "audiogroup_load":
		if(audio_group_is_loaded(MUS) && audio_group_is_loaded(SFX))
			room_goto(rm_copyright);
		break;
}