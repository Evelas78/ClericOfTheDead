if(global.int_GameState == int_game_state.BATTLE)
{
	if(global.int_BattleState == int_battle_state.BATTLE_INITIALIZE && !bool_DoneInitializing)
	{
		initialize_battle();
		bool_DoneInitializing = true;
	}
	else if(global.int_BattleState == int_battle_state.BATTLE_PLAYER_PREPARE)
	{
		//
			//show_debug_message("Current Player Prep Time: " + string(float_PlayerPrepare_Timer));
		//
		
		
		if(float_PlayerPrepare_Timer <= FLOAT_BATTLE_PLAYER_PREPARE_TIMER)
		{
			player_prepare_battle();
		}
		else
		{
			player_control_start_battle();	
		}
		
	}
	else if(global.int_BattleState == int_battle_state.BATTLE_PLAYING)
	{

		if(bool_LoadTurnOrder)
		{
			load_turn_order_queue();
			bool_LoadTurnOrder = false;
		}
			
		if(ds_queue_size(queue_TurnOrder) > 0)
		{
			if(global.o_be_CurrentCharacter == -1)
				set_up_new_current_turn();
	
			if(int_TargetingType != INT_NONE)
				targeting_switch_controller();
			
			if(global.o_be_CurrentCharacter.bool_CompletedTurn)
				clear_current_turn();
		}
		else
		{
			bool_LoadTurnOrder = true;
			countdown_turns(INT_BATTLE_DEFAULT_TURN_COUNTDOWN);
		}
		
	}
	else if(global.int_BattleState == int_battle_state.BATTLE_ENDING)
	{
	
	}
}