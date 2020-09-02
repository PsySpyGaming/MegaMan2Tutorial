/// @description 

//Detect Gamepad Plugin
var _event = async_load[? "event_type"];
var _id = async_load[? "pad_index"];
show_debug_message("Event = " + _event);
show_debug_message("Pad = " + string(_id));

switch(_event){
	case "gamepad discovered":
		gp_id_ = _id;
		gamepad_set_axis_deadzone(gp_id_, 0.5);
		gamepad_set_button_threshold(gp_id_, 1);
	break;
	case "gamepad lost":
		if(gp_id_ == _id) { gp_id_ = noone; }
	break;
}