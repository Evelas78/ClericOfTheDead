/// @description Create Globals/Controllers for Game Running

//For character
global.o_MainCharacter = -1;

global.bool_InMenu = false;
global.bool_InTransition = false;
global.bool_InDialogue = false;

global.sf_Dialogue = -1;
global.sf_Transition = -1;
global.sf_Menu = -1;

global.tl_CollisionLayer = -1;

global.int_Viewport_W = view_wport[0];
global.int_Viewport_H = view_hport[0];

if(game_get_speed(gamespeed_fps) != 60)
	game_set_speed(60, gamespeed_fps);
	
global.int_GameSpeed = 60;

//Game State intialization
//For now, we keep playing overworld UNTIL we make the title screen
global.int_GameState = int_game_state.OVERWORLD;


global.int_Volume = 5;

//Controller Creation
global.o_ctrl_Camera = instance_create_layer(0,0, STR_PERSISTENT_LAYER, o_ctrl_camera);
global.o_ctrl_Dialogue = instance_create_layer(0,0, STR_PERSISTENT_LAYER, o_ctrl_dialogue);
global.o_ctrl_Transition = instance_create_layer(0,0, STR_PERSISTENT_LAYER, o_ctrl_transition);
global.o_ctrl_Battle = instance_create_layer(0,0, STR_PERSISTENT_LAYER, o_ctrl_battle);
global.o_ctrl_Menu = instance_create_layer(0,0, STR_PERSISTENT_LAYER, o_ctrl_menu);
global.o_ctrl_Sound = instance_create_layer(0,0, STR_PERSISTENT_LAYER, o_ctrl_sound);

global.o_Inventory = [];