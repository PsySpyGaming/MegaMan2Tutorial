///@func move_with_tile_collisions(tilemap,x_speed,y_speed)
///@desc Detects collision tiles and moves/doesn't as you need them to, also returns a new x/y speed if needed for animation and such
///@arg tilemap
///@arg x_speed
///@arg y_speed
function move_with_tile_collisions(argument0, argument1, argument2) {
	var _tilemap = argument0;
	var _x_speed = argument1;
	var _y_speed = argument2;

#region Horizontal Collisions
	//If we're about to run into a wall, snap to it instead
	var _bbox_check,_p1,_p2,_current_cell,_target_cell,_target_x,_target_y,_cells;
	if(_x_speed >= 0)
		_bbox_check = bbox_right; //Right
	else
		_bbox_check = bbox_left; //Left

	_current_cell = _bbox_check div TILE_WIDTH;
	_target_cell = (_bbox_check + _x_speed) div TILE_WIDTH;
	_cells = abs(_target_cell - _current_cell); //How many cells to check for collision

	//If we're not leaving the current cell, no need to check for a collision
	if(_target_cell == _current_cell)
	{
		x += _x_speed;
	}
	else
	{
		for(var i=1; i<=_cells; i++)
		{
			_target_x = (_current_cell + (i * sign(_x_speed))) * TILE_WIDTH;
			_p1 = tilemap_get_at_pixel(_tilemap,_target_x,bbox_top);
			_p2 = tilemap_get_at_pixel(_tilemap,_target_x,bbox_bottom);
			if((_p1 == 1) || (_p2 == 1)) //1 == solid tile, add other solid tiles as needed
			{
				if(_x_speed > 0) //Going right
					x = _target_x + (x - _bbox_check - 1);
				else //Going left
					x = _target_x + TILE_WIDTH + (x - _bbox_check);
			
				_x_speed = 0;
				break;
			}
		}
	
		//If no collision was detected, then we apply our speed as normal (we also apply it as normal if a collision was detected, but we set it to 0 when we snapped position)
		x += _x_speed;
	}
#endregion

#region Vertical Collisions
	//Cut all the redundant comments
	if(_y_speed >= 0)
		_bbox_check = bbox_bottom; //Falling
	else
		_bbox_check = bbox_top; //Rising

	_current_cell = _bbox_check div TILE_HEIGHT;
	_target_cell = (_bbox_check + _y_speed) div TILE_HEIGHT;
	_cells = abs(_target_cell - _current_cell);

	if(_target_cell == _current_cell)
	{
		y += _y_speed;
	}
	else
	{
		for(var i=1; i<=_cells; i++)
		{
			_target_y = (_current_cell + (i * sign(_y_speed))) * TILE_HEIGHT;
			_p1 = tilemap_get_at_pixel(_tilemap,bbox_right,_target_y);
			_p2 = tilemap_get_at_pixel(_tilemap,bbox_left,_target_y);
			var _p3 = tilemap_get_at_pixel(_tilemap,bbox_left+(bbox_right-bbox_left)*0.5,_target_y);
			if((_p1 == 1) || (_p2 == 1)) //1 == solid block
			{
				if(_y_speed > 0) //Going down
					y = _target_y - 1 - (_bbox_check - y);
				else //Going up
					y = _target_y + TILE_HEIGHT + (y - _bbox_check);
			
				_y_speed = 0;
				break;
			}
			if((_p1 == 2) || (_p2 == 2)) //2 == platform
			{
				if(_y_speed > 0) //Going down
				{
					if(_current_cell != _target_cell) //So we don't get stuck inside of a platform block
					{
						y = _target_y - 1 - (_bbox_check - y);
						_y_speed = 0; //Enclose this, or you'll bonk your head on platforms
						break;
					}
				}
			}
			if(_p3 == 3) //2 == Ladder
			{
				if(_y_speed > 0) //Going down
				{
					//If we're above a ladder tile and going down, treat it like a solid
					//Otherwise go through it
					if(tilemap_get_at_pixel(_tilemap,bbox_left+(bbox_right-bbox_left)*0.5,_target_y-1) != 3) { //The 3 could change depending on if there's another collision tile type above the ladder
						y = _target_y - 1 - (_bbox_check - y);
						_y_speed = 0; //Enclose this, or you'll bonk your head on platforms
						break;
					}
				}
			}
		}
	
		//If no collision was detected, then we apply our speed as normal (we also apply it as normal if a collision was detected, but we set it to 0 when we snapped position)
		y += _y_speed;
	}
#endregion

	return [_x_speed,_y_speed];



}
