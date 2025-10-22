/*
	struct_{TemplateMenu} = 
	{
		bool_ForceClose:
		int_MB_xPos: 
		int_MB_yPos: 
		int_MB_Width:
		int_MB_Height: 
		spr_MenuBox: 
		int_CurrentButton: 
		arr_struct_Buttons: 
		[
			{
			spr_ButtonBox: -1,
			int_BB_RelativeXPos: -1,
			int_BB_RelativeYPos: -1,
			int_BB_Width: -1,
			int_BB_Height: -1,
			arr_int_BB_CurrentEffects: [],
			struct_TextToDraw: 
			{
				int_Text_RelativeXPos: 320,
				int_Text_RelativeYPos: 350,
				int_Text_Width: 640,
				int_Text_yOffset: INT_TEXT_DEFAULT_Y_OFFSET,
				bool_TextPosCentered: true,
				
				str_Text: "Settings",
				fn_TargetFont: global.fn_placeholder_trigger,
				int_xScale: 1.2,
				int_yScale: 1.2,
		
				arr_int_Text_CurrentEffects: [],
				float_TypeSpeed: 60,
	
				arr_str_LinesToPrint: [""],
				int_TotalLines: 1,
				float_CurrentStringWidth: 0,
				arr_str_CurrentWords: string_split_ext("Settings", [" "], true),
				int_TotalWords: array_length(string_split_ext("Settings", [" "], true)),
				int_CurrentWordIndex: 0,
				int_CurrentCharIndex: 1,
				float_NumOfCharsToAdd: 0,
	
				bool_StartTyping: false,
				bool_DoneTyping: false,
				bool_CanSkip: false,
				bool_InstantInteract: false,
				bool_InstantType: true
			},
			arr_int_BB_RegularEffects: [],
			arr_int_BB_SelectedEffects: [],
			arr_int_BB_InteractedEffects: [],
			arr_int_Text_RegularEffects: [],
			arr_int_Text_SelectedEffects: [],
			arr_int_Text_InteractedEffects: [],
			method_SelectionScript: function() { },
			arr_struct_Elements: [],
			specialarr_Info: [],
			int_Down: ,
			int_Up: ,
			int_Left: , 
			int_Right: 
		],
		arr_struct_Elements:
		[
			//USE MACROS TO SAVE POSITIONS. Better storage than doing a struct of structs
			{
				spr_Element: 
				int_CurrentFrame: 
				struct_TextToDraw: 
				{
					int_Text_RelativeXPos: 320,
					int_Text_RelativeYPos: 350,
					int_Text_Width: 640,
					int_Text_yOffset: INT_TEXT_DEFAULT_Y_OFFSET,
					bool_TextPosCentered: true,
				
					str_Text: "Settings",
					fn_TargetFont: global.fn_placeholder_trigger,
					int_xScale: 1.2,
					int_yScale: 1.2,
		
					arr_int_Text_CurrentEffects: [],
					float_TypeSpeed: 60,
	
					arr_str_LinesToPrint: [""],
					int_TotalLines: 1,
					float_CurrentStringWidth: 0,
					arr_str_CurrentWords: string_split_ext("Settings", [" "], true),
					int_TotalWords: array_length(string_split_ext("Settings", [" "], true)),
					int_CurrentWordIndex: 0,
					int_CurrentCharIndex: 1,
					float_NumOfCharsToAdd: 0,
	
					bool_StartTyping: false,
					bool_DoneTyping: false,
					bool_CanSkip: false,
					bool_InstantInteract: false,
					bool_InstantType: true
				},
				bool_ElementPosCentered: 
				int_Element_RelativeXPos: 
				int_Element_RelativeYPos: 
				float_Element_ScaleX: 
				float_Element_ScaleY: 
				arr_int_Effects: []
			}
		],
		specialarr_Info:[]
	}
*/

