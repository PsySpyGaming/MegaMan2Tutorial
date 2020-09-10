/// @description 

if(sprite_index == spr_mega_man_teleporting) {
	image_speed = 0;
	image_index = 0;
	activate_ = true;
	sound_ = audio_play_sound(snd_teleporting,1,false);
}
if(sprite_index = spr_mega_man_transforming) {
	sprite_index = spr_mega_man_teleporting;
}
