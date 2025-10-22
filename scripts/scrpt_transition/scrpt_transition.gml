function reset_transition_ctrl(){
	end_close_transition();
	end_open_transition();
	bool_LiftTransition = false;
}

function end_close_transition()
{
	with(global.o_ctrl_Transition)
	{
		int_CurrentCloseTransition = -1;
		float_CurrentCloseTransition_TT= -1
		method_CloseEndScript = -1; 
		float_CurrentTime = -1;
	}
}

function lift_transition()
{
	with(global.o_ctrl_Transition)
	{
		bool_LiftTransition = true;	
	}
}

function end_open_transition()
{
	with(global.o_ctrl_Transition)
	{
		int_CurrentOpenTransition = -1;
		float_CurrentOpenTransition_TT = -1;
		method_OpenEndScript = -1;
		float_CurrentTime = -1;
		bool_LiftTransition = false;
	}
}

function update_transitions(_specialarr_Transition){
	if(!instance_exists(global.o_ctrl_Transition))
		show_error("GLOBAL o_Transition_Controller doesn't exist", true);

	with(global.o_ctrl_Transition)
	{
		int_CurrentCloseTransition = _specialarr_Transition[int_transition_array.CLOSE][int_transition_array.TRANSITION_TYPE];
		float_CurrentCloseTransition_TT = _specialarr_Transition[int_transition_array.CLOSE][int_transition_array.TRANSITION_TT];
		method_CloseEndScript = _specialarr_Transition[int_transition_array.CLOSE][int_transition_array.END_SCRIPT];
		
		int_CurrentOpenTransition = _specialarr_Transition[int_transition_array.OPEN][int_transition_array.TRANSITION_TYPE];
		float_CurrentOpenTransition_TT = _specialarr_Transition[int_transition_array.OPEN][int_transition_array.TRANSITION_TT];
		method_OpenEndScript = _specialarr_Transition[int_transition_array.OPEN][int_transition_array.END_SCRIPT];
		global.bool_InTransition = true;
	}
}

function update_timer(_float_TargetTimer)
{
	if(float_CurrentTime == -1) //Not set
		float_CurrentTime = 0;
	else if(float_CurrentTime < _float_TargetTimer) //Timer is still ticking
		float_CurrentTime += 1/global.int_GameSpeed;
	else //Timer finished
		float_CurrentTime = _float_TargetTimer;
}

function run_transition(_int_transition_type, _float_CurrentTime, _float_tt)
{
	switch(_int_transition_type)
	{
		case int_transition_type.TRANS_CLOSE_BLINK_FADE:
			close_blink_fade(_float_CurrentTime, _float_tt);
			break;
		case int_transition_type.TRANS_OPEN_BLINK_FADE:
			open_blink_fade(_float_CurrentTime, _float_tt)
			break;
	}	
}

function close_blink_fade(_float_CurrentTime, _float_tt)
{
	var _float_completion_ratio = _float_CurrentTime/_float_tt;
	var _float_current_prog = lerp(0, 5 * pi, _float_completion_ratio);
	
	draw_set_color(c_black);
	draw_set_alpha(abs(cos(_float_current_prog)));
	draw_rectangle(0, 0, INT_VIEWPORT_DEFAULT_W, INT_VIEWPORT_DEFAULT_H, false);
	draw_set_alpha(1);
}

function open_blink_fade(_float_CurrentTime, _float_tt)
{
	var _float_completion_ratio = _float_CurrentTime/_float_tt;
	var _float_current_prog = lerp(0, 5 * pi, _float_completion_ratio);
	
	draw_set_color(c_black);
	draw_set_alpha(abs(cos(_float_current_prog)));
	draw_rectangle(0, 0, INT_VIEWPORT_DEFAULT_W, INT_VIEWPORT_DEFAULT_H, false);
	draw_set_alpha(1);
}