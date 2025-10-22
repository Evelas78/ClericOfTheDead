function prep_hero_template_structs()
{
	global.arr_struct_HeroTemplates = [];
	
	global.arr_struct_HeroTemplates[int_HeroTemplates.PLACEHOLDER] = 
	{
		o_be_Target: o_be_hero_PlaceholderHero,
		spr_DisplaySprite: spr_placeholder_blue,
		int_tCurrentHP: 1,
		int_tCurrentElyst: 1,
		arr_int_CurrentMoves: [int_Moves.BASIC_ONE, int_Moves.ABILITY_ONE, int_Moves.ULTIMATE],
		arr_int_Items: []
	}

}
function battle_prep_info(_arr_o_SentEnemies)
{
	global.o_ctrl_Battle.arr_o_EnemyLoadOrder = _arr_o_SentEnemies;
}
function change_hero_load_order(_arr_o_NewLoadOrder)
{
	global.arr_int_HeroLoadOrder = _arr_o_NewLoadOrder;
}
function initialize_battle()
{
	for(var _i = 0; _i < array_length(global.arr_int_HeroLoadOrder); _i++)
	{
		if(array_length(global.arr_int_HeroLoadOrder) == 3)
		{
			switch(_i)
			{
				case 0:
					arr_o_HeroBattle[0] = create_hero_battle_entity_instance(FLOAT_BATTLE_HERO_LOCATION_X *  + FLOAT_BATTLE_HERO_SEPERATION_X, FLOAT_BATTLE_HERO_LOCATION_Y + FLOAT_BATTLE_HERO_SEPERATION_Y/2, global.arr_int_HeroLoadOrder[0]);
					arr_o_HeroBattle[0].depth = 90;
				break;
				case 1:
					arr_o_HeroBattle[1] = create_hero_battle_entity_instance(FLOAT_BATTLE_HERO_LOCATION_X, FLOAT_BATTLE_HERO_LOCATION_Y - FLOAT_BATTLE_HERO_SEPERATION_Y + FLOAT_BATTLE_HERO_SEPERATION_Y/2, global.arr_int_HeroLoadOrder[1]);
					arr_o_HeroBattle[1].depth = 100;
				break;
				case 2:
					arr_o_HeroBattle[2] = create_hero_battle_entity_instance(FLOAT_BATTLE_HERO_LOCATION_X - FLOAT_BATTLE_HERO_SEPERATION_X, FLOAT_BATTLE_HERO_LOCATION_Y + FLOAT_BATTLE_HERO_SEPERATION_Y/2, global.arr_int_HeroLoadOrder[2]);
					arr_o_HeroBattle[2].depth = 91;
				break;
			}
		}
		else 
		{
			switch(_i)
			{
				case 0:
					arr_o_HeroBattle[0] = create_hero_battle_entity_instance(FLOAT_BATTLE_HERO_LOCATION_X + FLOAT_BATTLE_HERO_SEPERATION_X, FLOAT_BATTLE_HERO_LOCATION_Y, global.arr_int_HeroLoadOrder[0]);
					arr_o_HeroBattle[0].depth = 90;
				break;
				case 1:
					arr_o_HeroBattle[1] = create_hero_battle_entity_instance(FLOAT_BATTLE_HERO_LOCATION_X, FLOAT_BATTLE_HERO_LOCATION_Y - FLOAT_BATTLE_HERO_SEPERATION_Y, global.arr_int_HeroLoadOrder[1]);
					arr_o_HeroBattle[1].depth = 100;
				break;
				case 2:
					arr_o_HeroBattle[2] = create_hero_battle_entity_instance(FLOAT_BATTLE_HERO_LOCATION_X - FLOAT_BATTLE_HERO_SEPERATION_X, FLOAT_BATTLE_HERO_LOCATION_Y, global.arr_int_HeroLoadOrder[2]);
					arr_o_HeroBattle[2].depth = 91;
				break;
				case 3:
					arr_o_HeroBattle[3] = create_hero_battle_entity_instance(FLOAT_BATTLE_HERO_LOCATION_X, FLOAT_BATTLE_HERO_LOCATION_Y + FLOAT_BATTLE_HERO_SEPERATION_Y, global.arr_int_HeroLoadOrder[3]);
					arr_o_HeroBattle[3].depth = 80;
				break;
			}
		}
	}
	
	for(var _i = 0; _i < array_length(arr_o_EnemyLoadOrder); _i++)
	{
		switch(_i)
		{
			case 0:
				if(arr_o_EnemyLoadOrder[_i] == noone) {
					arr_o_EnemyBattle[1][0] = INT_NONE;
				} 
				else
				{
					arr_o_EnemyBattle[1][0] = create_enemy_battle_entity_instance(FLOAT_BATTLE_ENEMY_LOCATION_X - FLOAT_BATTLE_ENEMY_SEPERATION_X, FLOAT_BATTLE_ENEMY_LOCATION_Y, arr_o_EnemyLoadOrder[0]);
					arr_o_EnemyBattle[1][0].depth = 90;
				}
			break;
			case 1:
				if(arr_o_EnemyLoadOrder[_i] == noone) {
					arr_o_EnemyBattle[0][0] = INT_NONE;
				} 
				else
				{
					arr_o_EnemyBattle[0][0] = create_enemy_battle_entity_instance(FLOAT_BATTLE_ENEMY_LOCATION_X - FLOAT_BATTLE_ENEMY_SEPERATION_X * FLOAT_BATTLE_ENEMY_DIAGONAL_SEPERATION_FACTOR, FLOAT_BATTLE_ENEMY_LOCATION_Y - FLOAT_BATTLE_ENEMY_SEPERATION_Y * FLOAT_BATTLE_ENEMY_DIAGONAL_SEPERATION_FACTOR, arr_o_EnemyLoadOrder[1]);
					arr_o_EnemyBattle[0][0].depth = 101;
				}
			break;
			case 2:
				if(arr_o_EnemyLoadOrder[_i] == noone) {
					arr_o_EnemyBattle[0][1] = INT_NONE;
				} 
				else
				{
					arr_o_EnemyBattle[0][1] = create_enemy_battle_entity_instance(FLOAT_BATTLE_ENEMY_LOCATION_X, FLOAT_BATTLE_ENEMY_LOCATION_Y - FLOAT_BATTLE_ENEMY_SEPERATION_Y,  arr_o_EnemyLoadOrder[2]);
					arr_o_EnemyBattle[0][1].depth = 100;
				}
			break;
			case 3:
				if(arr_o_EnemyLoadOrder[_i] == noone) {
					arr_o_EnemyBattle[0][2] = INT_NONE;
				} 
				else
				{
					arr_o_EnemyBattle[0][2] = create_enemy_battle_entity_instance(FLOAT_BATTLE_ENEMY_LOCATION_X + FLOAT_BATTLE_ENEMY_SEPERATION_X * FLOAT_BATTLE_ENEMY_DIAGONAL_SEPERATION_FACTOR, FLOAT_BATTLE_ENEMY_LOCATION_Y - FLOAT_BATTLE_ENEMY_SEPERATION_Y * FLOAT_BATTLE_ENEMY_DIAGONAL_SEPERATION_FACTOR,  arr_o_EnemyLoadOrder[3]);
					arr_o_EnemyBattle[0][2].depth = 102;
				}
			break;
			case 4:
				if(arr_o_EnemyLoadOrder[_i] == noone) {
					arr_o_EnemyBattle[1][1] = INT_NONE;
				} 
				else
				{
					arr_o_EnemyBattle[1][1] = create_enemy_battle_entity_instance(FLOAT_BATTLE_ENEMY_LOCATION_X + FLOAT_BATTLE_ENEMY_SEPERATION_X, FLOAT_BATTLE_ENEMY_LOCATION_Y,  arr_o_EnemyLoadOrder[4]);
					arr_o_EnemyBattle[1][1].depth = 91;
				}
			break;
			case 5:
				if(arr_o_EnemyLoadOrder[_i] == noone) {
					arr_o_EnemyBattle[2][2] = INT_NONE;
				} 
				else
				{
					arr_o_EnemyBattle[2][2] = create_enemy_battle_entity_instance(FLOAT_BATTLE_ENEMY_LOCATION_X + FLOAT_BATTLE_ENEMY_SEPERATION_X * FLOAT_BATTLE_ENEMY_DIAGONAL_SEPERATION_FACTOR, FLOAT_BATTLE_ENEMY_LOCATION_Y + FLOAT_BATTLE_ENEMY_SEPERATION_Y * FLOAT_BATTLE_ENEMY_DIAGONAL_SEPERATION_FACTOR,  arr_o_EnemyLoadOrder[5]);
					arr_o_EnemyBattle[2][2].depth = 82;
				}
			break;
			case 6:
				if(arr_o_EnemyLoadOrder[_i] == noone) {
					arr_o_EnemyBattle[2][1] = INT_NONE;
				} 
				else
				{
					arr_o_EnemyBattle[2][1] = create_enemy_battle_entity_instance(FLOAT_BATTLE_ENEMY_LOCATION_X, FLOAT_BATTLE_ENEMY_LOCATION_Y + FLOAT_BATTLE_ENEMY_SEPERATION_Y,  arr_o_EnemyLoadOrder[6]);
					arr_o_EnemyBattle[2][1].depth = 80;
				}
			break;
			case 7:
				if(arr_o_EnemyLoadOrder[_i] == noone) {
					arr_o_EnemyBattle[2][0] = INT_NONE;
				} 
				else
				{
					arr_o_EnemyBattle[2][0] = create_enemy_battle_entity_instance(FLOAT_BATTLE_ENEMY_LOCATION_X - FLOAT_BATTLE_ENEMY_SEPERATION_X * FLOAT_BATTLE_ENEMY_DIAGONAL_SEPERATION_FACTOR, FLOAT_BATTLE_ENEMY_LOCATION_Y + FLOAT_BATTLE_ENEMY_SEPERATION_Y * FLOAT_BATTLE_ENEMY_DIAGONAL_SEPERATION_FACTOR, arr_o_EnemyLoadOrder[7]);
					arr_o_EnemyBattle[2][0].depth = 81;
				}
			break;
		}
		
	}
	
	//
		show_debug_message(arr_o_EnemyBattle);
	//
	
	lift_transition();
}

