function get_target(_bool_Hero, _int_TargetSelector)
{
	if(_bool_Hero)
		return arr_o_HeroBattle[_int_TargetSelector];
	return arr_o_EnemyBattle[_int_TargetSelector / 10][_int_TargetSelector % 10];
}

function remove_target()
{
	var _o_CurrentRemoved = ds_stack_pop(stack_Targets);
	
	_o_CurrentRemoved.bool_Targeted = false;
	_o_CurrentRemoved.bool_CanTarget = true;
	
}
function add_target(_o_CurrentSelected)
{
	_o_CurrentSelected.bool_Considered = false;
	_o_CurrentSelected.bool_Targeted = true;
	_o_CurrentSelected.bool_CanTarget = false;
	
	ds_stack_push(stack_Targets, _o_CurrentSelected);
}
function cancel_move()
{
	reset_battle_controller();
	ds_stack_clear(stack_Targets);
}
function confirm_move()
{
	global.o_be_CurrentCharacter.int_ActiveMove = struct_TargetMove.int_Identifier;
	
	while(ds_stack_empty(stack_Targets))
	{
		var _o_be_Current = ds_stack_pop(stack_Targets);
		array_push(global.o_be_CurrentCharacter.arr_o_Targets, _o_be_Current);
	}
	
	close_menu(INT_CLEAR_MENU);
	
	reset_battle_controller();
}

function verify_target(_o_Target, _bool_NullSelectable)
{
	if(_o_Target == -1)
	{
		if(!_bool_NullSelectable)
			return false;
		return true;
	}
	
	if(_o_Target.bool_CanTarget)
		return true;
	return false;
}
