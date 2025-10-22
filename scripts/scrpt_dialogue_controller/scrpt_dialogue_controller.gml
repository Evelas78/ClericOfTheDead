// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_fonts()
{
	global.fn_placeholder_trigger = font_add_sprite_ext(spr_fn_placeholder_trigger, " ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890!.,'\"([])#^/;:|\~`<>+=_-&", false, 0);
}

function regular_dialoguebox_handler(_struct_CurrentDialogueBox, _bool_PressingInteract)
{
	var _struct_CurrentTextbox = _struct_CurrentDialogueBox.struct_Textbox;
	var _struct_TextToDraw = _struct_CurrentTextbox.struct_TextToDraw;
	
	var _bool_DoneTyping =  _struct_TextToDraw.bool_DoneTyping;
	var _bool_CanSkip = _struct_TextToDraw.bool_CanSkip;
	var _bool_AutoSkip = _struct_CurrentDialogueBox.bool_AutoSkip;
	var _bool_InstantInteract = _struct_TextToDraw.bool_InstantInteract;
	
	draw_textbox_struct(_struct_CurrentTextbox)
	
	if(_bool_DoneTyping && _bool_AutoSkip)
	{
		auto_skip_handler(_struct_CurrentDialogueBox);
	}
	if(_bool_InstantInteract && _bool_PressingInteract) //Instant Interact
	{
		regular_close_handler(_struct_CurrentDialogueBox);
	}
	else if(_bool_PressingInteract && _bool_CanSkip && !_bool_DoneTyping)
	{
		skip_text_compile(_struct_TextToDraw);
	}
	else if(_bool_DoneTyping && _bool_PressingInteract)
	{
		regular_close_handler(_struct_CurrentDialogueBox);
	}
}
function regular_close_handler(_struct_CurrentDialogueBox)
{
	if(bool_InTextbox)
	{
		if(is_callable(_struct_CurrentDialogueBox.method_Escape))
			method_call(_struct_CurrentDialogueBox.method_Escape);
		close_dialoguebox(_struct_CurrentDialogueBox);
	}
}
function auto_skip_handler(_struct_CurrentDialogueBox)
{
	if(bool_InTextbox)
	{
		if(_struct_CurrentDialogueBox.float_AutoSkip_CurrentTimer > 0) //Still Counting Down
			_struct_CurrentDialogueBox.float_AutoSkip_CurrentTimer -= 1/global.int_GameSpeed;
		else //Hit 0
		{
			if(is_callable(_struct_CurrentDialogueBox.method_Escape))
				method_call(_struct_CurrentDialogueBox.method_Escape);
			close_dialoguebox(_struct_CurrentDialogueBox);
		}
	}		
}

function load_new_dialoguebox()
{
	struct_CurrentDialogueBox = ds_queue_dequeue(queue_DialogueBox);
	bool_InTextbox = true;
	bool_HasChoices = (array_length(struct_CurrentDialogueBox.arr_struct_Choices) == 0) ? false : true;
	global.bool_InDialogue = true;
	show_debug_message("Loaded new dialogue box");
}
function close_dialoguebox(_struct_CurrentDialogueBox)
{
	//Setting values to default
	bool_InTextbox = false;
	bool_HasChoices = false;
	
	reset_dialoguebox(_struct_CurrentDialogueBox);
	
	for(var _i = 0; _i < array_length(_struct_CurrentDialogueBox.arr_struct_Choices); _i++)
	{
		//show_debug_message("Reset Choice Box " + string(_i));
		//show_debug_message("Choice Struct " + string(_struct_CurrentDialogueBox.arr_struct_Choices[_i]));
		reset_choice(_struct_CurrentDialogueBox.arr_struct_Choices[_i]);
	}
}