function create_hero_battle_entity_instance(_int_xPos, _int_yPos, _o_Number)
{
	if(_o_Number = INT_NONE)
		return -1;
	var _o_Template = global.arr_struct_HeroTemplates[_o_Number];
	var _o_be_Current = instance_create_layer(_int_xPos, _int_yPos, STR_BATTLE_LAYER, _o_Template.o_be_Target);
	with(_o_be_Current)
	{
		arr_int_CurrentMoves = _o_Template.arr_int_CurrentMoves;
		arr_struct_Items = load_current_items(_o_Template.arr_int_Items);
		int_tHP = int_tMaxHP * _o_Template.int_tCurrentHP;
		int_tCurrentElyst = int_tMaxElyst * _o_Template.int_tCurrentElyst;
		load_current_moves();
	}
	return _o_be_Current;
}
function create_enemy_battle_entity_instance(_int_xPos, _int_yPos, _o_Target)
{
	if(_o_Target == noone)
		return -1;
	var _o_be_Current = instance_create_layer(_int_xPos, _int_yPos, STR_BATTLE_LAYER, _o_Target);
	
	with(_o_be_Current)
	{
		load_current_moves();
	}
	return _o_be_Current;
}

function load_current_items(_arr_int_Items)
{
	var _arr_struct_Items = [];
	for(var _i = 0; _i < array_length(_arr_int_Items); _i++)
	{
		array_push(_arr_struct_Items, item_switch(_arr_int_Items[_i]));
	}
	return _arr_struct_Items;
}
function item_switch(_int_Target)
{
	switch(_int_Target)
	{
		default:
			show_error("Invalid item", true);
			break;
	}
	return {};
}
function load_current_moves()
{
	for(var _i = 0; _i < array_length(arr_int_CurrentMoves); _i++)
	{
		var _int_CurrentMove = arr_int_CurrentMoves[_i];
		if(_int_CurrentMove <= int_Moves.BASIC_FIVE)
			array_push(arr_struct_Basic, arr_struct_MovesCompendium[_int_CurrentMove]);
		else if(_int_CurrentMove <= int_Moves.ABILITY_FIVE)
			array_push(arr_struct_Abilities, arr_struct_MovesCompendium[_int_CurrentMove]);
		else if(_int_CurrentMove == int_Moves.ULTIMATE)
			struct_Ultimate = arr_struct_MovesCompendium[_int_CurrentMove];
	}
}

