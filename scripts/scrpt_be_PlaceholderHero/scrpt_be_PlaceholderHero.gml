#macro float_HardValues_PlaceholderHero_General_HITBOX_FACTOR 0.8
#macro float_HardValues_PlaceholderHero_General_HURTBOX_FACTOR 0.2

#macro int_HardValues_PlaceholderHero_Headbutt_MOVEMENT_SPEED 240
#macro int_HardValues_PlaceholderHero_Headbutt_TOTAL_TARGETS 1
#macro int_HardValues_PlaceholderHero_Headbutt_TARGET_NULL false

function AttackMove_PlaceholderHero_Headbutt(){
	show_debug_message("Did Headbutt for Placeholder Hero");
	switch(int_MovePhase)
	{
		case 0: //Set up hurtboxes and stuff 
			make_Hurtbox(
				(bbox_right - bbox_left) * float_HardValues_PlaceholderHero_General_HURTBOX_FACTOR, 
				(bbox_bottom - bbox_top) * float_HardValues_PlaceholderHero_General_HURTBOX_FACTOR,
				(bbox_right - bbox_left)/2 - o_DamageHurtbox.float_Width/2,
				-((bbox_bottom - bbox_top)/2)
			);
			
			int_MovePhase = 1;
		break;
		case 1: //Choose target

		case 2:
			x += (int_HardValues_PlaceholderHero_Headbutt_MOVEMENT_SPEED / global.int_GameSpeed);
			var _bool_HittingEnemy = false;
		break;
		
	}
	
	show_debug_message(bbox_right - bbox_left);
	o_DamageHurtbox.float_xOffset = (bbox_right - bbox_left)/2 - o_DamageHurtbox.float_Width/2;
	
	
	
	end_character_turn();
}

function AttackMove_PlaceholderHero_Godspeed(){
	show_debug_message("Did Godspeed for Placeholder Hero");
	
	end_character_turn();
}

function AttackMove_PlaceholderHero_Suplex(){
	show_debug_message("Did Suplex for Placeholder Hero");
	
	end_character_turn()
}

function AttackMove_PlaceholderHero_NonExistent(){
	show_error("This move shouldn't be playable, there is a mistake, Played by: " + _Current_Owner, true);
}