function reset_choice(_struct_Choice)
{
	_struct_Choice.struct_Textbox.arr_int_TB_CurrentEffects = [];
	_struct_Choice.struct_Textbox.struct_TextToDraw.arr_int_Text_CurrentEffects = [];
	_struct_Choice.float_Delay_CurrentTimer = _struct_Choice.float_Delay_Timer;
	
	reset_text_struct(_struct_Choice.struct_Textbox.struct_TextToDraw);
	//show_debug_message("Updated Choice Struct " + string(_struct_Choice));
}
function reset_dialoguebox(_struct_CurrentDialogueBox)
{
	reset_text_struct(_struct_CurrentDialogueBox.struct_Textbox.struct_TextToDraw);
	_struct_CurrentDialogueBox.float_AutoSkip_CurrentTimer = _struct_CurrentDialogueBox.float_AutoSkip_Timer;
	_struct_CurrentDialogueBox.int_CurrentChoice = 0;
}


function choice_dialoguebox_handler(_struct_CurrentDialogueBox, _bool_PressingInteract)
{
	var _struct_CurrentTextbox = _struct_CurrentDialogueBox.struct_Textbox;
	var _struct_TextToDraw = _struct_CurrentTextbox.struct_TextToDraw;
	
	var _bool_DoneTyping =  _struct_TextToDraw.bool_DoneTyping;
	var _bool_CanSkip = _struct_TextToDraw.bool_CanSkip;
	var _bool_AutoSkip = _struct_CurrentDialogueBox.bool_AutoSkip;
	
	var _int_VerticalKeys = get_vertical_pressed_input();
	var _int_HorizontalKeys = get_horizontal_pressed_input();
	
	draw_textbox_struct(_struct_CurrentTextbox)
	
	if(_bool_DoneTyping && _bool_AutoSkip)
	{
		auto_skip_handler(_struct_CurrentDialogueBox);
	}
	if(_bool_PressingInteract && _bool_CanSkip && !_bool_DoneTyping)
	{
		skip_text_compile(_struct_TextToDraw);
	}
	else if(_bool_DoneTyping)
	{
		var _arr_struct_Choices = _struct_CurrentDialogueBox.arr_struct_Choices;
		var _int_CurrentChoice = _struct_CurrentDialogueBox.int_CurrentChoice;
		var _bool_FinishedTypingChoices = true;
		
		for(var _i = 0; _i < array_length(_arr_struct_Choices); _i++)
		{
			if(!_arr_struct_Choices[_i].struct_Textbox.struct_TextToDraw.bool_DoneTyping)
				_bool_FinishedTypingChoices = false;
		}
		
		for(var _i = 0; _i < array_length(_arr_struct_Choices); _i++)
		{
			if(bool_InTextbox)
			{
				var _Current_Choice = _arr_struct_Choices[_i];
				var _bool_Selected = (_i == _int_CurrentChoice);
				var _float_DelayTimer = _Current_Choice.float_Delay_CurrentTimer;
				
				if(_float_DelayTimer > 0)
					 _Current_Choice.float_Delay_CurrentTimer -= 1/global.int_GameSpeed;
				else //done delay
					draw_choices_struct(_struct_CurrentDialogueBox, _Current_Choice, _bool_Selected, _bool_PressingInteract,_int_VerticalKeys, _int_HorizontalKeys, _i);
			}
		}
	}
}
function draw_choices_struct(_struct_CurrentDialogueBox, _struct_Choice, _bool_Selected, _bool_PressingInteract, _int_VerticalKeys, _int_HorizontalKeys, _int_CurrentPosition)
{
	var _struct_Textbox = _struct_Choice.struct_Textbox;
	var _struct_TextToDraw = _struct_Textbox.struct_TextToDraw;
	
	var _bool_DoneTyping =  _struct_TextToDraw.bool_DoneTyping;
	var _bool_CanSkip = _struct_TextToDraw.bool_CanSkip;
	var _bool_InstantInteract = _struct_TextToDraw.bool_InstantInteract;
	
	
	set_textbox_effects(_struct_Choice, _struct_Textbox, _struct_TextToDraw, _bool_Selected, _bool_PressingInteract);

	draw_textbox_struct(_struct_Textbox);
	
	if(_int_VerticalKeys != 0 && _bool_Selected && _struct_Choice.float_Delay_CurrentTimer <= 0) 
	{
		if(_int_VerticalKeys >= 0) //Upwards
			choice_changing_handler(_struct_CurrentDialogueBox, _struct_Choice.int_Up, _int_CurrentPosition);
		else
			choice_changing_handler(_struct_CurrentDialogueBox, _struct_Choice.int_Down, _int_CurrentPosition);
	}
	else if(_int_HorizontalKeys != 0 && _bool_Selected  && _struct_Choice.float_Delay_CurrentTimer <= 0)
	{
		if(_int_HorizontalKeys >= 0) //Right
			choice_changing_handler(_struct_CurrentDialogueBox, _struct_Choice.int_Right, _int_CurrentPosition);
		else
			choice_changing_handler(_struct_CurrentDialogueBox, _struct_Choice.int_Left, _int_CurrentPosition);
	}
	
	if(_bool_InstantInteract && _bool_PressingInteract && _bool_Selected) //Instant Interact
	{
		choice_close_handler(_struct_CurrentDialogueBox, _struct_Choice);
	}
	else if(_bool_PressingInteract && _bool_CanSkip && !_bool_DoneTyping)
	{
		skip_text_compile(_struct_TextToDraw);
	}
	else if(_bool_DoneTyping && _bool_PressingInteract && _bool_Selected)
	{
		choice_close_handler(_struct_CurrentDialogueBox, _struct_Choice);
	}
}