function countdown_turns(_int_Number)
{
	for(var _i = 0; _i < array_length(arr_o_HeroBattle); _i++)
	{
		if(arr_o_HeroBattle[_i] != -1)
			reduce_turn_counter(arr_o_HeroBattle[_i], _int_Number);
	}
	for(var _i = 0; _i < array_length(arr_o_EnemyBattle); _i++)
	{
		for(var _v = 0; _v < array_length(arr_o_EnemyBattle[_i]); _v++)
		{
			if(arr_o_EnemyBattle[_i][_v] != INT_NONE)
				reduce_turn_counter(arr_o_EnemyBattle[_i][_v], _int_Number);
		}
	}
}
function load_turn_order_queue()
{
	for(var _i = 0; _i < array_length(arr_o_HeroBattle); _i++)
	{
		if(arr_o_HeroBattle[_i] != INT_NONE && arr_o_HeroBattle[_i].int_tTurnsLeft <= 0)
			ds_queue_enqueue(queue_TurnOrder, arr_o_HeroBattle[_i]);
	}
	for(var _i = 0; _i < array_length(arr_o_EnemyBattle); _i++)
	{
		for(var _v = 0; _v < array_length(arr_o_EnemyBattle[_i]); _v++)
		{
			if(arr_o_EnemyBattle[_i][_v] != INT_NONE && arr_o_EnemyBattle[_i][_v].int_tTurnsLeft <= 0)
				ds_queue_enqueue(queue_TurnOrder, arr_o_EnemyBattle[_i][_v]);
		}
	}
}
function generate_turn(_int_Speed)
{
	var _int_StartingTurn = random_range(ceil(_int_Speed/2), _int_Speed)	;
	return _int_StartingTurn;
}
function generate_random_pause(_int_Speed)
{
	var _float_RandomPause = random_range(_int_Speed/2, _int_Speed)	;
	return _float_RandomPause;	
}
function reduce_turn_counter(_o_be_TargetInstance, _int_Number)
{
	with(_o_be_TargetInstance)
	{
		int_tTurnsLeft -= _int_Number;
		if(int_tTurnsLeft < 0)
			int_tTurnsLeft = 0;
	}
}
function reduce_health(_o_be_TargetInstance, _int_Number)
{
	with(_o_be_TargetInstance)
	{
		int_hp -= _int_Number;
		if(int_hp < 0)
		{
			int_hp = 0;
			bool_tDowned = true;
		}
	}
}

