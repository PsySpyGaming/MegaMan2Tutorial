///@desc Move State

#region States

#endregion

#region Acceleration
if(x_input_ != 0) {	x_speed_ = approach(x_speed_,max_speed_*sign(x_input_),accel_); }
else { x_speed_ = approach(x_speed_,0,friction_) }

y_speed_ = approach(y_speed_,fall_speed_,gravity_);

if((x_input_ != 0) && (abs(x_speed_) < max_speed_)) 
{
	image_speed = 0;
	sprite_index = spr_mega_man_skid;
	manual_sprite_change_ = true;
}

#endregion

#region Speed Fractions
if((y_fraction_ != 0) && on_ground_) { y_fraction_ = 0; }

x_speed_ += x_fraction_;
y_speed_ += y_fraction_;

x_fraction_ = x_speed_ - (floor(abs(x_speed_)) * sign(x_speed_));
x_speed_ -= x_fraction_;
y_fraction_ = y_speed_ - (floor(abs(y_speed_)) * sign(y_speed_));
y_speed_ -= y_fraction_;
#endregion

#region Collisions and Movement
var _speed;
_speed = move_with_object_collisions(par_solid,x_speed_,y_speed_);
x_speed_ = _speed[0];
y_speed_ = _speed[1];
_speed = move_with_tile_collisions(tilemap_,x_speed_,y_speed_);
x_speed_ = _speed[0];
y_speed_ = _speed[1];
#endregion

#region Animation
image_speed = animation_speed_;

if((x_input_ == 0) && (x_speed_ != 0)) {
	image_speed = 0;
	sprite_index = spr_mega_man_skid;
	manual_sprite_change_ = true;
}

if(x_speed_ == 0){
	image_speed = 0;
	manual_sprite_change_ = true;
	sprite_index = spr_mega_man_idle;
	if(animation_timer_ != -1) { animation_timer_ = approach(animation_timer_,-1,1); }
	if(animation_timer_ == -1) { animation_timer_ = SEC * 1.5; }
	if((animation_timer_ == 0) && !blink_) { blink_ = true; animation_timer_ = SEC * 0.15; image_index = 1;}
	else if((animation_timer_ == 0) && blink_) { blink_ = false; }
	if(!blink_) {image_index = 0;}
} else {
	image_xscale = sign(x_speed_);
	animation_timer_ = -1;
	blink_ = false;
}
#endregion