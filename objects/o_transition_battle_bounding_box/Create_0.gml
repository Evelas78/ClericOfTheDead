bool_Activated = false;

arr_o_EnemyBattleArray = [enemy_1, enemy_2, enemy_3, enemy_4, enemy_5, enemy_6, enemy_7, enemy_8]

method_TransitionEndScripts = 
{	
	method_close : method(self, function(){
		room_goto(r_TargetRoom);
		battle_prep_info(arr_o_EnemyBattleArray)
		global.int_GameState = int_game_state.BATTLE;
		global.int_BattleState = int_battle_state.BATTLE_INITIALIZE;
		//Since all battles initialization is in the closed state of a transition, 
		//we just let it be handled in the battle initilization function
	}),
	method_open : method(self, function(){
		global.bool_InTransition = false;
		global.int_BattleState = int_battle_state.BATTLE_PLAYER_PREPARE;
	})
}

specialarr_Transition = [];  

specialarr_Transition[int_transition_array.CLOSE][int_transition_array.TRANSITION_TYPE] = int_TargetCloseTransition_Type;
specialarr_Transition[int_transition_array.CLOSE][int_transition_array.TRANSITION_TT] = float_TargetClose_TT;
specialarr_Transition[int_transition_array.CLOSE][int_transition_array.END_SCRIPT] = method_TransitionEndScripts.method_close;

specialarr_Transition[int_transition_array.OPEN][int_transition_array.TRANSITION_TYPE] = int_TargetOpenTransition_Type;
specialarr_Transition[int_transition_array.OPEN][int_transition_array.TRANSITION_TT] = float_TargetOpen_TT;
specialarr_Transition[int_transition_array.OPEN][int_transition_array.END_SCRIPT] = method_TransitionEndScripts.method_open;
