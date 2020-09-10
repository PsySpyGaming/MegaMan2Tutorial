/// @description Follow State

if(instance_exists(target_)){
	var _x = target_.x - view_width_ / 2;
	if(instance_exists(obj_room_boundaries)) {
		var _id = collision_point(x,y,obj_room_boundaries,false,true);
		var _y = _id.y;
		_x = clamp(_x, _id.bbox_left, _id.bbox_right + 1 - view_width_);
	} else {
		var _y = target_.y - view_height_ / 2;
	}
}

_x = clamp(_x,0,room_width - view_width_);
_y = clamp(_y,0,room_height - view_height_);

x = _x;
y = _y;
camera_set_view_pos(CAM,_x,_y);