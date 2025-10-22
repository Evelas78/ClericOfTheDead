/*
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
			int_Text_RelativeXPos: INT_TEXT_DEFAULT_RELATIVE_X,
			int_Text_RelativeYPos: INT_TEXT_DEFAULT_RELATIVE_Y,
			int_Text_Width: INT_TEXT_DEFAULT_WIDTH,
			int_Text_yOffset: INT_TEXT_DEFAULT_Y_OFFSET,
			bool_TextPosCentered: true,

			str_Text: str_CurrentString,
			fn_TargetFont: fn_TargetFont,
			int_xScale: 1,
			int_yScale: 1,
		
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
			bool_InstantInteract: false,
			bool_InstantType: bool_InstantType
		}
	}
*/


function set_textbox_effects(_struct_StructWithEffects, _struct_Textbox, _struct_TextToDraw, _bool_Selected, _bool_PressingInteract)
{
	if(_bool_Selected && _bool_PressingInteract)
	{
		_struct_TextToDraw.arr_int_Text_CurrentEffects = _struct_StructWithEffects.arr_int_Text_InteractedEffects;
		_struct_Textbox.arr_int_TB_CurrentEffects = _struct_StructWithEffects.arr_int_TB_InteractedEffects;
	}
	else if(_bool_Selected)
	{
		_struct_TextToDraw.arr_int_Text_CurrentEffects = _struct_StructWithEffects.arr_int_Text_SelectedEffects;
		_struct_Textbox.arr_int_TB_CurrentEffects = _struct_StructWithEffects.arr_int_TB_SelectedEffects;
	}
	else
	{
		_struct_TextToDraw.arr_int_Text_CurrentEffects = _struct_StructWithEffects.arr_int_Text_RegularEffects;
		_struct_Textbox.arr_int_TB_CurrentEffects = _struct_StructWithEffects.arr_int_TB_RegularEffects;
	}

}

function reset_text_struct(_struct_TextToDraw)
{	
	_struct_TextToDraw.int_CurrentCharIndex = 1;
	_struct_TextToDraw.int_CurrentWordIndex = 0;
	_struct_TextToDraw.float_CurrentStringWidth = 0;
	_struct_TextToDraw.float_NumOfCharsToAdd = 0;
	
	_struct_TextToDraw.arr_str_LinesToPrint = [""];
	_struct_TextToDraw.int_TotalLines = 1;
	_struct_TextToDraw.float_CurrentStringWidth = 0;
	
	_struct_TextToDraw.bool_DoneTyping= false;
	_struct_TextToDraw.bool_StartTyping = false;
}

function draw_textbox_struct(_struct_CurrentTextbox)
{
	draw_textbox_to_screen(_struct_CurrentTextbox);
	draw_text_struct(_struct_CurrentTextbox.struct_TextToDraw, _struct_CurrentTextbox.int_TB_xPos, _struct_CurrentTextbox.int_TB_yPos);
}
function draw_text_struct(_struct_TextToDraw, _int_Base_xPos, _int_Base_yPos)
{
	if(!_struct_TextToDraw.bool_DoneTyping)
	{
		if(_struct_TextToDraw.bool_InstantType)
			skip_text_compile(_struct_TextToDraw);
		else
			regular_text_compile(_struct_TextToDraw)
	}
	draw_text_to_screen(_struct_TextToDraw, _int_Base_xPos, _int_Base_yPos);
}