function choice_changing_handler(_struct_CurrentDialogueBox, _int_TargetNum, _int_CurrentPosition)
{
	if(_struct_CurrentDialogueBox.arr_struct_Choices[_int_TargetNum].float_Delay_CurrentTimer > 0)
		if(_int_TargetNum > _int_CurrentPosition && _int_CurrentPosition != 0)
			_struct_CurrentDialogueBox.int_CurrentChoice = 0;
		else
		{
			_int_TargetNum = array_length(_struct_CurrentDialogueBox.arr_struct_Choices) - 1;
			while(_struct_CurrentDialogueBox.arr_struct_Choices[_int_TargetNum].float_Delay_CurrentTimer > 0)
				_int_TargetNum--;
			_struct_CurrentDialogueBox.int_CurrentChoice = _int_TargetNum;
		}
	else
		_struct_CurrentDialogueBox.int_CurrentChoice = _int_TargetNum;
}
function choice_close_handler(_struct_CurrentDialogueBox, _struct_Choice)
{
	if(bool_InTextbox)
	{
		if(is_callable(_struct_Choice.method_Choice))
			method_call(_struct_Choice.method_Choice);
		close_dialoguebox(_struct_CurrentDialogueBox);
	}
}

function queue_Textbox_to_controller(_struct_Textbox)
{
	with(global.o_ctrl_Dialogue)
	{
		ds_queue_enqueue(queue_DialogueBox, _struct_Textbox);
	}
}

