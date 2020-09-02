/// @description 

//Setup camera
obj_camera.state_ = CAM_MODE.free;
obj_camera.x = 0;
obj_camera.y = room_height - obj_camera.view_height_;

//Start the music

song_ = queue_new_song(mus_introduction, 1, false, SEC);
skip_ = false;

//Dialogue
dialogue_ = [
@"IN THE YEAR OF 200X,

A SUPER ROBOT NAMED MEGAMAN",
@"WAS CREATED, 

DR.LIGHT CREATED MEGAMAN",
@"TO STOP THE EVIL DESIRES

OF DR.WILY.",
@"HOWEVER, AFTER HIS DEFEAT,

DR.WILY CREATED EIGHT",
@"OF HIS OWN ROBOTS

TO COUNTER MEGAMAN.",
];

line_ = 0;
fade_speed_ = 0.005;
wait_duration_ = SEC * 4;
wait_timer_ = -1;
alpha_ = 0;
mode_ = true; // True = moving towards 1