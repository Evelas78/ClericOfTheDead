if(bool_Selected && !bool_DidRandomTime)
{
	float_RandomPauseTimer = generate_random_pause(int_tSpeed);
	bool_DidRandomTime = true;
	turn_progress();
}