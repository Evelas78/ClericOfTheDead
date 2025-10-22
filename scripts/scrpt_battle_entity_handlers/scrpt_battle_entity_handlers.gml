function BattleEntityLogic_Defaulter(){
	show_error("You didn't implement a logic method for this character. Please insert one", true);
}
function BattleEntityPrep_Defaulter(){
	show_error("You didn't implement a prep function for this character. Please insert one", true);
}

function make_Hitbox(_int_Width, _int_Height, _float_xOffset, _float_yOffset){
	o_Hitbox = instance_create_layer(0,0, STR_HITBOX_LAYER, o_hitbox)

	o_Hitbox.image_xscale = _int_Width / INT_HITBOX_DIMENSION;
	o_Hitbox.image_yscale = _int_Height / INT_HITBOX_DIMENSION;
	o_Hitbox.o_Owner = self;
	o_Hitbox.bool_isHurtBox = false; //if true, then dont transfer damage
	o_Hitbox.bool_isHero = true;
	o_Hitbox.float_xOffset = _float_xOffset;
	o_Hitbox.float_yOffset = _float_yOffset;	
}

function make_Hurtbox(_int_Width, _int_Height, _float_xOffset, _float_yOffset){
	var _o_NewHurtbox = instance_create_layer(0,0, STR_HITBOX_LAYER, o_hurtbox)

	_o_NewHurtbox.image_xscale = _int_Width / INT_HITBOX_DIMENSION;
	_o_NewHurtbox.image_yscale = _int_Height / INT_HITBOX_DIMENSION;
	_o_NewHurtbox.o_Owner = self;
	_o_NewHurtbox.bool_isHurtBox = false; //if true, then dont transfer damage
	_o_NewHurtbox.bool_isHero = true;
	_o_NewHurtbox.float_xOffset = _float_xOffset;
	_o_NewHurtbox.float_yOffset = _float_yOffset;	
	
	array_push(arr_o_Hurtboxes, _o_NewHurtbox);
}

function clear_Hitbox(){
	instance_destroy(o_Hitbox, false);	
}

function remove_Hurtbox(_o_Target){
	for(var _i = 0; _i < arr_o_Hurtboxes; _i++)
	{
		if(arr_o_Hurtboxes[_i] == _o_Target)
		{
			instance_destroy(o_Hitbox, false);	
			return;
		}
	}
	show_error("Attempted to delete target hurtbox that doesnt exist: " + _o_Target, true);
}

function clear_Hurtboxes(){
	for(var _i = 0; _i < arr_o_Hurtboxes; _i++)
	{
		instance_destroy(arr_o_Hurtboxes[_i]);
	}
	arr_o_Hurtboxes = [];
}


function prep_battle_entity(){
	int_tTurnsLeft = generate_turn(int_tSpeed);

	prep_random_timer();
	initial_battle_ds_construction();
}
function prep_random_timer()
{
	float_RandomPauseTimer = -1;
	bool_DidRandomTime = false;
	bool_CompletedRandomTime = false;
}
function initial_battle_ds_construction()
{
	arr_int_CurrentMoves = [];
	arr_struct_MovesCompendium = [];
	
	arr_struct_Abilities = [];
	arr_struct_Basic = []; 
	struct_Ultimate = {}
	arr_struct_Items = [];

	queue_PossibleMoves = ds_queue_create();
	queue_PossibleMoves_Weights = ds_queue_create();
}


function handle_random_timer()
{
	if(bool_Selected)
	{
		if(float_RandomPauseTimer > 0)
		{
			float_RandomPauseTimer -= 1/global.int_GameSpeed;	
			exit;
		}
	}
}

function end_character_turn(){
	bool_CompletedTurn = true;
	bool_Selected = false;
	bool_Attacking = false;
	
	show_debug_message(string(self) + " Has just ended their turn");
}

function turn_progress()
{
	int_tCurrentElyst += int_tElystRegen;
	if(int_tCurrentElyst > int_tMaxElyst)
		int_tCurrentElyst = int_tMaxElyst;
}

function use_move(_int_MoveNum)
{
	var _struct_Move = arr_struct_MovesCompendium[_int_MoveNum];
	//Logic for running move
	update_used_move_counters(_int_MoveNum);
	reduce_elyst(_struct_Move.int_ElystCost);
	

}

function reduce_elyst(_int_Reduction)
{
	int_tCurrentElyst -= _int_Reduction;
	if(int_tCurrentElyst < 0)
		int_tCurrentElyst = 0;
}

function decide_move(_float_TotalWeight)
{
	var _float_GeneratedNumber = random_range(0, _float_TotalWeight);
	var _int_MoveNum = -1;
	while(_float_GeneratedNumber > 0)
	{
		_float_GeneratedNumber -= ds_queue_dequeue(queue_PossibleMoves_Weights);
		_int_MoveNum = ds_queue_dequeue(queue_PossibleMoves);
	}
	
	return _int_MoveNum;
}

function update_used_move_counters(_int_MoveNum)
{
	arr_struct_MovesCompendium[_int_MoveNum].int_TotalUses++;
	arr_struct_MovesCompendium[_int_MoveNum].int_CurrentCooldown = arr_struct_MovesCompendium[_int_MoveNum].int_TurnCooldown;
}

function load_moves(_queue_PossibleMoves, _queue_PossibleMoves_Weights)
{
	var _float_TotalWeight = 0;
	for(var _i = 2; _i < (argument_count); _i++)	
	{
		var _specialarr_CurrentMove = argument[_i];
		var _int_CurrentMoveIdentifier = _specialarr_CurrentMove[int_BE_CurrentMoveArray.MOVE_IDENTIFIER];
		var _float_Weight = _specialarr_CurrentMove[int_BE_CurrentMoveArray.USABLE] ? _specialarr_CurrentMove[int_BE_CurrentMoveArray.WEIGHT] : 0;
		if(_float_Weight != 0)
		{
			ds_queue_enqueue(_queue_PossibleMoves, _int_CurrentMoveIdentifier);
			ds_queue_enqueue(_queue_PossibleMoves_Weights, _int_Weight);
		}
		_float_TotalWeight += _int_Weight;
	}
	
	return _float_TotalWeight;
}

function reset_possible_moves_queue()
{
	while(!ds_queue_empty(queue_PossibleMoves))
		ds_queue_dequeue(queue_PossibleMoves);
		
	while(!ds_queue_empty(queue_PossibleMoves_Weights))
		ds_queue_dequeue(queue_PossibleMoves_Weights);
}

function confirm_usability(_int_ElystCost, _int_CurrentCooldown)
{
	if(_int_ElystCost >= int_tCurrentElyst)
		return false;
	if(_int_CurrentCooldown <= 0)
		return false;
	return true;
		
}