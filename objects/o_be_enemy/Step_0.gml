// Inherit the parent event
event_inherited();

//First if selected, we do some logic
if(bool_tDowned)
	spr_CurrentSprite = spr_downed;
	
	
if(bool_Selected && bool_CompletedRandomTime)
{
	if(int_SelectedMove == -1)
		method_call(method_BattleEntityLogic);
	else 
	{
		
		//We need to feed information to the battle controller while still running the battle entity step
	}
		//We'll set this up when we handle actually designing the attack
}	
	
