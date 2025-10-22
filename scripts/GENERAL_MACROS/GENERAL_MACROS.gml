//Battle Sprites Top Centre

#macro STR_BATTLE_LAYER "Battle_IL"
#macro STR_PERSISTENT_LAYER "Persistent_IL"
#macro STR_HITBOX_LAYER "Hitbox_IL"

#macro INT_TILESIZE 32
#macro INT_VIEWPORT_DEFAULT_W 1600
#macro INT_VIEWPORT_DEFAULT_H 900

enum int_game_state
{
	TITLESCREEN = 0,
	OVERWORLD = 1,
	BATTLE = 2
} 

function CheckIfPaused()
{
	return (global.bool_InMenu || global.bool_InDialogue || global.bool_InTransition);		
}
function reset_draw_state()
{
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_font(fn_placeholder_consolas);
}

function get_vertical_input()
{
	return keyboard_check(global.move_up) - keyboard_check(global.move_down);
}
function get_horizontal_input()
{
	return keyboard_check(global.move_right) - keyboard_check(global.move_left) ;
}

function get_vertical_pressed_input()
{
	return keyboard_check_pressed(global.move_up) - keyboard_check_pressed(global.move_down);
}
function get_horizontal_pressed_input()
{
	return keyboard_check_pressed(global.move_right) - keyboard_check_pressed(global.move_left);
}

function get_shift()
{
	return keyboard_check(vk_shift);
}

function get_interact()
{
	return keyboard_check_pressed(global.interact);
}

function get_cancel()
{
	return keyboard_check_pressed(global.cancel);	
}

function get_pause()
{
	return keyboard_check_pressed(global.pause);
}

enum int_HeroTemplates
{
	PLACEHOLDER = 0	
}

#macro INT_NONE -1
#macro INT_TOTAL_ENEMY_ROWS 3
#macro INT_TOTAL_ENEMY_COLS 3