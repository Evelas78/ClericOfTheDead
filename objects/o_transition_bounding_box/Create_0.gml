bool_Activated = false;

method_TransitionEndScripts = 
{	
	method_close : method(self, function(){
		room_goto(r_TargetRoom);
		if(bool_MoveImmediately)
			global.bool_InTransition = false;
			
		lift_transition();
	}),
	method_open : method(self, function(){
		global.bool_InTransition = false;
	})
}

specialarr_Transition = [];  

specialarr_Transition[int_transition_array.CLOSE][int_transition_array.TRANSITION_TYPE] = int_TargetCloseTransition_Type;
specialarr_Transition[int_transition_array.CLOSE][int_transition_array.TRANSITION_TT] = float_TargetClose_TT;
specialarr_Transition[int_transition_array.CLOSE][int_transition_array.END_SCRIPT] = method_TransitionEndScripts.method_close;

specialarr_Transition[int_transition_array.OPEN][int_transition_array.TRANSITION_TYPE] =int_TargetOpenTransition_Type;
specialarr_Transition[int_transition_array.OPEN][int_transition_array.TRANSITION_TT] = float_TargetOpen_TT;
specialarr_Transition[int_transition_array.OPEN][int_transition_array.END_SCRIPT] = method_TransitionEndScripts.method_open;