function load_default_choices(_struct_CurrentDialogueBox, _specialarr_Choices)
{
	var _int_NumOfChoices = array_length(_specialarr_Choices);
	var _arr_int_YPositions = get_choice_box_default_positions(_int_NumOfChoices);
	
	//show_debug_message("Num of Choices = " + string(_int_NumOfChoices));
	
	for(var _i = 0; _i < _int_NumOfChoices; _i++)
	{
		var _str_Text = _specialarr_Choices[_i][int_DefaultChoice.TEXT];
		var _method_Choice = _specialarr_Choices[_i][int_DefaultChoice.METHOD];
		var _float_TypeSpeed = _specialarr_Choices[_i][int_DefaultChoice.TYPESPEED];
		var _spr_Textbox = _specialarr_Choices[_i][int_DefaultChoice.TEXTBOX_SPRITE];
		var _fn_Font = _specialarr_Choices[_i][int_DefaultChoice.FONT];
		var _float_Scale = _specialarr_Choices[_i][int_DefaultChoice.TEXT_SCALE];
		var _float_Delay = _specialarr_Choices[_i][int_DefaultChoice.DELAY];
		var _bool_InstantType = _specialarr_Choices[_i][int_DefaultChoice.INSTANT_TYPE];
		var _bool_TextCentered = _specialarr_Choices[_i][int_DefaultChoice.TEXT_CENTERED];
	
		var _YPosition = _arr_int_YPositions[_i];
		
		var _Current_ChoiceStruct = 
		{
			struct_Textbox: {
				spr_Textbox: _spr_Textbox,
				int_TB_xPos: INT_CHOICE_DEFAULT_X,
				int_TB_yPos: _YPosition,
				int_TB_Width: INT_CHOICE_DEFAULT_WIDTH,
				int_TB_Height: INT_CHOICE_DEFAULT_HEIGHT,
		
				arr_int_TB_CurrentEffects: [],
		
				struct_TextToDraw: 
				{
					int_Text_RelativeXPos: INT_TEXT_DEFAULT_RELATIVE_X,
					int_Text_RelativeYPos: INT_CHOICE_DEFAULT_TEXT_RELATIVE_Y,
					int_Text_Width: INT_CHOICE_DEFAULT_TEXT_WIDTH,
					int_Text_yOffset: INT_TEXT_DEFAULT_Y_OFFSET,
					bool_TextPosCentered: _bool_TextCentered,

					str_Text: _str_Text,
					fn_TargetFont: _fn_Font,
					int_xScale: _float_Scale,
					int_yScale: _float_Scale,
		
					arr_int_Text_CurrentEffects: [],
					float_TypeSpeed: _float_TypeSpeed,
	
					arr_str_LinesToPrint: [""],
					int_TotalLines: 1,
					float_CurrentStringWidth: 0,
					arr_str_CurrentWords: string_split_ext(_str_Text, [" "], true),
					int_TotalWords: array_length(string_split_ext(_str_Text, [" "], true)),
					int_CurrentWordIndex: 0,
					int_CurrentCharIndex: 1,
					float_NumOfCharsToAdd: 0,
	
					bool_StartTyping: false,
					bool_DoneTyping: false,
			
					bool_CanSkip: true,
					bool_InstantInteract: false,
					
					bool_InstantType: _bool_InstantType
				}
			},
			int_Up: boundary_choice_input(_int_NumOfChoices, _i-1),
			int_Down: boundary_choice_input(_int_NumOfChoices, _i+1),
			int_Right: _i,
			int_Left: _i,
			
			float_Delay_Timer: _float_Delay,
			float_Delay_CurrentTimer: _float_Delay,
			
			arr_int_TB_RegularEffects: [],
			arr_int_TB_SelectedEffects: [],
			arr_int_TB_InteractedEffects: [],
			arr_int_Text_RegularEffects: [],
			arr_int_Text_SelectedEffects: [int_text_effect.YELLOW_TEXT],
			arr_int_Text_InteractedEffects: [],
		
			method_Choice: _method_Choice
		}
		array_push(_struct_CurrentDialogueBox.arr_struct_Choices, _Current_ChoiceStruct);
	}
}
function get_choice_box_default_positions(_int_NumOfChoices)
{
	var _arr_int_Positions;
	switch(_int_NumOfChoices)
	{
		case 1:
			_arr_int_Positions = [INT_CHOICE_DEFAULT_ONE_MIDDLE_Y];
		break;
		case 2:
			_arr_int_Positions = [INT_CHOICE_DEFAULT_TWO_1_MIDDLE_Y - INT_CHOICE_DEFAULT_VERTICAL_OFFSET/2, INT_CHOICE_DEFAULT_TWO_2_MIDDLE_Y + INT_CHOICE_DEFAULT_VERTICAL_OFFSET/2];
		break;
		case 3:
			_arr_int_Positions = [INT_CHOICE_DEFAULT_THREE_1_MIDDLE_Y - INT_CHOICE_DEFAULT_VERTICAL_OFFSET/2, INT_CHOICE_DEFAULT_THREE_2_MIDDLE_Y, INT_CHOICE_DEFAULT_THREE_3_MIDDLE_Y + INT_CHOICE_DEFAULT_VERTICAL_OFFSET/2];
		break;
		case 4:
			_arr_int_Positions = [INT_CHOICE_DEFAULT_FOUR_1_MIDDLE_Y, INT_CHOICE_DEFAULT_FOUR_2_MIDDLE_Y, INT_CHOICE_DEFAULT_FOUR_3_MIDDLE_Y, INT_CHOICE_DEFAULT_FOUR_4_MIDDLE_Y];
		break;
		
		default:
			show_error("Invalid number of choices for a default sign, please make a new object", true);
			break;
	}
	
	return _arr_int_Positions;
}
