if(!bool_Activated)
{
	global.bool_InTransition = true;
	update_transitions(specialarr_Transition);
	bool_Activated = true;
}