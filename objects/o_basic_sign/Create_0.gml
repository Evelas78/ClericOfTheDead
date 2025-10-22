/// @description Set the special arr interact with each necessary function

event_inherited();

struct_DialogueBox =
{	
	struct_Textbox:
	{
		spr_Textbox: spr_tb_TargetTextbox,
		int_TB_xPos: INT_TEXTBOX_DEFAULT_X_POS,
		int_TB_yPos: INT_TEXTBOX_DEFAULT_Y_POS,
		int_TB_Width: INT_TEXTBOX_DEFAULT_WIDTH,
		int_TB_Height: INT_TEXTBOX_DEFAULT_HEIGHT,
		arr_int_TB_CurrentEffects: [],
		
		struct_TextToDraw: 
		{
			int_Text_RelativeXPos: int_Text_TargetXPos,
			int_Text_RelativeYPos: int_Text_TargetYPos,
			int_Text_Width: INT_TEXT_DEFAULT_WIDTH,
			int_Text_yOffset: INT_TEXT_DEFAULT_Y_OFFSET,
			bool_TextPosCentered: bool_TextCentered,

			str_Text: str_CurrentString,
			fn_TargetFont: fn_TargetFont,
			int_xScale: int_xScale,
			int_yScale: int_yScale,
		
			arr_int_Text_CurrentEffects: [],
			float_TypeSpeed: float_TypeSpeed,
	
			arr_str_LinesToPrint: [""],
			int_TotalLines: 1,
			float_CurrentStringWidth: 0,
			arr_str_CurrentWords: string_split_ext(str_CurrentString, [" "], true),
			int_TotalWords: array_length(string_split_ext(str_CurrentString, [" "], true)),
			int_CurrentWordIndex: 0,
			int_CurrentCharIndex: 1,
			float_NumOfCharsToAdd: 0,
	
			bool_StartTyping: false,
			bool_DoneTyping: false,
			bool_CanSkip: bool_CanSkip,
			bool_InstantInteract: bool_InstantInteract,
			bool_InstantType: bool_InstantType
		}
	},
	method_Escape: method_Escape,
	bool_AutoSkip: bool_AutoSkip,
	float_AutoSkip_Timer: float_AutoSkip_Timer,
	float_AutoSkip_CurrentTimer: float_AutoSkip_Timer,
	method_AutoSkip: method_AutoSkip,
	int_CurrentChoice: 0,
	arr_struct_Choices: []
}

method_InteractionScripts = 
{	
	method_interaction_one : method(self, function(){
		int_CharacterState = int_CharacterStates.INTERACT;
		var _specialarr_Interaction = struct_DialogueBox;
		queue_Textbox_to_controller(_specialarr_Interaction);
	}),
}

specialarr_Interaction = [method_InteractionScripts.method_interaction_one]

