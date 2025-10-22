///@description Logic for drawing transitions
if(!surface_exists(global.sf_Transition))
	global.sf_Transition = surface_create(INT_VIEWPORT_DEFAULT_W, INT_VIEWPORT_DEFAULT_H );

surface_set_target(global.sf_Transition);
draw_clear_alpha(c_black, 0);

if(int_CurrentCloseTransition != -1) {
	update_timer(float_CurrentCloseTransition_TT); 
	run_transition(int_CurrentCloseTransition, float_CurrentTime, float_CurrentCloseTransition_TT);
	
	if(float_CurrentTime >= float_CurrentCloseTransition_TT && is_callable(method_CloseEndScript)) {
		method_call(method_CloseEndScript);
		end_close_transition();
	}
} 
else if(int_CurrentOpenTransition != -1 && bool_LiftTransition) { //When close transition isn't set
	
	update_timer(float_CurrentOpenTransition_TT);
	run_transition(int_CurrentOpenTransition, float_CurrentTime, float_CurrentOpenTransition_TT);
	
	if(float_CurrentTime >= float_CurrentOpenTransition_TT && is_callable(method_OpenEndScript)) {
		method_call(method_OpenEndScript);
		end_open_transition();
	}
}

surface_reset_target();

var float_scale_x = global.int_Viewport_W / INT_VIEWPORT_DEFAULT_W;
var float_scale_y = global.int_Viewport_H / INT_VIEWPORT_DEFAULT_H ;

draw_surface_ext(global.sf_Transition, 0, 0, float_scale_x, float_scale_y, 0, c_white, 1);

reset_draw_state();