if(global.bool_InMenu && !global.bool_SuppressMenu)
{
	var _int_VerticalKeys = get_vertical_pressed_input();
	var _int_HorizontalKeys = get_horizontal_pressed_input();
	
	var _Current_Menu = array_last(arr_struct_Menus);
	
	//
		//show_debug_message(_Current_Menu);
	//
	
	var _Current_Button = _Current_Menu.arr_struct_Buttons[_Current_Menu.int_CurrentButton]

	if(_int_VerticalKeys != 0) 
	{
		if(_int_VerticalKeys >= 0) //Upwards
		{	
			if(!is_method(_Current_Button.int_Up))
				_Current_Menu.int_CurrentButton = _Current_Button.int_Up;
			else
				method_call(_Current_Button.int_Up);
		}
		else
		{
			if(!is_method(_Current_Button.int_Up))
				_Current_Menu.int_CurrentButton = _Current_Button.int_Down;
			else
				method_call(_Current_Button.int_Down);
		}
		_Current_Button = _Current_Menu.arr_struct_Buttons[_Current_Menu.int_CurrentButton];
	}
	else if(_int_HorizontalKeys != 0)
	{
		if(_int_HorizontalKeys >= 0) //Right
		{
			if(!is_method(_Current_Button.int_Right))
				_Current_Menu.int_CurrentButton = _Current_Button.int_Right;
			else
				method_call(_Current_Button.int_Right);
		}
		else
		{
			if(!is_method(_Current_Button.int_Left))
				_Current_Menu.int_CurrentButton = _Current_Button.int_Left;
			else
				method_call(_Current_Button.int_Left);
		}
		_Current_Button = _Current_Menu.arr_struct_Buttons[_Current_Menu.int_CurrentButton];
	}
	
	var _bool_CanForceClose = _Current_Menu.bool_ForceClose;
	var _bool_PressingInteract = get_interact();
	var _bool_PressingCancel = get_cancel();
	var _bool_PressingMenuOpen = get_pause();
	
	if(_bool_PressingInteract && is_method(_Current_Button.method_SelectionScript))
		method_call(_Current_Button.method_SelectionScript);
		
	if((_bool_PressingCancel || _bool_PressingMenuOpen) && _bool_CanForceClose)	
		close_menu(1);
}
else if(global.int_GameState == int_game_state.OVERWORLD && !CheckIfPaused())
{
	var _bool_PressingMenuOpen = get_pause();
		
	if(_bool_PressingMenuOpen)	
		open_menu(struct_MainMenu);
}