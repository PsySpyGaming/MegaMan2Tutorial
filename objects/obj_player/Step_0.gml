#region Transition Check
var _list = ds_list_create();
var _rooms = instance_place_list(x,y,obj_room_boundaries,_list,false);
if(current_room_ == noone)
{
	current_room_ = _list[| 0];
}
ds_list_destroy(_list);
#endregion

#region Ground Check
var _p1, _p2, _p3, _p4, _p5, _p6, _p7;
_p1 = tilemap_get_at_pixel(tilemap_,bbox_left,bbox_bottom);
_p2 = tilemap_get_at_pixel(tilemap_,bbox_left,bbox_bottom+1);
_p3 = tilemap_get_at_pixel(tilemap_,bbox_right,bbox_bottom);
_p4 = tilemap_get_at_pixel(tilemap_,bbox_right,bbox_bottom+1);
_p5 = collision_line(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1, par_solid, false, false);
_p6 = tilemap_get_at_pixel(tilemap_,bbox_left+(bbox_right-bbox_left)*0.5,bbox_bottom);
_p7 = tilemap_get_at_pixel(tilemap_,bbox_left+(bbox_right-bbox_left)*0.5,bbox_bottom+1);
on_ground_ = (((_p1 == 0) && (_p2 >= 1)) || ((_p3 == 0) && (_p4 >= 1)) || (_p5 != noone) || any(1,_p2,_p4) || ((_p6 == 0) && (_p7 == 3))) && (y_speed_ == 0);
#endregion

#region Direction
x_input_ = obj_input.right_held_ - obj_input.left_held_;
y_input_ = obj_input.down_held_ - obj_input.up_held_;

var _input_direction = point_direction(0,0,x_input_,y_input_);
if(x_input_ != 0)
{
	direction_facing_ = round(_input_direction/90);
	if(direction_facing_ == 4) {direction_facing_ = 0;}
}

#endregion

#region State execution
//Reset our sprite preference, state will set a manual sprite change if needed
manual_sprite_change_ = false;

//Execute the player's current state
event_user(state_);

//Change sprite to match state
if (!manual_sprite_change_) { sprite_index = sprite_[state_,direction_facing_];}
#endregion

#region Positional Clamping
	var _spr_hw = abs(sprite_width * 0.5);
	x = clamp(x, current_room_.x + _spr_hw, room_width - _spr_hw);
#endregion

#region Timers
//Iframes
if(iframe_timer_ != -1) { iframe_timer_ = approach(iframe_timer_,-1,1)}
if(iframe_timer_ == 0) { iframes_ = false; }
#endregion