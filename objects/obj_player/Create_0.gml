#region Camera
obj_camera.state_ = CAM_MODE.targeted;
obj_camera.target_ = id;
#endregion

#region Enums
enum PLAYER_STATES {
	move			= 0,
	move_shoot		= 1,
	climb			= 2,
	climb_shoot		= 3,
	jump			= 4,
	jump_shoot		= 5,
	damaged			= 6,
	teleporting_out = 7,
	swap_weapon		= 8,
	death			= 9
}

enum WEAPONS {
	buster,
	atomic_fire1,
	atomic_fire2,
	atomic_fire3,
	atomic_fire4,
	air_shooter,
	leaf_shield,
	bubble_lead,
	quick_boomerang,
	timer_stopper,
	metal_blade,
	crash_bomber,
	special1,
	special2,
	special3
}
#endregion

#region Animation
image_speed =				0;
animation_speed_ =			0.5;
direction_facing_ =			DIR4.right;
state_ =					PLAYER_STATES.move;
iframes_ =					false;
iframe_time_ =				SEC * 1.5;
iframe_timer_ =				-1;
damage_flash_speed_ =		12;
manual_sprite_change_ =		false;
animation_timer_ =			0;
blink_ =					false;
current_room_ =				noone;
new_room_ =					noone;
previous_state_	=			noone;
climb_counter_ =			0;
weapon_ =					WEAPONS.buster;
last_damager_ =				noone;
invincible_ =				false;
#endregion

#region Movement Variables
//As usual, all these numbers are approximations
//Movement
y_fraction_ =		0;
x_fraction_ =		0;
x_input_ =			0;
y_input_ =			0;

//Acceleration
accel_ =			0.5;

//Frictions
friction_ =			0.15;
air_friction_ =		1.0;
gravity_ =			0.25;

//Max Speeds
jump_speed_ =		-5.9;
max_speed_ =		1.5;
fall_speed_	=		8.0;
climb_speed_ =		1.0;

//Speeds
x_speed_ =			0;
y_speed_ =			0;

//Collisions
tilemap_ =			layer_tilemap_get_id("Collisions");
on_ground_ =		false;
#endregion

#region Sprite look-up tables
//Move
sprite_[PLAYER_STATES.move,DIR4.right]					= spr_mega_man_run;
sprite_[PLAYER_STATES.move,DIR4.up]						= spr_mega_man_run;
sprite_[PLAYER_STATES.move,DIR4.left]					= spr_mega_man_run;
sprite_[PLAYER_STATES.move,DIR4.down]					= spr_mega_man_run;

//Shoot Move
sprite_[PLAYER_STATES.move_shoot,DIR4.right]			= spr_mega_man_shoot_run;
sprite_[PLAYER_STATES.move_shoot,DIR4.up]				= spr_mega_man_shoot_run;
sprite_[PLAYER_STATES.move_shoot,DIR4.left]				= spr_mega_man_shoot_run;
sprite_[PLAYER_STATES.move_shoot,DIR4.down]				= spr_mega_man_shoot_run;

//Climb
sprite_[PLAYER_STATES.climb,DIR4.right]					= spr_mega_man_climb;
sprite_[PLAYER_STATES.climb,DIR4.up]					= spr_mega_man_climb;
sprite_[PLAYER_STATES.climb,DIR4.left]					= spr_mega_man_climb;
sprite_[PLAYER_STATES.climb,DIR4.down]					= spr_mega_man_climb;

//Climb Shoot
sprite_[PLAYER_STATES.climb_shoot,DIR4.right]			= spr_mega_man_shoot_climb;
sprite_[PLAYER_STATES.climb_shoot,DIR4.up]				= spr_mega_man_shoot_climb;
sprite_[PLAYER_STATES.climb_shoot,DIR4.left]			= spr_mega_man_shoot_climb;
sprite_[PLAYER_STATES.climb_shoot,DIR4.down]			= spr_mega_man_shoot_climb;

//Jump
sprite_[PLAYER_STATES.jump,DIR4.right]					= spr_mega_man_jump;
sprite_[PLAYER_STATES.jump,DIR4.up]						= spr_mega_man_jump;
sprite_[PLAYER_STATES.jump,DIR4.left]					= spr_mega_man_jump;
sprite_[PLAYER_STATES.jump,DIR4.down]					= spr_mega_man_jump;

//Jump Shoot
sprite_[PLAYER_STATES.jump_shoot,DIR4.right]			= spr_mega_man_shoot_jump;
sprite_[PLAYER_STATES.jump_shoot,DIR4.up]				= spr_mega_man_shoot_jump;
sprite_[PLAYER_STATES.jump_shoot,DIR4.left]				= spr_mega_man_shoot_jump;
sprite_[PLAYER_STATES.jump_shoot,DIR4.down]				= spr_mega_man_shoot_jump;

//Hurt
sprite_[PLAYER_STATES.damaged,DIR4.right]				= spr_mega_man_damaged;
sprite_[PLAYER_STATES.damaged,DIR4.up]					= spr_mega_man_damaged;
sprite_[PLAYER_STATES.damaged,DIR4.left]				= spr_mega_man_damaged;
sprite_[PLAYER_STATES.damaged,DIR4.down]				= spr_mega_man_damaged;
	
//Teleporting
sprite_[PLAYER_STATES.teleporting_out,DIR4.right]		= spr_mega_man_teleporting;
sprite_[PLAYER_STATES.teleporting_out,DIR4.up]			= spr_mega_man_teleporting;
sprite_[PLAYER_STATES.teleporting_out,DIR4.left]		= spr_mega_man_teleporting;
sprite_[PLAYER_STATES.teleporting_out,DIR4.down]		= spr_mega_man_teleporting;

//Weapon Swapping
sprite_[PLAYER_STATES.swap_weapon,DIR4.right]			= spr_mega_man_teleporting;
sprite_[PLAYER_STATES.swap_weapon,DIR4.up]				= spr_mega_man_teleporting;
sprite_[PLAYER_STATES.swap_weapon,DIR4.left]			= spr_mega_man_teleporting;
sprite_[PLAYER_STATES.swap_weapon,DIR4.down]			= spr_mega_man_teleporting;

//Death
sprite_[PLAYER_STATES.death,DIR4.right]					= noone;
sprite_[PLAYER_STATES.death,DIR4.up]					= noone;
sprite_[PLAYER_STATES.death,DIR4.left]					= noone;
sprite_[PLAYER_STATES.death,DIR4.down]					= noone;

#endregion