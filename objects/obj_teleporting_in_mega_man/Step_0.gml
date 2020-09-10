#region Collisions and Movement
//Calculate movement
//We're just going down for this, no need for input
y_speed_ = 8;

//Apply collision checks, then move
//This is a large cunk of code that can be applied to many objects, so I'm putting it in a script
var _speed;
//No object collision checking because we'll only hit tiles with this
_speed = move_with_tile_collisions(tilemap_,x_speed_,y_speed_);
x_speed_ = _speed[0];
y_speed_ = _speed[1];
#endregion

var _p;
_p = tilemap_get_at_pixel(tilemap_,bbox_left,bbox_bottom+1);
on_ground_ = (_p == 1) && (y_speed_ == 0);

if(on_ground_) {
	if(y-ystart < 90) {
		on_ground_ = false;
		y += 8;
		exit;
	}
	image_speed = 1;
	if(animation_hit_frame(3)){
		instance_create_layer(x,y,"Instances",obj_player);
		audio_play_sound(snd_teleporting_in,1,false);
		instance_destroy();
	}
}