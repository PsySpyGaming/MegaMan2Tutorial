///@func move_with_object_collisions(collision_object,x_speed,y_speed)
///@desc Detects collision objects and moves/doesn't as you need them to, also returns a new x/y speed if needed for animation and such
///@arg collision_object
///@arg x_speed
///@arg y_speed
function move_with_object_collisions(argument0, argument1, argument2) {
	var _obj = argument0;
	var _x_speed = argument1;
	var _y_speed = argument2;

#region Horizontal Collisions
	//Snug me up to the collision object
	if(place_meeting(x + _x_speed,y,_obj))
	{
		while(!place_meeting(x + sign(_x_speed),y,_obj))
			x += sign(_x_speed);
	
		_x_speed = 0;
	}

	//Simply comment out the x/y += to do object collision checking only, and let the tile movement code actually do the moving
	//x += _x_speed;
#endregion

#region Vertical Collisions
	if(place_meeting(x,y + _y_speed,_obj))
	{
		while(!place_meeting(x,y + sign(_y_speed),_obj))
			y += sign(_y_speed);
	
		_y_speed = 0;
	}

	//y += _y_speed;
#endregion

#region Ledge check
	//Only need to ledge check if we're moving in both x and y
	//Sacrifice x_speed if we're moving up, sacrifice y_speed if we're moving down, this is kind of a preference option
	//Sacrificing x_speed while going up means you'll slide up along something, and y_speed while going down meaning you'll move along the top of something
	//Which makes for better ledge grabbing and ledge landing
	if(_y_speed > 0) //Going down
	{
		//Found a ledge!
		if(place_meeting(x + _x_speed,y + _y_speed,_obj))
		{
			while(!place_meeting(x + sign(_x_speed),y,_obj))
			{
				x += sign(_x_speed);
				_x_speed -= sign(_x_speed);
				if(_x_speed == 0)
					break;
			}
			_x_speed = 0;
			while(!place_meeting(x,y + sign(_y_speed),_obj))
			{
				y += sign(_y_speed);
				_y_speed -= sign(_y_speed);
				if(_y_speed == 0)
					break;
			}
			_y_speed = 0;
		}
	}
	else if(_y_speed < 0) //Going up
	{
		if(place_meeting(x + _x_speed,y + _y_speed,_obj))
		{
			//Reverse it
			while(!place_meeting(x,y + sign(_y_speed),_obj))
			{
				y += sign(_y_speed);
				_y_speed -= sign(_y_speed);
				if(_y_speed == 0)
					break;
			}
			_y_speed = 0;
			while(!place_meeting(x + sign(_x_speed),y,_obj))
			{
				x += sign(_x_speed);
				_x_speed -= sign(_x_speed);
				if(_x_speed == 0)
					break;
			}
			_x_speed = 0;
		}
	}
#endregion

	return [_x_speed,_y_speed];



}
