// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scrpt_walk(_int_xMag, _int_yMag, _bool_isSprint){//wDirection being true means x, while y is false
	//Implement Sprinting
	var _int_MovementAmount = INT_MOVEMENT_CONST;
	if(_bool_isSprint)
	{
		_int_MovementAmount *= 2;	
	}
	
	//We could normalize a vector, but honestly, Ill just keep it as is for speedrunners (and a little more to it)
	var _int_xTo = 0;
	if(_int_xMag != 0)
	{
		_int_xTo = (_int_xMag * _int_MovementAmount) / global.int_GameSpeed;
		
		if(sign(_int_xTo) == 1)//right
		{
				direction = 0;
		}						
		else//left
		{
				direction = 180;
		}
		
		if(tilemap_get_at_pixel(global.tl_CollisionLayer, x + _int_xTo, y-1) && (tilemap_get_at_pixel(global.tl_CollisionLayer, x + _int_xTo, y+1)))
		{
		 	var _int_xLoc = x + _int_xTo;
			
			_int_xLoc %= INT_TILESIZE; //Breaks it down to the number
			
			if(sign(_int_xTo) == 1) //going right
			{
				_int_xTo = -(_int_xLoc) + 1; 
			}						
			else //left
			{
				_int_xTo = _int_xTo + (INT_TILESIZE-_int_xLoc);
			}
		}

	}
	x += _int_xTo; 
	
	var _int_yTo = 0;

	if(_int_yMag != 0)
	{
		_int_yTo = _int_yMag * _int_MovementAmount / global.int_GameSpeed;
		
		if(sign(_int_yTo) == 1)
		{
			direction = 270; 
		}						
		else
		{
			direction = 90;
		}
		
		if(tilemap_get_at_pixel(global.tl_CollisionLayer, x - 1, y + _int_yTo) && tilemap_get_at_pixel(global.tl_CollisionLayer, x + 1, y + _int_yTo) )
		{
		 	var _int_yLoc = y + _int_yTo;
			
			_int_yLoc %= INT_TILESIZE; //Breaks it down to the number
			
			if(sign(_int_yTo) == 1)
			{
				_int_yTo = _int_yTo - (_int_yLoc); 

			}						
			else
			{
				_int_yTo = _int_yTo + (INT_TILESIZE-_int_yLoc);
			}
		}
	}
	
	y += _int_yTo; 
	
	if(_int_yTo == 0 && _int_xTo == 0)
	{
		spr_CurrentSprite = spr_Idle;
		float_SprSpd = 0;
	}
	else 
	{
		spr_CurrentSprite = spr_Walk;
		if(_bool_isSprint)
			float_SprSpd = float_main_char_sprspd.SPRITE_SPRINT;	
		else
			float_SprSpd = float_main_char_sprspd.SPRITE_WALK;	
	}
	
}