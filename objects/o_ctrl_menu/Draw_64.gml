if(!surface_exists(global.sf_Menu))
	global.sf_Menu = surface_create(INT_VIEWPORT_DEFAULT_W, INT_VIEWPORT_DEFAULT_H );

surface_set_target(global.sf_Menu);
draw_clear_alpha(c_black, 0);

if(global.bool_InMenu && !global.bool_SuppressMenu)
{
	if(array_length(arr_struct_Menus) > 0)
	{
		for(var _i = 0; _i < array_length(arr_struct_Menus); _i++)
		{
			if(_i == array_length(arr_struct_Menus) - 1)
				menu_draw(arr_struct_Menus[_i], true);
			else
				menu_draw(arr_struct_Menus[_i], false);
		}	
	}
}

surface_reset_target();

var float_scale_x = global.int_Viewport_W / INT_VIEWPORT_DEFAULT_W;
var float_scale_y = global.int_Viewport_H / INT_VIEWPORT_DEFAULT_H ;

draw_surface_ext(global.sf_Menu, 0, 0, float_scale_x, float_scale_y, 0, c_white, 1);

reset_draw_state();