function set_button_effects(_struct_CurrentButton, _struct_TextToDraw, _bool_Selected, _bool_PressingInteract)
{
	if(_bool_Selected && _bool_PressingInteract)
	{
		_struct_TextToDraw.arr_int_Text_CurrentEffects = _struct_CurrentButton.arr_int_Text_InteractedEffects;
		_struct_CurrentButton.arr_int_BB_CurrentEffects = _struct_CurrentButton.arr_int_BB_InteractedEffects;
	}
	else if(_bool_Selected)
	{
		_struct_TextToDraw.arr_int_Text_CurrentEffects = _struct_CurrentButton.arr_int_Text_SelectedEffects;
		_struct_CurrentButton.arr_int_BB_CurrentEffects = _struct_CurrentButton.arr_int_BB_SelectedEffects;
	}
	else
	{
		_struct_TextToDraw.arr_int_Text_CurrentEffects = _struct_CurrentButton.arr_int_Text_RegularEffects;
		_struct_CurrentButton.arr_int_BB_CurrentEffects = _struct_CurrentButton.arr_int_BB_RegularEffects;
	}
}
function menu_draw(_Current_Menu, _bool_IsNewest){
	
	var _int_MB_xPos = _Current_Menu.int_MB_xPos;
	var _int_MB_yPos = _Current_Menu.int_MB_yPos;
	
	menu_box_draw_to_screen(_Current_Menu, _int_MB_xPos, _int_MB_yPos);
	
	draw_elements(_Current_Menu, _Current_Menu);
	
	for(var _v = 0; _v < array_length(_Current_Menu.arr_struct_Buttons); _v++)
	{
		var _Current_Button = _Current_Menu.arr_struct_Buttons[_v];
		
		var _bool_IsSelected = (_Current_Menu.int_CurrentButton == _v);
		var _bool_Interacted = get_interact();
		
		set_button_effects(_Current_Button, _Current_Button.struct_TextToDraw, _bool_IsSelected, _bool_Interacted);		
		draw_button_struct(_Current_Menu, _Current_Button, _int_MB_xPos, _int_MB_yPos);

		draw_elements(_Current_Button, _Current_Menu);
	}
}
function menu_box_draw_to_screen(_Current_Menu, _int_MB_xPos, _int_MB_yPos)
{
	var _spr_MenuBox_Sprite = _Current_Menu.spr_MenuBox;
	
	if(_spr_MenuBox_Sprite != -1)
	{

		var _float_MenuBox_xScale = _Current_Menu.int_MB_Width / sprite_get_width(_spr_MenuBox_Sprite);
		var _float_MenuBox_yScale = _Current_Menu.int_MB_Height / sprite_get_height(_spr_MenuBox_Sprite);
			
		draw_sprite_ext(
			_spr_MenuBox_Sprite,
			0,
			_int_MB_xPos,
			_int_MB_yPos,
			_float_MenuBox_xScale,
			_float_MenuBox_yScale,
			0,
			c_white,
			1
		);
	}
}
function draw_elements(_struct_Origin, _Current_Menu)
{
	for(var _i = 0; _i < array_length(_struct_Origin.arr_struct_Elements); _i++)
	{
		var _Current_Element = _struct_Origin.arr_struct_Elements[_i];
		draw_target_element(_Current_Element, _Current_Menu);
	}
}
function draw_target_element(_Current_Element, _Current_Menu)
{
	var _spr_Element = _Current_Element.spr_Element;	

	if(_spr_Element != -1)
		draw_element_to_screen(_Current_Element, _Current_Menu)
	else	
		draw_text_struct(_Current_Element.struct_TextToDraw,_Current_Menu.int_MB_xPos,_Current_Menu.int_MB_yPos);
	
	reset_draw_state()
}

function draw_element_to_screen(_Current_Element, _Current_Menu)
{
	var _spr_Element = _Current_Element.spr_Element;	
	
	var _int_xPos = _Current_Menu.int_MB_xPos + _Current_Element.int_Element_RelativeXPos;
	var _int_yPos = _Current_Menu.int_MB_yPos + _Current_Element.int_Element_RelativeYPos;
	
	var _float_xScale = _Current_Element.float_Element_ScaleX;
	var _float_yScale = _Current_Element.float_Element_ScaleY;
		
	var _int_CurrentFrame = _Current_Element.int_CurrentFrame;

	var _bool_Centered = _Current_Element.bool_ElementPosCentered;
	
	if(_bool_Centered)
	{
		var _int_BaseW = sprite_get_width(_spr_Element) * _float_xScale;
		var _int_BaseH = sprite_get_height(_spr_Element) * _float_yScale;
		
		_int_xPos -= _int_BaseW / 2;
		_int_yPos -= _int_BaseH / 2;
	}

	draw_sprite_ext(
		_spr_Element,
		_int_CurrentFrame,
		_int_xPos,
		_int_yPos,
		_float_xScale,
		_float_yScale,
		0,
		c_white,
		1
	);
}

