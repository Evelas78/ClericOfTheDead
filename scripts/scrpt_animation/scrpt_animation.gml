 // Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
 function runDirectionalAnimation(_int_direction, _spr_used_sprite, _float_sprite_spd, _bool_loop){
	
	//**
		//show_debug_message(_int_direction);
	//**
	
	//Important check, we always want to make image_speed can NEVER accidentally turn on. If so, it messes up animation
	if(image_speed != 0)
	{
		image_speed = 0;	
	}
	
	//sprite has changed, reset it.
	if (sprite_index != _spr_used_sprite)
	{
		sprite_index = _spr_used_sprite
	}

	//basically, it works by adding a number every frame to image_number so when it hits a whole number it stays there

	float_SpriteFrame += (_float_sprite_spd)/global.int_GameSpeed; 
	
	
	//Since we explicitly set degrees, we can make it so its from 0, to 90, to 180, to 270
	//Meaning itll be 0, 1/4, 1/2, and 3/4 of the total sprite, which we use to seperate directional movement
	var _int_direction_multiplier = _int_direction/360; 

	//Using above, we want to get the end AND start frame of our CURRENT DIRECTION'S animation. 
	//We get the above multiplier for the start frame, add 1/4 of our total frames as there are 4 directions we account for
	var _int_currDirection_endFrame = (_int_direction_multiplier * image_number) + (1/4 * image_number);
	var _int_currDirection_startFrame = (_int_direction_multiplier * image_number);

	//Get the frame we MIGHT be on. Using the current sprite frame we add it to the start frame and..
	var _float_potential_frame = _int_currDirection_startFrame + float_SpriteFrame;
	
	//We set our sprite frame to our current potential frame but subtracted from the direction start 
	//Separates the sprite_frame from being completely reliable to currDirection startFrame
	float_SpriteFrame = _float_potential_frame - _int_currDirection_startFrame;
	
	//..if its greater than the end frame, we reset to the start frame
	if(_float_potential_frame >= _int_currDirection_endFrame)
	{
		if(_bool_loop)
		{
			_float_potential_frame =_int_currDirection_startFrame;
			float_SpriteFrame = _float_potential_frame - _int_currDirection_startFrame;
		}
		else
		{
			_float_potential_frame = _int_currDirection_endFrame;
			float_SpriteFrame = image_number;
		}
	}
	
	image_index = _float_potential_frame;
}

 function runNonDirectionalAnimation(_spr_used_sprite, _float_sprite_spd, _bool_loop){
	
	//**
		//show_debug_message(_int_direction);
	//**
	
	//Important check, we always want to make image_speed can NEVER accidentally turn on. If so, it messes up animation
	if(image_speed != 0)
	{
		image_speed = 0;	
	}
	
	//sprite has changed, reset it.
	if (sprite_index != _spr_used_sprite)
	{
		sprite_index = _spr_used_sprite
	}

	//basically, it works by adding a number every frame to image_number so when it hits a whole number it stays there

	float_SpriteFrame += (_float_sprite_spd)/global.int_GameSpeed; 

	if(float_SpriteFrame >= image_number)
	{
		if(_bool_loop)
			float_SpriteFrame = 0;
		else
			float_SpriteFrame = image_number;
		
	}
	
	image_index = float_SpriteFrame;
}