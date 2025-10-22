/// @description Draw Dialogue Boxes and Text

var _bool_PressingInteract = get_interact() || get_cancel();
var _int_choice_input = get_vertical_pressed_input();

if(!surface_exists(global.sf_Dialogue))
	global.sf_Dialogue = surface_create(INT_VIEWPORT_DEFAULT_W, INT_VIEWPORT_DEFAULT_H);

surface_set_target(global.sf_Dialogue);
draw_clear_alpha(c_black, 0);

//The most important thing to check is if there is text or not, if its -1, it could mean the array passed in has an error
//We also check if its got choices, since it requires almost completely different logic if it has choices
if(bool_InTextbox && !bool_HasChoices)
	regular_dialoguebox_handler(struct_CurrentDialogueBox, _bool_PressingInteract);
else if(bool_InTextbox) //has choices
	choice_dialoguebox_handler(struct_CurrentDialogueBox, _bool_PressingInteract);
else if(!ds_queue_empty(queue_DialogueBox))
	load_new_dialoguebox();
else if(global.bool_InDialogue)
	global.bool_InDialogue = false;

surface_reset_target();

var _float_ScaleX = global.int_Viewport_W / INT_VIEWPORT_DEFAULT_W;
var _float_ScaleY = global.int_Viewport_H / INT_VIEWPORT_DEFAULT_H ;

draw_surface_ext(global.sf_Dialogue, 0, 0, _float_ScaleX, _float_ScaleY, 0, c_white, 1);

reset_draw_state();