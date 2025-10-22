if(o_Owner != -1)
{
	x = float_xOffset + o_Owner.x;
	y = float_yOffset + o_Owner.y;
}

var _o_Hit = instance_place(x, y, o_hitbox);
if(array_contains(o_Owner.o_arr_Targets, _o_Hit))
{
	_o_Hit.bool_tVulnerable = true;	
}
