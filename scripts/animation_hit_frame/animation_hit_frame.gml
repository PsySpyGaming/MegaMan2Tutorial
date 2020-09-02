///@desc animation_hit_frame(frame)
///@arg frame
function animation_hit_frame(argument0) {
	var _frame = argument0;

	var _speed = game_get_speed(gamespeed_fps)/sprite_get_speed(sprite_index);
	return (image_index >= _frame - image_speed/_speed) and (image_index < _frame+1);



}