function player_prepare_battle()
{
	float_PlayerPrepare_Timer += 1/global.int_GameSpeed;	
	
	if(float_PlayerPrepare_Timer >= 3)
	{
		
	}
	else if(float_PlayerPrepare_Timer >= 2)
	{
		
	}
	else if(float_PlayerPrepare_Timer >= 1)
	{
		
	}
}
function player_control_start_battle()
{
	float_PlayerPrepare_Timer = 0;
	global.int_BattleState = int_battle_state.BATTLE_PLAYING;
}

function clear_current_turn()
{
	global.o_be_CurrentCharacter.bool_CompletedTurn = false;
	global.o_be_CurrentCharacter = -1;
}
function set_up_new_current_turn()
{
	global.o_be_CurrentCharacter = ds_queue_dequeue(queue_TurnOrder);	
	global.o_be_CurrentCharacter.bool_Selected = true;
					
	//
		show_debug_message("Queued a character");
	//
}

function reset_battle_controller()
{
	global.bool_SuppressMenu = true;
	int_TargetingType = INT_NONE;
	struct_TargetMove = {};
	bool_NullSelectable = false;
	bool_Highlighted = false;
	int_TargetSelector = 10; 
}

function targeting_switch_controller()
{
	if(bool_FramePause)
	{
		bool_FramePause = false;
		return;
	}
	switch(int_TargetingType)
	{
		case int_TypeOfTargeting.ALLY_PARTY:
			handle_ally_party_targeting();
			break;
		case int_TypeOfTargeting.ALLY_RANDOM:
			//Set all heroes selected
			break;
		case int_TypeOfTargeting.ALLY_SELECTIVE:
			handle_ally_selective_targeting();
			break;
		case int_TypeOfTargeting.ALLY_SELF:
			//Set self targeted
			break;
		case int_TypeOfTargeting.ALLY_SPECIFIC:
			show_error("We havent implemented Ally Specific Targeting yet " + global.o_be_CurrentCharacter.name, true);
			break;
		case int_TypeOfTargeting.ENEMY_AREA:
			show_error("We haven't implemented area attacks yet " + global.o_be_CurrentCharacter.name, true);
			break;
		case int_TypeOfTargeting.ENEMY_PARTY:
			//Set all enemies targeted
			break;
		case int_TypeOfTargeting.ENEMY_RANDOM:
			//Set all enemies targeted
			break;
		case int_TypeOfTargeting.ENEMY_SELECTIVE:
			handle_enemy_selective_targeting();
			break;
		case int_TypeOfTargeting.ENEMY_SPECIFIC:
			show_error("We havent implemented Enemy Specific Targeting yet " + _Current_Owner.name, true);
			break;
		default:
			show_error("Invalid targetting type for " + _Current_Owner.name, true);
			break;
	}
}
function hero_move_chosen(_int_TargetMove)
{
	global.bool_SuppressMenu = true;
	with(global.o_ctrl_Battle)
	{
		struct_TargetMove = global.o_be_CurrentCharacter.arr_struct_MovesCompendium[_int_TargetMove];
		int_TargetingType = struct_TargetMove.int_TypeOfTarget;
		bool_FramePause = true;
	}
}