function draw_button_struct(_struct_Menu, _struct_Button, _int_MB_xPos, _int_MB_yPos)
{
	draw_buttonbox_to_screen(_struct_Button, _int_MB_xPos, _int_MB_yPos);
	draw_text_struct(_struct_Button.struct_TextToDraw, _struct_Menu.int_MB_xPos, _struct_Menu.int_MB_yPos);
}

function draw_buttonbox_to_screen(_struct_Button, _int_MB_xPos, _int_MB_yPos)
{
	var _spr_Button_Sprite = _struct_Button.spr_ButtonBox;
	for(var _i = 0; _i < array_length(_struct_Button.arr_int_BB_CurrentEffects); _i++)
		draw_TB_effects(_struct_Button.arr_int_BB_CurrentEffects[_i]);	
	if(_spr_Button_Sprite != -1)
	{
		var _int_Button_TargetXPos = _struct_Button.int_BB_RelativeXPos + _int_MB_xPos;
		var _int_Button_TargetYPos = _struct_Button.int_BB_RelativeYPos + _int_MB_yPos;
		var _float_Button_xScale = _struct_Button.int_BB_Width / sprite_get_width(_spr_Button_Sprite);
		var _float_Button_yScale = _struct_Button.int_BB_Height / sprite_get_height(_spr_Button_Sprite);
				
		draw_sprite_ext(
			_spr_Button_Sprite,
			0,
			_int_Button_TargetXPos,
			_int_Button_TargetYPos,
			_float_Button_xScale,
			_float_Button_yScale,
			0,
			c_white,
			1
		);
	}
	reset_draw_state();
}


function open_menu(_struct_Menu)
{
	with(global.o_ctrl_Menu)
	{
		array_push(arr_struct_Menus, _struct_Menu);
		global.bool_InMenu = true;
	}
}

function close_menu(_int_NumberToClose)
{
	if(_int_NumberToClose != INT_CLEAR_MENU)
	{
		for(var _i = 0; _i < _int_NumberToClose; _i++)
		{
			with(global.o_ctrl_Menu)
			{
				if(array_length(arr_struct_Menus) > 0)
				{
					var _Current_Menu = array_pop(arr_struct_Menus);
					reset_menu(_Current_Menu);
				}
				if(array_length(arr_struct_Menus) <= 0)
					global.bool_InMenu = false;
			}
		}
	}
	else
	{
		with(global.o_ctrl_Menu)
		{
			while(array_length(arr_struct_Menus) > 0)
			{
				var _Current_Menu = array_pop(arr_struct_Menus);
				reset_menu(_Current_Menu);
			}
		}
		
		global.bool_InMenu = false;
	}
}

function reset_menu(_Current_Menu)
{
	_Current_Menu.int_CurrentButton = 0;
	for(var _i = 0; _i < array_length(_Current_Menu.arr_struct_Buttons); _i++)
	{
		var _Current_Button = _Current_Menu.arr_struct_Buttons[_i];
		_Current_Button.arr_int_BB_CurrentEffects = [];
		
		reset_text_struct(_Current_Button.struct_TextToDraw);
		reset_elements(_Current_Button);
	}
	reset_elements(_Current_Menu);
}

function reset_elements(_Current_Menu)
{
	for(var _i = 0; _i < array_length(_Current_Menu.arr_struct_Elements); _i++)		
	{
		if(_Current_Menu.arr_struct_Elements[_i].spr_Element == -1)
			reset_text_struct(_Current_Menu.arr_struct_Elements[_i].struct_TextToDraw)
	}
}