function draw_text_to_screen(_struct_TextToDraw, _int_Base_xPos, _int_Base_yPos)
{
	//**
		//show_debug_message(_specialarr_dialogue_textbox);
	//**
	
	draw_set_font(_struct_TextToDraw.fn_TargetFont);
	
	var _float_Text_StartXPos = _struct_TextToDraw.int_Text_RelativeXPos + _int_Base_xPos;
	var _float_Text_StartYPos = _struct_TextToDraw.int_Text_RelativeYPos + _int_Base_yPos;
	
	var _float_Text_yOffset = _struct_TextToDraw.int_Text_yOffset;
	
	var _float_xScale = _struct_TextToDraw.int_xScale;
	var _float_yScale = _struct_TextToDraw.int_yScale;
	
	for(var _i = 0; _i < array_length(_struct_TextToDraw.arr_int_Text_CurrentEffects); _i++)
		draw_text_effects(_struct_TextToDraw.arr_int_Text_CurrentEffects[_i]);	
	if(_struct_TextToDraw.bool_TextPosCentered)
	{
		var _int_ExpectNumOfLines = ceil(string_width(_struct_TextToDraw.str_Text) / _struct_TextToDraw.int_Text_Width);
		var _float_TotalHeight = string_height("ABCDEFGHIJKLMNOPQRSTUVWXYZ") *_float_yScale + _float_Text_yOffset * (_int_ExpectNumOfLines - 1);
		
		_float_Text_StartYPos -= _float_TotalHeight / 2;
		
		for(var _i = 0; _i <  array_length(_struct_TextToDraw.arr_str_LinesToPrint); _i++)
		{
			var _float_additional_y = _i * _float_Text_yOffset;
			draw_text_transformed(_float_Text_StartXPos - (string_width(_struct_TextToDraw.arr_str_LinesToPrint[_i]) *_float_xScale)/2, _float_Text_StartYPos + _float_additional_y, _struct_TextToDraw.arr_str_LinesToPrint[_i], _float_xScale, _float_yScale, 0);
		}
	}
	else
	{
		for(var _i = 0; _i <  array_length(_struct_TextToDraw.arr_str_LinesToPrint); _i++)
		{
			var _float_additional_y = _i * _float_Text_yOffset;
			draw_text_transformed(_float_Text_StartXPos, _float_Text_StartYPos + _float_additional_y, _struct_TextToDraw.arr_str_LinesToPrint[_i], _float_xScale, _float_yScale, 0);
		}
	}
	reset_draw_state();
}
function draw_textbox_to_screen(_struct_CurrentTextbox){
	var _spr_textbox = _struct_CurrentTextbox.spr_Textbox;
	
	var _int_xPos = _struct_CurrentTextbox.int_TB_xPos;	
	var _int_yPos = _struct_CurrentTextbox.int_TB_yPos;
	var _int_Width = _struct_CurrentTextbox.int_TB_Width;
	var _int_Height = _struct_CurrentTextbox.int_TB_Height;
	
	var _float_TB_xScale = _int_Width/sprite_get_width(_spr_textbox);
	var _float_TB_yScale = _int_Height/sprite_get_height(_spr_textbox); 
	
	for(var _i = 0; _i < array_length(_struct_CurrentTextbox.arr_int_TB_CurrentEffects); _i++)
		draw_TB_effects(_struct_CurrentTextbox.arr_int_TB_CurrentEffects[_i]);	
	
	draw_sprite_ext(
		_spr_textbox, //textbox sprite
		image_index, //index of sprite, imageindex used so it works with animation, rather than being static
		_int_xPos, //start x
		_int_yPos, //start y
		_float_TB_xScale, 
		_float_TB_yScale,
		0, //rotation 
		c_white, //color
		1 //alpha
	);
	reset_draw_state();
}