function target_control_handler_enemy_side()
{
	var _int_VerticalInput = get_vertical_pressed_input();
	var _int_HorizontalInput = get_horizontal_pressed_input();
	
	var _int_Row = int_TargetSelector / 10;
	var _int_Col = int_TargetSelector % 10;
	
	var _int_OriginalTarget = int_TargetSelector;
	
	if(_int_VerticalInput != 0)
		_int_Row += -1 * _int_VerticalInput;
	
	//Clamp int_TargetSelector if necessary. We do it outside so that if we somehow go into an invalid, we still fix it.
	_int_Row = clamp(_int_Row, 0, 2)
	
	if(_int_HorizontalInput != 0)
		_int_Col += _int_HorizontalInput;
	
	//Clamp Horizontals
	if(_int_Row == 1)
		_int_Col = clamp(_int_Col, 0, 1)
	else
		_int_Col = clamp(_int_Col, 0, 2)
	
	int_TargetSelector = _int_Row * 10 + _int_Col;
	show_debug_message(int_TargetSelector);
	if(int_TargetSelector != _int_OriginalTarget)
		handle_consider_coloring(get_target(false, _int_OriginalTarget), false);
}
function target_control_handler_hero_side()
{
	var _int_VerticalInput = get_vertical_pressed_input();
	var _int_HorizontalInput = get_horizontal_pressed_input();
	
	if(_int_VerticalInput)
	{
		if(_int_VerticalInput > 0)
			int_TargetSelector = 1;
		else if(_int_VerticalInput < 0)
			int_TargetSelector = 3;
	}
	
	if(_int_HorizontalInput)
	{
		if(_int_HorizontalInput > 0)
			int_TargetSelector = 0;
		else if(_int_HorizontalInput < 0)
			int_TargetSelector = 2;
	}
}

function load_character_battle_menu(_arr_struct_Basic, _arr_struct_Abilities, _struct_Ultimate, _arr_struct_Items)
{
	var _struct_CurrentBattleMenu = global.struct_BattleMenu_Template;

	//Set Attack up
	_struct_CurrentBattleMenu.arr_struct_Buttons[int_BattleMenu_Buttons.ATTACK].specialarr_Info[int_BattleMenu_ArrayPositions.OWNER] = self;
	_struct_CurrentBattleMenu.arr_struct_Buttons[int_BattleMenu_Buttons.ATTACK].specialarr_Info[int_BattleMenu_ArrayPositions.BASIC] = _arr_struct_Basic;
	_struct_CurrentBattleMenu.arr_struct_Buttons[int_BattleMenu_Buttons.ATTACK].specialarr_Info[int_BattleMenu_ArrayPositions.ABILITIES] = _arr_struct_Abilities;
	//Set Items up
	_struct_CurrentBattleMenu.arr_struct_Buttons[int_BattleMenu_Buttons.ITEMS].specialarr_Info[int_BattleMenu_ArrayPositions.OWNER] = self;
	_struct_CurrentBattleMenu.arr_struct_Buttons[int_BattleMenu_Buttons.ITEMS].specialarr_Info[int_BattleMenu_ArrayPositions.ITEMS] = _arr_struct_Items;
	
	_struct_CurrentBattleMenu.arr_struct_Buttons[int_BattleMenu_Buttons.ULTIMATE].specialarr_Info[int_BattleMenu_ArrayPositions.OWNER] = self; 
	_struct_CurrentBattleMenu.arr_struct_Buttons[int_BattleMenu_Buttons.ULTIMATE].specialarr_Info[int_BattleMenu_ArrayPositions.ULTIMATE] = _struct_Ultimate;

	open_menu(_struct_CurrentBattleMenu);
}