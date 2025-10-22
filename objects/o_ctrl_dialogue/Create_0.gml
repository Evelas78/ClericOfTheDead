/// @description Create GUI surface if it doesnt exist yet
if(!global.int_Viewport_W)
	global.int_Viewport_W = view_wport[0];
if(!global.int_Viewport_H)
	global.int_Viewport_H = view_hport[0];
	
create_fonts();
	
bool_InTextbox= false;
bool_HasChoices = false;

queue_DialogueBox = ds_queue_create();

struct_CurrentDialogueBox = -1;
