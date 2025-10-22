function define_original_BattleMenu()
{
	global.struct_BattleMenu_Template = 
	{
		bool_ForceClose: false,
		int_MB_xPos: 0,
		int_MB_yPos: 590,
		int_MB_Width: 1600,
		int_MB_Height: 300,
		spr_MenuBox: -1,
		int_CurrentButton: 0, 
		arr_struct_Buttons: 
		[
			{	//Attack
				spr_ButtonBox: spr_tb_regular,
				int_BB_RelativeXPos: 10,
				int_BB_RelativeYPos: 0,
				int_BB_Width: 300,
				int_BB_Height: 150,
				arr_int_BB_CurrentEffects: [],
				struct_TextToDraw: 
				{
					int_Text_RelativeXPos: 160,
					int_Text_RelativeYPos: 75,
					int_Text_Width: 300,
					int_Text_yOffset: INT_TEXT_DEFAULT_Y_OFFSET,
					bool_TextPosCentered: true,
				
					str_Text: "Attack",
					fn_TargetFont: global.fn_placeholder_trigger,
					int_xScale: 1,
					int_yScale: 1,
		
					arr_int_Text_CurrentEffects: [],
					float_TypeSpeed: 60,
	
					arr_str_LinesToPrint: [""],
					int_TotalLines: 1,
					float_CurrentStringWidth: 0,
					arr_str_CurrentWords: string_split_ext("Attack", [" "], true),
					int_TotalWords: array_length(string_split_ext("Attack", [" "], true)),
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
				method_SelectionScript: function() {method_BattleMenu_AttackMenu(self.specialarr_Info[int_BattleMenu_ArrayPositions.OWNER], self.specialarr_Info[int_BattleMenu_ArrayPositions.BASIC], self.specialarr_Info[int_BattleMenu_ArrayPositions.ABILITIES])},
				arr_struct_Elements: [],
				specialarr_Info: [],
				int_Down: 0,
				int_Up: function() {method_BattleMenu_AttackMenu(self.specialarr_Info[int_BattleMenu_ArrayPositions.OWNER], self.specialarr_Info[int_BattleMenu_ArrayPositions.BASIC], self.specialarr_Info[int_BattleMenu_ArrayPositions.ABILITIES])},
				int_Left: 4,
				int_Right: 1
			}
			,
			{	//Guard
				spr_ButtonBox: spr_tb_regular,
				int_BB_RelativeXPos: 330,
				int_BB_RelativeYPos: 0,
				int_BB_Width: 300,
				int_BB_Height: 150,
				arr_int_BB_CurrentEffects: [],
				struct_TextToDraw: 
				{
					int_Text_RelativeXPos: 480,
					int_Text_RelativeYPos: 75,
					int_Text_Width: 300,
					int_Text_yOffset: INT_TEXT_DEFAULT_Y_OFFSET,
					bool_TextPosCentered: true,
				
					str_Text: "Guard",
					fn_TargetFont: global.fn_placeholder_trigger,
					int_xScale: 1,
					int_yScale: 1,
		
					arr_int_Text_CurrentEffects: [],
					float_TypeSpeed: 60,
	
					arr_str_LinesToPrint: [""],
					int_TotalLines: 1,
					float_CurrentStringWidth: 0,
					arr_str_CurrentWords: string_split_ext("Guard", [" "], true),
					int_TotalWords: array_length(string_split_ext("Guard", [" "], true)),
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
				method_SelectionScript: function() {method_BattleMenu_Guard()},
				arr_struct_Elements:[],
				specialarr_Info: [],
				int_Down: 1,
				int_Up: 1,
				int_Left: 0,
				int_Right: 2
			}
			,
			{	//Items
				spr_ButtonBox: spr_tb_regular,
				int_BB_RelativeXPos: 650,
				int_BB_RelativeYPos: 0,
				int_BB_Width: 300,
				int_BB_Height: 150,
				arr_int_BB_CurrentEffects: [],
				struct_TextToDraw: 
				{
					int_Text_RelativeXPos: 800,
					int_Text_RelativeYPos: 75,
					int_Text_Width: 300,
					int_Text_yOffset: INT_TEXT_DEFAULT_Y_OFFSET,
					bool_TextPosCentered: true,
				
					str_Text: "Items",
					fn_TargetFont: global.fn_placeholder_trigger,
					int_xScale: 1,
					int_yScale: 1,
		
					arr_int_Text_CurrentEffects: [],
					float_TypeSpeed: 60,
	
					arr_str_LinesToPrint: [""],
					int_TotalLines: 1,
					float_CurrentStringWidth: 0,
					arr_str_CurrentWords: string_split_ext("Items", [" "], true),
					int_TotalWords: array_length(string_split_ext("Items", [" "], true)),
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
				method_SelectionScript: function() {method_BattleMenu_Items()},
				arr_struct_Elements:
				[

				],
				specialarr_Info: [],
				int_Down: 2,
				int_Up: 2,
				int_Left: 1,
				int_Right: 3
			}
			,
			{	//Ultimate
				spr_ButtonBox: spr_tb_regular,
				int_BB_RelativeXPos: 970,
				int_BB_RelativeYPos: 0,
				int_BB_Width: 300,
				int_BB_Height: 150,
				arr_int_BB_CurrentEffects: [],
				struct_TextToDraw: 
				{
					int_Text_RelativeXPos: 1120,
					int_Text_RelativeYPos: 75,
					int_Text_Width: 300,
					int_Text_yOffset: INT_TEXT_DEFAULT_Y_OFFSET,
					bool_TextPosCentered: true,
				
					str_Text: "Ultimate",
					fn_TargetFont: global.fn_placeholder_trigger,
					int_xScale: 1,
					int_yScale: 1,
		
					arr_int_Text_CurrentEffects: [],
					float_TypeSpeed: 60,
	
					arr_str_LinesToPrint: [""],
					int_TotalLines: 1,
					float_CurrentStringWidth: 0,
					arr_str_CurrentWords: string_split_ext("Ultimate", [" "], true),
					int_TotalWords: array_length(string_split_ext("Ultimate", [" "], true)),
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
				method_SelectionScript: function() {method_BattleMenu_Ultimate()},
				arr_struct_Elements:
				[

				],
				specialarr_Info: [],
				int_Down: 3,
				int_Up: 3,
				int_Left: 2,
				int_Right: 4
			}
			,
			{	//Flee
				spr_ButtonBox: spr_tb_regular,
				int_BB_RelativeXPos: 1290,
				int_BB_RelativeYPos: 0,
				int_BB_Width: 300,
				int_BB_Height: 150,
				arr_int_BB_CurrentEffects: [],
				struct_TextToDraw: 
				{
					int_Text_RelativeXPos: 1440,
					int_Text_RelativeYPos: 75,
					int_Text_Width: 300,
					int_Text_yOffset: INT_TEXT_DEFAULT_Y_OFFSET,
					bool_TextPosCentered: true,
				
					str_Text: "Flee",
					fn_TargetFont: global.fn_placeholder_trigger,
					int_xScale: 1,
					int_yScale: 1,
		
					arr_int_Text_CurrentEffects: [],
					float_TypeSpeed: 60,
	
					arr_str_LinesToPrint: [""],
					int_TotalLines: 1,
					float_CurrentStringWidth: 0,
					arr_str_CurrentWords: string_split_ext("Flee", [" "], true),
					int_TotalWords: array_length(string_split_ext("Flee", [" "], true)),
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
				method_SelectionScript: function() {method_BattleMenu_Flee()},
				arr_struct_Elements:[],
				specialarr_Info: [],
				int_Down: 4,
				int_Up: 4,
				int_Left: 3,
				int_Right: 0
			}
		],
		arr_struct_Elements:
		[
			//USE MACROS TO SAVE POSITIONS. Better storage than doing a struct of structs
			{
				spr_Element: spr_tb_regular,
				int_CurrentFrame: 0,
				struct_TextToDraw: -1,
				bool_ElementPosCentered: true,
				int_Element_RelativeXPos: 800,
				int_Element_RelativeYPos: 225,
				float_Element_ScaleX: 1580 / sprite_get_width(spr_tb_regular),
				float_Element_ScaleY: 150 / sprite_get_height(spr_tb_regular),
				arr_int_Effects: []
			}
		],
	}	
}

function method_BattleMenu_AttackMenu(_Current_Owner, _arr_struct_Basics, _arr_struct_Abilities)
{
	var struct_AttackMenu = 
	{
		bool_ForceClose: true,
		int_MB_xPos: 10,
		int_MB_yPos: 290,
		int_MB_Width: 300,
		int_MB_Height: 300,
		spr_MenuBox: spr_tb_regular,
		int_CurrentButton: 0,
		arr_struct_Buttons: 
		[
			
		],
		arr_struct_Elements:
		{
		
		},
	}
	
	var struct_BasicButton = 
	{ //Basic
		spr_ButtonBox: -1,
		int_BB_RelativeXPos: -1,
		int_BB_RelativeYPos: -1,
		int_BB_Width: -1,
		int_BB_Height: -1,
		struct_TextToDraw: 
		{
			int_Text_RelativeXPos: 150,
			int_Text_RelativeYPos: 100,
			int_Text_Width: 300,
			int_Text_yOffset: INT_TEXT_DEFAULT_Y_OFFSET,
			bool_TextPosCentered: true,
				
			str_Text: "Basic",
			fn_TargetFont: global.fn_placeholder_trigger,
			int_xScale: .75,
			int_yScale: .75,
		
			arr_int_Text_CurrentEffects: [],
			float_TypeSpeed: 60,
	
			arr_str_LinesToPrint: [""],
			int_TotalLines: 1,
			float_CurrentStringWidth: 0,
			arr_str_CurrentWords: string_split_ext("Basic", [" "], true),
			int_TotalWords: array_length(string_split_ext("Basic", [" "], true)),
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
		method_SelectionScript: function() {method_BattleMenu_BasicAttack(self, self.specialarr_Info[int_BattleMenu_ArrayPositions.OWNER], self.specialarr_Info[int_BattleMenu_ArrayPositions.BASIC]);},
		arr_struct_Elements:[],
		specialarr_Info: [],
		int_Down: 1,
		int_Up: 1,
		int_Left: 0, 
		int_Right: function() {method_BattleMenu_BasicAttack(self,  self.specialarr_Info[int_BattleMenu_ArrayPositions.OWNER], self.specialarr_Info[int_BattleMenu_ArrayPositions.BASIC]);}
	}
	var struct_AbilitiesButton = 
	{ //Abilities
		spr_ButtonBox: -1,
		int_BB_RelativeXPos: -1,
		int_BB_RelativeYPos: -1,
		int_BB_Width: -1,
		int_BB_Height: -1,
		struct_TextToDraw: 
		{
			int_Text_RelativeXPos: 150,
			int_Text_RelativeYPos: 200,
			int_Text_Width: 300,
			int_Text_yOffset: INT_TEXT_DEFAULT_Y_OFFSET,
			bool_TextPosCentered: true,
				
			str_Text: "Abilities",
			fn_TargetFont: global.fn_placeholder_trigger,
			int_xScale: .75,
			int_yScale: .75,
		
			arr_int_Text_CurrentEffects: [],
			float_TypeSpeed: 60,
	
			arr_str_LinesToPrint: [""],
			int_TotalLines: 1,
			float_CurrentStringWidth: 0,
			arr_str_CurrentWords: string_split_ext("Abilities", [" "], true),
			int_TotalWords: array_length(string_split_ext("Abilities", [" "], true)),
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
		method_SelectionScript: function() {method_BattleMenu_BasicAttack(self, self.specialarr_Info[int_BattleMenu_ArrayPositions.OWNER], self.specialarr_Info[int_BattleMenu_ArrayPositions.ABILITIES]);},
		arr_struct_Elements:[],
		specialarr_Info: [_arr_struct_Abilities],
		int_Down: 0,
		int_Up: 0,
		int_Left: 1, 
		int_Right: function() {method_BattleMenu_BasicAttack(self, self.specialarr_Info[int_BattleMenu_ArrayPositions.OWNER], self.specialarr_Info[int_BattleMenu_ArrayPositions.ABILITIES]);},
	}
	
	//sets up basic attack button
	struct_AttackMenu.arr_struct_Buttons[int_BattleMenu_Buttons.BASIC] = struct_BasicButton;
	struct_AttackMenu.arr_struct_Buttons[int_BattleMenu_Buttons.BASIC].specialarr_Info[int_BattleMenu_ArrayPositions.OWNER] = _Current_Owner;
	struct_AttackMenu.arr_struct_Buttons[int_BattleMenu_Buttons.BASIC].specialarr_Info[int_BattleMenu_ArrayPositions.BASIC] = _arr_struct_Basics;
	//Sets up abilities button
	struct_AttackMenu.arr_struct_Buttons[int_BattleMenu_Buttons.ABILITIES] = struct_AbilitiesButton;
	struct_AttackMenu.arr_struct_Buttons[int_BattleMenu_Buttons.ABILITIES].specialarr_Info[int_BattleMenu_ArrayPositions.OWNER] = _Current_Owner;
	struct_AttackMenu.arr_struct_Buttons[int_BattleMenu_Buttons.ABILITIES].specialarr_Info[int_BattleMenu_ArrayPositions.ABILITIES] = _arr_struct_Abilities;
	
	open_menu(struct_AttackMenu);
}

function method_BattleMenu_BasicAttack(_Current_Button, _Current_Owner, _arr_struct_Basics)
{
	struct_BattleMenu_BasicAttack = 
	{
		bool_ForceClose: true,
		int_MB_xPos: 320,
		int_MB_yPos: 10,
		int_MB_Width: 900,
		int_MB_Height: 580,
		spr_MenuBox: spr_tb_regular,
		int_CurrentButton: 0,
		arr_struct_Buttons: 
		[
			
		],
		arr_struct_Elements:
		[		
		],
	}
	var _int_NumOfBasics = array_length(_arr_struct_Basics);
	for(var _i = 0; _i < _int_NumOfBasics; _i++)
	{
		var _struct_Current = _arr_struct_Basics[_i];
		/*
			arr_struct_Basic =
			[
				{
					str_Name: "Basic Placeholder Attack",
					str_Description: "Placeholder Basic Attack: Please input an actual description and move",
					method_Move: AttackMove_PlaceholderHero_PlaceholderBasicAttack,
					spr_CurrentSprite: spr_placeholder_orange,
					int_TurnCooldown: 0,
					int_CurrentCooldown: 0,
					int_ElystCost: 0
				}
			]
		*/
		var _struct_New = {
			spr_ButtonBox: -1,
			int_BB_RelativeXPos: -1,
			int_BB_RelativeYPos: -1,
			int_BB_Width: -1,
			int_BB_Height: -1,
			arr_int_BB_CurrentEffects: [],
			struct_TextToDraw: 
			{
				int_Text_RelativeXPos: 450,
				int_Text_RelativeYPos: 100 * (_i + 1),
				int_Text_Width: 880,
				int_Text_yOffset: INT_TEXT_DEFAULT_Y_OFFSET,
				bool_TextPosCentered: true,
				
				str_Text: _struct_Current.str_Name,
				fn_TargetFont: global.fn_placeholder_trigger,
				int_xScale: 1,
				int_yScale: 1,
		
				arr_int_Text_CurrentEffects: [],
				float_TypeSpeed: 60,
	
				arr_str_LinesToPrint: [""],
				int_TotalLines: 1,
				float_CurrentStringWidth: 0,
				arr_str_CurrentWords: string_split_ext(_struct_Current.str_Name, [" "], true),
				int_TotalWords: array_length(string_split_ext(_struct_Current.str_Name, [" "], true)),
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
			method_SelectionScript: function() {hero_move_chosen(specialarr_Info[int_BattleMenu_ArrayPositions.CURRENT_STRUCT].int_Identifier);},
			arr_struct_Elements:
			[
				{  //Description
					spr_Element: -1,
					int_CurrentFrame: -1,
					struct_TextToDraw: 
					{
						int_Text_RelativeXPos: 450,
						int_Text_RelativeYPos: 100 * (_i+1) + 70,
						int_Text_Width: 880,
						int_Text_yOffset: INT_TEXT_DEFAULT_Y_OFFSET,
						bool_TextPosCentered: true,
				
						str_Text: _struct_Current.str_Description,
						fn_TargetFont: global.fn_placeholder_trigger,
						int_xScale: .5,
						int_yScale: .5,
		
						arr_int_Text_CurrentEffects: [],
						float_TypeSpeed: 60,
	
						arr_str_LinesToPrint: [""],
						int_TotalLines: 1,
						float_CurrentStringWidth: 0,
						arr_str_CurrentWords: string_split_ext(_struct_Current.str_Description, [" "], true),
						int_TotalWords: array_length(string_split_ext(_struct_Current.str_Description, [" "], true)),
						int_CurrentWordIndex: 0,
						int_CurrentCharIndex: 1,
						float_NumOfCharsToAdd: 0,
	
						bool_StartTyping: false,
						bool_DoneTyping: false,
						bool_CanSkip: false,
						bool_InstantInteract: false,
						bool_InstantType: true
					},
					bool_ElementPosCentered: false,
					int_Element_RelativeXPos: 10, 
					int_Element_RelativeYPos: 100 * (_i+1) + 50,
					float_Element_ScaleX: .25,
					float_Element_ScaleY: .25,
					arr_int_Effects: []
				}
			],
			specialarr_Info: [],
			int_Down: boundary_choice_input(_int_NumOfBasics, _i-1),
			int_Up: boundary_choice_input(_int_NumOfBasics, _i+1),
			int_Left: 0, 
			int_Right: 0
		}
		_struct_New.specialarr_Info[int_BattleMenu_ArrayPositions.OWNER] = _Current_Owner;
		_struct_New.specialarr_Info[int_BattleMenu_ArrayPositions.CURRENT_STRUCT] = _struct_Current;
		array_push(struct_BattleMenu_BasicAttack.arr_struct_Buttons, _struct_New)
	}
	
	open_menu(struct_BattleMenu_BasicAttack);
}

function method_BattleMenu_Abilities(_Current_Button, _arr_struct_Abilities)
{
	
}

function method_BattleMenu_Items()
{
	
}

function method_BattleMenu_Guard()
{
	
}

function method_BattleMenu_Ultimate()
{
	
}

function method_BattleMenu_Flee()
{
	
}