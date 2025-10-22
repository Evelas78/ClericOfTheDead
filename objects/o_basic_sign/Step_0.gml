if(int_CharacterState == int_CharacterStates.INTERACT)
{
	runNonDirectionalAnimation(spr_Interact, float_Interact_SprSpd, false)
	if(float_SpriteFrame >= image_number)
	{
		int_CharacterState = int_CharacterStates.IDLE;
	}
}
else if(int_CharacterState == int_CharacterStates.IDLE)
{
	runNonDirectionalAnimation(spr_Idle, float_Idle_SprSpd, true)
}