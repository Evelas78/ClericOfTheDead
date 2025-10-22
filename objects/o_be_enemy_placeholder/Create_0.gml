// Inherit the parent event
event_inherited();
arr_int_CurrentMoves = [int_Moves.BASIC_ONE, int_Moves.BASIC_TWO, int_Moves.ABILITY_ONE, int_Moves.ULTIMATE];
arr_struct_MovesCompendium[int_Moves.BASIC_ONE] = {
			str_Name: "Tackle",
			str_Description: "Runs at the target and slams into them",
			method_Move: AttackMove_PlaceholderEnemy_Tackle,
			spr_CurrentSprite: spr_placeholder_orange,
			int_TurnCooldown: 0,
			int_CurrentCooldown: 0,
			int_ElystCost: 0,
			int_Identifier: int_Moves.BASIC_ONE,
			int_TotalUses: 0
		}
arr_struct_MovesCompendium[int_Moves.BASIC_TWO] = {
			str_Name: "Shoot",
			str_Description: "Fire a blocky shot at the target",
			method_Move: AttackMove_PlaceholderEnemy_Shoot,
			spr_CurrentSprite: spr_placeholder_orange,
			int_TurnCooldown: 0,
			int_CurrentCooldown: 0,
			int_ElystCost: 0,
			int_Identifier: int_Moves.BASIC_TWO,
			int_TotalUses: 0
		}	
		arr_struct_MovesCompendium[int_Moves.ABILITY_ONE] = {
			str_Name: "Raise Guard",
			str_Description: "Placeholder Description: Please input actual description and move",
			method_Move: AttackMove_PlaceholderEnemy_RaiseGuard,
			spr_CurrentSprite: spr_placeholder_orange,
			int_TurnCooldown: 3,
			int_CurrentCooldown: 3, 
			int_ElystCost: 30,
			int_Identifier: int_Moves.ABILITY_ONE,
			int_TotalUses: 0
		}		
arr_struct_MovesCompendium[int_Moves.ULTIMATE] = {
			str_Name: "Exponential Growth",
			str_Description: "Grows in size rapidly, hurting anyone in range",
			method_Move: AttackMove_PlaceholderEnemy_ExponentialGrowth,
			spr_CurrentSprite: spr_placeholder_orange,
			int_TurnCooldown: 10,
			int_CurrentCooldown: 10,
			int_ElystCost: 60,
			int_Identifier: int_Moves.ULTIMATE,
			int_TotalUses: 0
		}
