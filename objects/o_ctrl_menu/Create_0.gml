struct_MainMenu = 
{
	bool_ForceClose: true,
	int_MB_xPos: 10,
	int_MB_yPos: 390,
	int_MB_Width: 640,
	int_MB_Height: 500, 
	spr_MenuBox: spr_tb_regular,
	int_CurrentButton: 0,
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
				int_Text_RelativeYPos: 50,
				int_Text_Width: 640,
				int_Text_yOffset: INT_TEXT_DEFAULT_Y_OFFSET,
				bool_TextPosCentered: true,
				
				str_Text: "Heroes",
				fn_TargetFont: global.fn_placeholder_trigger,
				int_xScale: 1.2,
				int_yScale: 1.2,
		
				arr_int_Text_CurrentEffects: [],
				float_TypeSpeed: 60,
	
				arr_str_LinesToPrint: [""],
				int_TotalLines: 1,
				float_CurrentStringWidth: 0,
				arr_str_CurrentWords: string_split_ext("Heroes", [" "], true),
				int_TotalWords: array_length(string_split_ext("Heroes", [" "], true)),
				int_CurrentWordIndex: 0,
				int_CurrentCharIndex: 1,
				float_NumOfCharsToAdd: 0,
	
				bool_StartTyping: false,
				bool_DoneTyping: false,
				bool_CanSkip: false,
				bool_InstantInteract: false,
				bool_InstantType: false
			},
			arr_int_BB_RegularEffects: [],
			arr_int_BB_SelectedEffects: [],
			arr_int_BB_InteractedEffects: [],
			arr_int_Text_RegularEffects: [],
			arr_int_Text_SelectedEffects: [int_text_effect.YELLOW_TEXT],
			arr_int_Text_InteractedEffects: [],
			method_SelectionScript: function(){method_MainMenu_Heroes()},
			arr_struct_Elements: [],
			specialarr_Info: [],
			int_Down: 1,
			int_Up: 4,
			int_Left: 0, 
			int_Right: 0
		}
		,
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
				int_Text_RelativeYPos: 150,
				int_Text_Width: 640,
				int_Text_yOffset: INT_TEXT_DEFAULT_Y_OFFSET,
				bool_TextPosCentered: true,
				
				str_Text: "Inventory",
				fn_TargetFont: global.fn_placeholder_trigger,
				int_xScale: 1.2,
				int_yScale: 1.2,
		
				arr_int_Text_CurrentEffects: [],
				float_TypeSpeed: 60,
	
				arr_str_LinesToPrint: [""],
				int_TotalLines: 1,
				float_CurrentStringWidth: 0,
				arr_str_CurrentWords: string_split_ext("Inventory", [" "], true),
				int_TotalWords: array_length(string_split_ext("Inventory", [" "], true)),
				int_CurrentWordIndex: 0,
				int_CurrentCharIndex: 1,
				float_NumOfCharsToAdd: 0,
	
				bool_StartTyping: false,
				bool_DoneTyping: false,
				bool_CanSkip: false,
				bool_InstantInteract: false,
				bool_InstantType: false
			},
			arr_int_BB_RegularEffects: [],
			arr_int_BB_SelectedEffects: [],
			arr_int_BB_InteractedEffects: [],
			arr_int_Text_RegularEffects: [],
			arr_int_Text_SelectedEffects: [int_text_effect.YELLOW_TEXT],
			arr_int_Text_InteractedEffects: [],
			method_SelectionScript: function(){method_MainMenu_Inventory()},
			arr_struct_Elements: [],
			specialarr_Info: [],
			int_Down: 2,
			int_Up: 0,
			int_Left: 1, 
			int_Right: 1
		}
		,
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
				int_Text_RelativeYPos: 250,
				int_Text_Width: 640,
				int_Text_yOffset: INT_TEXT_DEFAULT_Y_OFFSET,
				bool_TextPosCentered: true,
				
				str_Text: "Codex",
				fn_TargetFont: global.fn_placeholder_trigger,
				int_xScale: 1.2,
				int_yScale: 1.2,
		
				arr_int_Text_CurrentEffects: [],
				float_TypeSpeed: 60,
	
				arr_str_LinesToPrint: [""],
				int_TotalLines: 1,
				float_CurrentStringWidth: 0,
				arr_str_CurrentWords: string_split_ext("Codex", [" "], true),
				int_TotalWords: array_length(string_split_ext("Codex", [" "], true)),
				int_CurrentWordIndex: 0,
				int_CurrentCharIndex: 1,
				float_NumOfCharsToAdd: 0,
	
				bool_StartTyping: false,
				bool_DoneTyping: false,
				bool_CanSkip: false,
				bool_InstantInteract: false,
				bool_InstantType: false
			},
			arr_int_BB_RegularEffects: [],
			arr_int_BB_SelectedEffects: [],
			arr_int_BB_InteractedEffects: [],
			arr_int_Text_RegularEffects: [],
			arr_int_Text_SelectedEffects: [int_text_effect.YELLOW_TEXT],
			arr_int_Text_InteractedEffects: [],
			method_SelectionScript: function() {method_MainMenu_Codex()},
			arr_struct_Elements: [],
			specialarr_Info: [],
			int_Down: 3,
			int_Up: 1,
			int_Left: 2, 
			int_Right: 2
		}
		,
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
				bool_InstantType: false
			},
			arr_int_BB_RegularEffects: [],
			arr_int_BB_SelectedEffects: [],
			arr_int_BB_InteractedEffects: [],
			arr_int_Text_RegularEffects: [],
			arr_int_Text_SelectedEffects: [int_text_effect.YELLOW_TEXT],
			arr_int_Text_InteractedEffects: [],
			method_SelectionScript: function() { method_MainMenu_Settings()},
			arr_struct_Elements: [],
			specialarr_Info: [],
			int_Down: 4,
			int_Up: 2,
			int_Left: 3, 
			int_Right: 3
		}
		,
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
				int_Text_RelativeYPos: 450,
				int_Text_Width: 640,
				int_Text_yOffset: INT_TEXT_DEFAULT_Y_OFFSET,
				bool_TextPosCentered: true,
				
				str_Text: "Quicksave and Leave",
				fn_TargetFont: global.fn_placeholder_trigger,
				int_xScale: 1,
				int_yScale: 1,
		
				arr_int_Text_CurrentEffects: [],
				float_TypeSpeed: 60,
	
				arr_str_LinesToPrint: [""],
				int_TotalLines: 1,
				float_CurrentStringWidth: 0,
				arr_str_CurrentWords: string_split_ext("Quicksave and Leave", [" "], true),
				int_TotalWords: array_length(string_split_ext("Quicksave and Leave", [" "], true)),
				int_CurrentWordIndex: 0,
				int_CurrentCharIndex: 1,
				float_NumOfCharsToAdd: 0,
	
				bool_StartTyping: false,
				bool_DoneTyping: false,
				bool_CanSkip: false,
				bool_InstantInteract: false,
				bool_InstantType: false
			},
			arr_int_BB_RegularEffects: [],
			arr_int_BB_SelectedEffects: [],
			arr_int_BB_InteractedEffects: [],
			arr_int_Text_RegularEffects: [],
			arr_int_Text_SelectedEffects: [int_text_effect.YELLOW_TEXT],
			arr_int_Text_InteractedEffects: [],
			method_SelectionScript: function(){method_MainMenu_QSaveLeave()},
			arr_struct_Elements: [],
			specialarr_Info: [],
			int_Down: 0,
			int_Up: 3,
			int_Left: 4, 
			int_Right: 4
		}
	],
	arr_struct_Elements: []
}

arr_struct_Menus = [];

int_CurrentButton = 0;

global.bool_SuppressMenu = false;
