
function handle_enemy_selective_targeting()
{
	var _bool_Interacting = get_interact();
	var _bool_Canceling = get_cancel();
	
	target_control_handler_enemy_side();
	
	var _o_CurrentSelected = get_target(false, int_TargetSelector);
	handle_consider_coloring(_o_CurrentSelected, true);
	
	var _int_StackSize = ds_stack_size(stack_Targets);
	
	//If stack size meets the target requirement
	if(_int_StackSize == struct_TargetMove.int_NumberOfTargets)
	{
		//Draw confirmation box
		
		if(_bool_Interacting)
		{
			_bool_Interacting = false;
			confirm_move();
		}
	}
	
	//If the player is trying to cancel a selection and we already aren't selecting anything, then just go back to move menu
	if(_int_StackSize == 0 && _bool_Canceling)
	{
		cancel_move();
	}
	else if(_bool_Canceling) //Pop out menu
	{
		show_debug_message("Removing Target");
		remove_target();
	}
	else if(_bool_Interacting && verify_target(_o_CurrentSelected, struct_TargetMove.bool_NullSelectable))
	{
		show_debug_message("Selecting Target");
		add_target(_o_CurrentSelected)
	}
}
function handle_enemy_party_targeting()
{
	if(ds_stack_size(stack_Targets) == 0)
		load_all_enemies_into_targets();
	
	if(get_cancel())
		cancel_move();
	if(get_interact())
		confirm_move();
}
function handle_enemy_random_targeting()
{	
	if(!bool_Highlighted)
		highlight_all_enemies_in_target();
		
	if(get_cancel())
		cancel_move();
	if(get_interact())
	{
		while(ds_stack_size(stack_Targets) <= int_TotalTargets)
		{
			load_random_enemy_into_targets();
		}
		
		confirm_move();
	}
}

function handle_ally_selective_targeting()
{
	var _int_StackSize = ds_stack_size(stack_Targets);
	var _o_CurrentSelected = get_target(_bool_Hero);
	
	if(_int_StackSize == int_TotalTargets)
	{
		//Draw something to ask to confirm move
		if(get_interact())
			confirm_move();
	}
				
	if(_int_StackSize == 0 && get_cancel())
		cancel_move();
	else if(get_interact())
		handle_add_to_target_stack();

	target_control_handler_hero_side();
}
function handle_ally_party_targeting()
{
	if(ds_stack_size(stack_Targets) == 0)
		load_all_heroes_into_targets();
	
	if(get_cancel())
		cancel_move();
	if(get_interact())
		confirm_move();
}
function handle_ally_random_targeting()
{	
	if(!bool_Highlighted)
		highlight_all_heroes_in_target();
	
	if(get_cancel())
		cancel_move();
	if(get_interact())
	{
		while(ds_stack_size(stack_Targets) <= int_TotalTargets)
		{
			load_random_hero_into_targets();
		}
		confirm_move();
	}
}


function load_all_heroes_into_targets()
{
	for(var _i = 0; _i < arr_o_HeroBattle; _i++)
	{
		arr_o_HeroBattle[_i].bool_Targeted = true;
		ds_stack_push(stack_Targets, arr_o_HeroBattle[_i]);
	}
}
function load_all_enemies_into_targets()
{
	for(var _i = 0; _i < array_length(arr_o_EnemyBattle); _i++)
	{
		for(var _v = 0; _v < array_length(arr_o_EnemyBattle[_i]); _v++)
		{
			arr_o_EnemyBattle[_i][_v].bool_Targeted = true;
			ds_stack_push(stack_Targets, arr_o_EnemyBattle[_i][_v]);
		}
	}
}
function load_random_hero_into_targets()
{
	var _int_Rand = irandom(array_length(arr_o_HeroBattle) - 1);
	
	show_debug_message("Random generation = " + string(_int_Rand));
	
	while(arr_o_HeroBattle[_int_Rand].bool_CanTarget && !arr_o_HeroBattle[_int_Rand].bool_Targeted)
	{	
		_int_Rand++;
		if(_int_Rand >= array_length(arr_o_HeroBattle) - 1)
			_int_Rand = 0;
	}
	arr_o_HeroBattle[_int_Rand].bool_Targeted = true;
	ds_stack_push(stack_Targets, arr_o_HeroBattle[_int_Rand]);
}
function load_random_enemy_into_targets()
{
	var _int_Rand = irandom(8);
	
	show_debug_message("Random generation = " + string(_int_Rand/3 * 10) + " " + string(_int_Rand % 3));
	
	while(arr_o_EnemyBattle[_int_Rand/3 * 10][_int_Rand % 3].bool_CanTarget && !arr_o_EnemyBattle[_int_Rand/3 * 10][_int_Rand % 3].bool_Targeted)
	{	
		_int_Rand++;
		if(_int_Rand >= 9)
			_int_Rand = 0;
	}
	
	arr_o_EnemyBattle[_int_Rand/3 * 10][_int_Rand % 3].bool_Targeted = true;
	ds_stack_push(stack_Targets, arr_o_EnemyBattle[_int_Rand/3 * 10][_int_Rand % 3]);
}

function highlight_all_heroes_in_target()
{
	for(var _i = 0; _i < arr_o_HeroBattle; _i++)
	{
		arr_o_HeroBattle[_i].bool_Targeted = true;
	}
}
function highlight_all_enemies_in_target()
{
	for(var _i = 0; _i < arr_o_EnemyBattle; _i++)
	{
		for(var _v = 0; _v < arr_o_EnemyBattle[_i]; _v++)
		{
			arr_o_EnemyBattle[_i][_v].bool_Targeted = true;
		}
	}
}

function handle_consider_coloring(_o_CurrentSelected, _bool_Activating)
{
	if(_o_CurrentSelected != -1)
	{
		if(_bool_Activating)
		{
			if(_o_CurrentSelected.bool_CanTarget && !_o_CurrentSelected.bool_Considered)
				_o_CurrentSelected.bool_Considered = true;
		}
		else 
		{
			_o_CurrentSelected.bool_Considered = false;
		}
	}
}