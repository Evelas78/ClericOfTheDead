// Inherit the parent event
event_inherited();
arr_struct_MovesCompendium[int_Moves.BASIC_ONE] = {
			str_Name: "Headbutt",
			str_Description: "Approach your target and slam your head into them",
			method_Move: AttackMove_PlaceholderHero_Headbutt,
			spr_CurrentSprite: spr_placeholder_orange,
			int_TurnCooldown: 0,
			int_CurrentCooldown: 0,
			int_ElystCost: 0,
			int_Identifier: int_Moves.BASIC_ONE,
			int_TotalUses: 0,
			int_NumberOfTargets: 1,
			int_TypeOfTarget: int_TypeOfTargeting.ENEMY_SELECTIVE,
			bool_NullSelectable: false
		}
arr_struct_MovesCompendium[int_Moves.BASIC_TWO] = {
			str_Name: "Non existent ability",
			str_Description: "If you see this ability, that means i messed up",
			method_Move: AttackMove_PlaceholderHero_NonExistent,
			spr_CurrentSprite: spr_placeholder_orange,
			int_TurnCooldown: 0,
			int_CurrentCooldown: 0,
			int_ElystCost: 0,
			int_Identifier: int_Moves.BASIC_TWO,
			int_TotalUses: 0,
			int_NumberOfTargets: 0,
			int_TypeOfTarget: int_TypeOfTargeting.ALLY_PARTY
		}	
arr_struct_MovesCompendium[int_Moves.ABILITY_ONE] = {
			str_Name: "Suplex",
			str_Description: "Grab your target, slowing them down for a turn, then slam them",
			method_Move: AttackMove_PlaceholderHero_Suplex,
			spr_CurrentSprite: spr_placeholder_blue,
			int_TurnCooldown: 3,
			int_CurrentCooldown: 3, 
			int_ElystCost: 20,
			int_Identifier: int_Moves.ABILITY_ONE,
			int_TotalUses: 0,
			int_NumberOfTargets: 1,
			int_TypeOfTarget: int_TypeOfTargeting.ENEMY_SELECTIVE
		}		
arr_struct_MovesCompendium[int_Moves.ULTIMATE] = {
			str_Name: "Godspeed",
			str_Description: "Take 3 extra turns in rapid succession",
			method_Move: AttackMove_PlaceholderHero_Godspeed,
			spr_CurrentSprite: spr_placeholder_blue,
			int_TurnCooldown: 6,
			int_CurrentCooldown: 6,
			int_ElystCost: 100,
			int_Identifier: int_Moves.ULTIMATE,
			int_TotalUses: 0,
			int_NumberOfTargets: 1,
			int_TypeOfTarget: int_TypeOfTargeting.ALLY_SELF
		}
/*
make_Hitbox(
	(bbox_right - bbox_left) * float_HardValues_PlaceholderHero_General_HITBOX_FACTOR, 
	(bbox_bottom - bbox_top) * float_HardValues_PlaceholderHero_General_HITBOX_FACTOR,
	0,
	-((bbox_bottom - bbox_top)/2)
);

make_Hurtbox(
	(bbox_right - bbox_left) * float_HardValues_PlaceholderHero_General_HURTBOX_FACTOR, 
	(bbox_bottom - bbox_top) * float_HardValues_PlaceholderHero_General_HURTBOX_FACTOR,
	0,
	-((bbox_bottom - bbox_top)/2)
);*/
