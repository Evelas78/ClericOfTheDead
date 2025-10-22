enum float_HardValues_PlaceholderEnemy
{
	MOVE_DIFFERENCE = 2,
	PHASE_TWO_THRESHOLD = .3,
	GUARD_THRESHOLD = .9,
	HEAVY_ELYST = .9,
	GOOD_ELYST = .5,
	BASIC_BONUS = 3,
	GUARD_BONUS = 1,
	ULTIMATE_BONUS = 4,
	PHASE_ONE_BASE_TACKLE = 1,
	PHASE_ONE_BASE_SHOOT = 1,
	PHASE_ONE_BASE_RAISE_GUARD = 1,
	PHASE_ONE_BASE_EXPONENTIAL_GROWTH = 1,
	PHASE_TWO_BASE_TACKLE = 3,
	PHASE_TWO_BASE_SHOOT = 6,
	PHASE_TWO_BASE_RAISE_GUARD = 1,
	PHASE_TWO_BASE_EXPONENTIAL_GROWTH = 5,
}

function AttackMove_PlaceholderEnemy_Tackle(){

}

function AttackMove_PlaceholderEnemy_Shoot(){

}

function AttackMove_PlaceholderEnemy_RaiseGuard(){

}

function AttackMove_PlaceholderEnemy_ExponentialGrowth(){

}
function PlaceholderEnemy_BattleEntityLogic()
{
	var _int_tCurrentElyst = int_tCurrentElyst;
	var _int_tMaxElyst = _int_tMaxElyst;
	var _int_tHP = int_tHP;
	var _int_tMaxHP = int_tMaxHP;

	if(_int_tHP/_int_tMaxHP <= float_HardValues_PlaceholderEnemy.PHASE_TWO_THRESHOLD) //Phase two threshold
		int_tPhase = 2;
		
	var _int_tPhase = int_tPhase;
	
	var _float_TackleChanceWeight = -1;
	var _float_ShootChanceWeight = -1;
	var _float_RaiseGuardChanceWeight = -1;
	var _float_ExponentialGrowthChanceWeight = -1;
	
	var _int_ElystNeed_Tackle = arr_struct_MovesCompendium[int_Moves.BASIC_ONE].int_ElystCost;
	var _int_ElystNeed_Shoot = arr_struct_MovesCompendium[int_Moves.BASIC_TWO].int_ElystCost;
	var _int_ElystNeed_RaiseGuard = arr_struct_MovesCompendium[int_Moves.ABILITY_ONE].int_ElystCost;
	var _int_ElystNeed_ExponentialGrowth = arr_struct_MovesCompendium[int_Moves.ULTIMATE].int_ElystCost;
	
	var _int_CurrentCooldown_Tackle = arr_struct_MovesCompendium[int_Moves.BASIC_ONE].int_CurrentCooldown;
	var _int_CurrentCooldown_Shoot = arr_struct_MovesCompendium[int_Moves.BASIC_TWO].int_CurrentCooldown;
	var _int_CurrentCooldown_RaiseGuard = arr_struct_MovesCompendium[int_Moves.ABILITY_ONE].int_CurrentCooldown;
	var _int_CurrentCooldown_ExponentialGrowth = arr_struct_MovesCompendium[int_Moves.ULTIMATE].int_CurrentCooldown;
	
	if(_int_tPhase == 1) //We want to randomly choose an attaack
	{
		_float_TackleChanceWeight = 1;
		_float_ShootChanceWeight = 1;
		_float_RaiseGuardChanceWeight = 1;
		_float_ExponentialGrowthChanceWeight = 1;
		
		if(arr_struct_MovesCompendium[int_Moves.BASIC_ONE].int_TotalUses <= arr_struct_MovesCompendium[int_Moves.BASIC_TWO].int_TotalUses - float_HardValues_PlaceholderEnemy.MOVE_DIFFERENCE)
			_float_TackleChanceWeight += float_HardValues_PlaceholderEnemy.BASIC_BONUS;
		else if(arr_struct_MovesCompendium[int_Moves.BASIC_TWO].int_TotalUses <= arr_struct_MovesCompendium[int_Moves.BASIC_ONE].int_TotalUses - float_HardValues_PlaceholderEnemy.MOVE_DIFFERENCE)
			_float_ShootChanceWeight += float_HardValues_PlaceholderEnemy.BASIC_BONUS;
			
		if(_int_tCurrentElyst/_int_tMaxElyst > float_HardValues_PlaceholderEnemy.GOOD_ELYST)
		{
			if(_int_tHP/_int_tMaxHP < float_HardValues_PlaceholderEnemy.GUARD_THRESHOLD)
				_float_RaiseGuardChanceWeight += float_HardValues_PlaceholderEnemy.GUARD_BONUS;
			
			if(_int_tCurrentElyst/_int_tMaxElyst > float_HardValues_PlaceholderEnemy.HEAVY_ELYST)
				_float_ExponentialGrowthChanceWeight += float_HardValues_PlaceholderEnemy.ULTIMATE_BONUS;
		}
	}
	else //We want to specifically start targetting weaker enemies and start using our ult if possible. 
	{
		_float_TackleChanceWeight = 3;
		_float_ShootChanceWeight = 6;
		_float_RaiseGuardChanceWeight = 1;
		_float_ExponentialGrowthChanceWeight = 5;
		
		if(arr_struct_MovesCompendium[int_Moves.BASIC_ONE].int_TotalUses <= arr_struct_MovesCompendium[int_Moves.BASIC_TWO].int_TotalUses - float_HardValues_PlaceholderEnemy.MOVE_DIFFERENCE)
			_float_TackleChanceWeight += float_HardValues_PlaceholderEnemy.BASIC_BONUS;
		else if(arr_struct_MovesCompendium[int_Moves.BASIC_TWO].int_TotalUses <= arr_struct_MovesCompendium[int_Moves.BASIC_ONE].int_TotalUses - float_HardValues_PlaceholderEnemy.MOVE_DIFFERENCE)
			_float_ShootChanceWeight += float_HardValues_PlaceholderEnemy.BASIC_BONUS;
			
		if(_int_tCurrentElyst/_int_tMaxElyst > float_HardValues_PlaceholderEnemy.GOOD_ELYST)
		{
			_float_ExponentialGrowthChanceWeight += float_HardValues_PlaceholderEnemy.ULTIMATE_BONUS;
			
			if(_int_tCurrentElyst/_int_tMaxElyst > .9)
				_float_ExponentialGrowthChanceWeight += float_HardValues_PlaceholderEnemy.ULTIMATE_BONUS;
		}
		
	}
	//Must check elyst before loading moves in the placeholderenemy stuff, see if we can make a generalized function
	
	
	
	var _float_TotalWeights = load_moves(queue_PossibleMoves, queue_PossibleMoves_Weights, 
	[int_Moves.BASIC_ONE, _float_TackleChanceWeight, confirm_usability(_int_ElystNeed_Tackle, _int_CurrentCooldown_Tackle)],
	[int_Moves.BASIC_TWO, _float_ShootChanceWeight, confirm_usability(_int_ElystNeed_Shoot, _int_CurrentCooldown_Shoot)],
	[int_Moves.ABILITY_ONE, _float_RaiseGuardChanceWeight, confirm_usability(_int_ElystNeed_RaiseGuard, _int_CurrentCooldown_RaiseGuard)],
	[int_Moves.ULTIMATE, _float_ExponentialGrowthChanceWeight, confirm_usability(_int_ElystNeed_ExponentialGrowth, _int_CurrentCooldown_ExponentialGrowth)]);
	
	int_SelectedMove = decide_move(_float_TotalWeights);
	reset_possible_moves_queue();
}
