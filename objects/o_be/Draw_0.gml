var _col_TargetColor = c_white;
if(bool_Selected)
{
	_col_TargetColor = c_green;
}


if(!bool_CanTarget)
{
	_col_TargetColor = c_black;
}

if(bool_Targeted)
{
	var _int_PointerYPos = ((bbox_bottom - bbox_top) - INT_BATTLE_POINTER_VERT_OFFSET);
	
	draw_sprite(spr_BattlePointer, 0, x, y - _int_PointerYPos);
}

if(bool_Considered)
{
	var _int_PointerYPos = ((bbox_bottom - bbox_top) + INT_BATTLE_POINTER_VERT_OFFSET + cos(int_SinVal) * INT_BATTLE_POINTER_RANDOM);
	
	int_SinVal += 1/global.int_GameSpeed;
	
	if(int_SinVal >= 2 * pi)
	{
		int_SinVal -= 2 * pi;	
	}
	
	draw_sprite(spr_BattlePointer, 0, x, y - _int_PointerYPos);
}

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, _col_TargetColor, 1);

reset_draw_state();