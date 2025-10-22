/// @description Get Input, act upon it
if(global.int_GameState == int_game_state.OVERWORLD && !CheckIfPaused())
{
	int_yTo = INT_WORLD_COORDINATE_VERTICAL_CONST * get_vertical_input();
	int_xTo = get_horizontal_input();
	bool_Sprint = get_shift();
}
else if(!global.bool_InTransition)
{
	int_yTo = 0;
	int_xTo = 0;
	bool_Sprint = false;
}

if(global.int_GameState == int_game_state.OVERWORLD && !global.bool_InTransition)
{
	if((int_xTo != 0 || int_yTo != 0) /*&& global.int_GameState == int_game_state.PlayingOverworld*/)
	{
		scrpt_walk(int_xTo, int_yTo, bool_Sprint);
	}
	else
	{
		spr_CurrentSprite = spr_Idle;
		float_SprSpd = 0;
	}
	
	var _o_InteractedWith = noone;
	var _bool_Interact = get_interact();
	
	if(_bool_Interact && !CheckIfPaused())
	{
		//**
			//show_debug_message("INTERACTION PRESSED");
		//**
		switch(direction)
		{
			case 0: //looking right
				//**
					//show_debug_message("Looking Right");
				//**
			
				_o_InteractedWith = collision_rectangle(
				x, 
				y - float_interaction_check.THIN_SIDE/2, 
				x + float_interaction_check.LONG_SIDE, 
				y + float_interaction_check.THIN_SIDE/2, 
				o_interactable_entity,
				false,
				true);
			
				draw_rectangle(			
				x, 
				y - float_interaction_check.THIN_SIDE/2, 
				x + float_interaction_check.LONG_SIDE, 
				y + float_interaction_check.THIN_SIDE/2,
				true
				)
			break;
			case 90: //looking up
				//**
					//show_debug_message("Looking Up");
				//**
			
				_o_InteractedWith = collision_rectangle(
				x-float_interaction_check.THIN_SIDE/2, 
				y, 
				x+float_interaction_check.THIN_SIDE/2, 
				y - float_interaction_check.LONG_SIDE, 
				o_interactable_entity,
				false,
				true);
					
				draw_rectangle(			
				x-float_interaction_check.THIN_SIDE/2, 
				y, 
				x+float_interaction_check.THIN_SIDE/2, 
				y - float_interaction_check.LONG_SIDE, 
				true
				)
			break;
			case 180: //looking left
				//**
					//show_debug_message("Looking Left");
				//**
			
				_o_InteractedWith = collision_rectangle(
				x, 
				y - float_interaction_check.THIN_SIDE/2, 
				x - float_interaction_check.LONG_SIDE, 
				y + float_interaction_check.THIN_SIDE/2, 
				o_interactable_entity,
				false,
				true)
			
				draw_rectangle(				
				x, 
				y - float_interaction_check.THIN_SIDE/2, 
				x - float_interaction_check.LONG_SIDE, 
				y + float_interaction_check.THIN_SIDE/2, 
				true
				)
			break;
			case 270: //looking down
				//**
					//show_debug_message("Looking Down");
				//**
			
				_o_InteractedWith = collision_rectangle(
				x - float_interaction_check.THIN_SIDE/2, 
				y, 
				x + float_interaction_check.THIN_SIDE/2, 
				y + float_interaction_check.LONG_SIDE, 
				o_interactable_entity,
				false,
				true)
			
				draw_rectangle(				
				x - float_interaction_check.THIN_SIDE/2, 
				y, 
				x + float_interaction_check.THIN_SIDE/2, 
				y + float_interaction_check.LONG_SIDE, 
				true
				)
			break;
			default:
				show_error("Invalid Direction for interaction on o_character", true)
		}
	
		if(_o_InteractedWith != noone) //found something
		{
			with(_o_InteractedWith)
			{
				if(bool_CanInteract)
				{
					if(is_callable(specialarr_Interaction[int_ActiveInteraction]))
					{
						method_call(specialarr_Interaction[int_ActiveInteraction]);
					}
				}
			}
		}
	}
}

if(global.bool_InTransition)
{
	if((int_xTo != 0 || int_yTo != 0) /*&& global.int_GameState == int_game_state.PlayingOverworld*/)
	{
		scrpt_walk(int_xTo, int_yTo, bool_Sprint);
	}
}

runDirectionalAnimation(direction, spr_CurrentSprite, float_SprSpd, true);