function method_MainMenu_Heroes()
{
	
}

function method_MainMenu_Inventory()
{
	close_menu(1);
}

function method_MainMenu_Codex()
{
	
}

function method_MainMenu_Settings()
{
	struct_MainMenu_Settings = 
	{
		bool_ForceClose: true,
		int_MB_xPos: 660,
		int_MB_yPos: 10,
		int_MB_Width: 930,
		int_MB_Height: 880,
		spr_MenuBox: spr_tb_regular,
		int_CurrentButton: 0, 
		arr_struct_Buttons: 
		[
			{ //Volume
				spr_ButtonBox: -1,
				int_BB_RelativeXPos: -1,
				int_BB_RelativeYPos: -1,
				int_BB_Width: -1,
				int_BB_Height: -1,
				arr_int_BB_CurrentEffects: [],
				struct_TextToDraw: 
				{
					int_Text_RelativeXPos: 50,
					int_Text_RelativeYPos: 50,
					int_Text_Width: 930,
					int_Text_yOffset: INT_TEXT_DEFAULT_Y_OFFSET,
					bool_TextPosCentered: false,
				
					str_Text: "Volume",
					fn_TargetFont: global.fn_placeholder_trigger,
					int_xScale: 1,
					int_yScale: 1,
		
					arr_int_Text_CurrentEffects: [],
					float_TypeSpeed: 60,
	
					arr_str_LinesToPrint: [""],
					int_TotalLines: 1,
					float_CurrentStringWidth: 0,
					arr_str_CurrentWords: string_split_ext("Volume", [" "], true),
					int_TotalWords: array_length(string_split_ext("Volume", [" "], true)),
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
				arr_int_Text_SelectedEffects: [int_text_effect.YELLOW_TEXT],
				arr_int_Text_InteractedEffects: [],
				method_SelectionScript: -1,
				arr_struct_Elements:
				[
					{
						spr_Element: spr_e_VolumeSlider,
						int_CurrentFrame: (global.int_Volume),
						struct_TextToDraw: -1,
						bool_ElementPosCentered: true,
						int_Element_RelativeXPos: 660,
						int_Element_RelativeYPos: 50 + TRIGGER_PLACEHOLDER_FONT_TOP_OFFSET,
						float_Element_ScaleX: 3,
						float_Element_ScaleY: 3,
						arr_int_Effects: []
					}
				],
				specialarr_Info: [],
				int_Down: 1,
				int_Up: 1,
				int_Left: function() {method_MainMenu_Volume(false, self)},
				int_Right: function() {method_MainMenu_Volume(true, self)}
			}
			,
			{ //Keybinds
				spr_ButtonBox: -1,
				int_BB_RelativeXPos: -1,
				int_BB_RelativeYPos: -1,
				int_BB_Width: -1,
				int_BB_Height: -1,
				arr_int_BB_CurrentEffects: [],
				struct_TextToDraw: 
				{
					int_Text_RelativeXPos: 50,
					int_Text_RelativeYPos: 150,
					int_Text_Width: 930,
					int_Text_yOffset: INT_TEXT_DEFAULT_Y_OFFSET,
					bool_TextPosCentered: false,
				
					str_Text: "Keybinding",
					fn_TargetFont: global.fn_placeholder_trigger,
					int_xScale: 1,
					int_yScale: 1,
		
					arr_int_Text_CurrentEffects: [],
					float_TypeSpeed: 60,
	
					arr_str_LinesToPrint: [""],
					int_TotalLines: 1,
					float_CurrentStringWidth: 0,
					arr_str_CurrentWords: string_split_ext("Keybinding", [" "], true),
					int_TotalWords: array_length(string_split_ext("Keybinding", [" "], true)),
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
				arr_int_Text_SelectedEffects: [int_text_effect.YELLOW_TEXT],
				arr_int_Text_InteractedEffects: [],
				method_SelectionScript: method_MainMenu_Keybinding,
				arr_struct_Elements:[],
				specialarr_Info: [],
				int_Down: 0,
				int_Up: 0,
				int_Left: 1,
				int_Right: 1
			}
		],
		arr_struct_Elements: [],
	}
	open_menu(struct_MainMenu_Settings);
}

function method_MainMenu_Volume(_bool_Louder, _Volume_Button)
{
	if(_bool_Louder)
	{
		if(++global.int_Volume > 10)
			global.int_Volume = 10;
	}
	else 
	{
		if(--global.int_Volume < 0)
			global.int_Volume = 0;	
	}
	
	_Volume_Button.arr_struct_Elements[int_Volume_Elements.VOLUME_SLIDER].int_CurrentFrame = global.int_Volume;
}

function method_MainMenu_Keybinding()
{
	struct_MainMenu_Keybinding = 
	{
		bool_ForceClose: true,
		int_MB_xPos: 960,
		int_MB_yPos: 10,
		int_MB_Width: 630,
		int_MB_Height: 680,
		spr_MenuBox: spr_tb_regular,
		int_CurrentButton: 0, 
		arr_struct_Buttons: 
		[
			{	//Move Up
				spr_ButtonBox: -1,
				int_BB_RelativeXPos: -1,
				int_BB_RelativeYPos: -1,
				int_BB_Width: -1,
				int_BB_Height: -1,
				arr_int_BB_CurrentEffects: [],
				struct_TextToDraw: 
				{
					int_Text_RelativeXPos: 50,
					int_Text_RelativeYPos: 50,
					int_Text_Width: 630,
					int_Text_yOffset: INT_TEXT_DEFAULT_Y_OFFSET,
					bool_TextPosCentered: false,
				
					str_Text: "Move Up",
					fn_TargetFont: global.fn_placeholder_trigger,
					int_xScale: 1,
					int_yScale: 1,
		
					arr_int_Text_CurrentEffects: [],
					float_TypeSpeed: 60,
	
					arr_str_LinesToPrint: [""],
					int_TotalLines: 1,
					float_CurrentStringWidth: 0,
					arr_str_CurrentWords: string_split_ext("Move Up", [" "], true),
					int_TotalWords: array_length(string_split_ext("Move Up", [" "], true)),
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
				arr_int_Text_SelectedEffects: [int_text_effect.YELLOW_TEXT],
				arr_int_Text_InteractedEffects: [],
				method_SelectionScript: -1,
				arr_struct_Elements:
				[
					{
						spr_Element: spr_e_VolumeSlider,
						int_CurrentFrame: (global.int_Volume),
						struct_TextToDraw: -1,
						bool_ElementPosCentered: true,
						int_Element_RelativeXPos: 660,
						int_Element_RelativeYPos: 50 + TRIGGER_PLACEHOLDER_FONT_TOP_OFFSET,
						float_Element_ScaleX: 3,
						float_Element_ScaleY: 3,
						arr_int_Effects: []
					}
				],
				specialarr_Info: [],
				int_Down: 1,
				int_Up: 1,
				int_Left: function() {method_MainMenu_Volume(false, self)},
				int_Right: function() {method_MainMenu_Volume(true, self)}
			}
		],
		arr_struct_Elements: [],
		
	}
	open_menu(struct_MainMenu_Keybinding);
}

function method_MainMenu_QSaveLeave()
{

}