function parse_text_to_draw(_struct_TextToDraw)
{
	draw_set_font(_struct_TextToDraw.fn_TargetFont);
	
	var _float_xScale = _struct_TextToDraw.int_xScale;
	
	var _float_MaxLength = _struct_TextToDraw.int_Text_Width;
	var _float_SpaceWidth = string_width(" ") * _float_xScale;
	
	//Current line we want to edit
	var _Current_Line = _struct_TextToDraw.arr_str_LinesToPrint[_struct_TextToDraw.int_TotalLines-1];
	
	var _arr_str_CurrentWords = _struct_TextToDraw.arr_str_CurrentWords;
	var _int_TotalWords = _struct_TextToDraw.int_TotalWords;
	
	var _str_CurrentWord = _arr_str_CurrentWords[ _struct_TextToDraw.int_CurrentWordIndex];
	var _float_WordLength = string_length(_str_CurrentWord);
	
	//Add the first words length, its the only the one thatll miss the check at the end
	if(!_struct_TextToDraw.bool_StartTyping)
		first_word_handling(_struct_TextToDraw, _str_CurrentWord, _float_xScale);
	
	//Count down the chars until it becomes a fraction or 0
	for(var _i = _struct_TextToDraw.float_NumOfCharsToAdd; _i >= 1; _i--)
	{		
		_Current_Line += add_new_character(_struct_TextToDraw, _str_CurrentWord)
		
		//If we will pass the word in the next character
		if( _struct_TextToDraw.int_CurrentCharIndex > _float_WordLength)
		{
			_Current_Line += move_to_next_word(_struct_TextToDraw, _float_SpaceWidth);
			_struct_TextToDraw.float_NumOfCharsToAdd--;
			
			//If the current word index is greater than the length of the worsd array, thus we are done
			if(_struct_TextToDraw.int_CurrentWordIndex >= _struct_TextToDraw.int_TotalWords)
			{
				finish_typing(_struct_TextToDraw, _Current_Line, _struct_TextToDraw.int_TotalLines)
				return;
			}
			else //We need to check if this next word will go over our alloted length
			{
				//show_debug_message(_float_MaxLength);
				//show_debug_message(_struct_TextToDraw.float_CurrentStringWidth);
				_Current_Line = new_word_handling(_struct_TextToDraw, _arr_str_CurrentWords, _float_MaxLength, _Current_Line, _float_xScale);
				_str_CurrentWord = _arr_str_CurrentWords[ _struct_TextToDraw.int_CurrentWordIndex];
				_float_WordLength = string_length(_str_CurrentWord);
			}
		}
	}
	
	_struct_TextToDraw.arr_str_LinesToPrint[_struct_TextToDraw.int_TotalLines-1] = _Current_Line;
	
	//**
		//show_debug_message("Current Line After Parsing " + _struct_TextToDraw.arr_str_LinesToPrint[_struct_TextToDraw.int_TotalLines - 1]);
		//show_debug_message("Target Line " + _struct_TextToDraw.str_Text);
		//show_debug_message("Current Structure" + _struct_TextToDraw);
	//**
	
	return;
}
function finish_typing(_struct_TextToDraw, _Current_Line, _int_TotalLines)
{
	_Current_Line = string_delete(_Current_Line, string_length(_Current_Line), 1);
	_struct_TextToDraw.arr_str_LinesToPrint[_int_TotalLines-1] = _Current_Line;
	_struct_TextToDraw.bool_DoneTyping = true;
}
function new_word_handling(_struct_TextToDraw, _arr_str_CurrentWords, _float_MaxLength, _Current_Line, _float_xScale)
{
	//Get next word
	var _str_CurrentWord = _arr_str_CurrentWords[_struct_TextToDraw.int_CurrentWordIndex];
				
	var _float_WordWidth = string_width(_str_CurrentWord) * _float_xScale;

	if(_struct_TextToDraw.float_CurrentStringWidth + _float_WordWidth > _float_MaxLength)
	{
		//Load current line into the struct
		 _Current_Line = string_delete(_Current_Line, string_length(_Current_Line), 1);
		show_debug_message(_Current_Line);
		_struct_TextToDraw.arr_str_LinesToPrint[_struct_TextToDraw.int_TotalLines - 1] = _Current_Line;
					
		//Next we move the next line
		_struct_TextToDraw.int_TotalLines++;
		_struct_TextToDraw.arr_str_LinesToPrint[_struct_TextToDraw.int_TotalLines - 1] = "";
		_struct_TextToDraw.float_CurrentStringWidth = 0;
		
		_Current_Line = "";
	}
				
	_struct_TextToDraw.float_CurrentStringWidth +=  _float_WordWidth;
	
	return _Current_Line;
}
function move_to_next_word(_struct_TextToDraw, _float_SpaceWidth)
{
	_struct_TextToDraw.float_CurrentStringWidth += _float_SpaceWidth;

	//Reset curr character index and move to the next word
	_struct_TextToDraw.int_CurrentCharIndex = 1;
	_struct_TextToDraw.int_CurrentWordIndex += 1;
		
	return " ";
}
function first_word_handling(_struct_TextToDraw,_str_CurrentWord, _float_xScale)
{
	var _float_first_word_width = string_width(_str_CurrentWord) * _float_xScale;
	_struct_TextToDraw.float_CurrentStringWidth += _float_first_word_width;
	_struct_TextToDraw.bool_StartTyping = true;	
}
function add_new_character(_struct_TextToDraw, _str_CurrentWord)
{
	var _Current_Character = string_char_at(_str_CurrentWord, _struct_TextToDraw.int_CurrentCharIndex);		
	
	_struct_TextToDraw.float_NumOfCharsToAdd--;
	_struct_TextToDraw.int_CurrentCharIndex++;
	
	return _Current_Character;
}
function regular_text_compile(_struct_TextToDraw)
{
	_struct_TextToDraw.float_NumOfCharsToAdd += _struct_TextToDraw.float_TypeSpeed/global.int_GameSpeed;
	parse_text_to_draw(_struct_TextToDraw);
}
function skip_text_compile(_struct_TextToDraw)
{
	_struct_TextToDraw.float_NumOfCharsToAdd = 300000000000;
	parse_text_to_draw(_struct_TextToDraw);	
}

function draw_text_effects(_int_TargetEffect)
{
	switch(_int_TargetEffect)
	{
		case int_text_effect.YELLOW_TEXT:
			draw_set_color(c_yellow);
			break;
	}
}

function draw_TB_effects(_int_TargetEffect)
{
	
}

function boundary_choice_input(_int_NumOfChoices, _int_TargetNum)
{
	if(_int_TargetNum <= -1)
		_int_TargetNum = _int_NumOfChoices - 1;
	else if(_int_TargetNum >= _int_NumOfChoices)
		_int_TargetNum = 0;
	return _int_TargetNum;
}
