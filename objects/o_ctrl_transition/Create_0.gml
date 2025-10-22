///@description Declare all necessary variables for transition to run
if(!global.int_Viewport_W)
	global.int_Viewport_W = view_wport[0];
if(!global.int_Viewport_H)
	global.int_Viewport_H = view_hport[0];
	
//No need for anymore variables, anymore would be overdoing it
//Close First, Open Second
int_CurrentCloseTransition = -1;
float_CurrentCloseTransition_TT= -1
method_CloseEndScript = function(){}; 
method_CloseEndScript = -1; 

int_CurrentOpenTransition = -1;
float_CurrentOpenTransition_TT = -1;
method_OpenEndScript = function(){};
method_OpenEndScript = -1;

float_CurrentTime = -1;

bool_LiftTransition = false;
