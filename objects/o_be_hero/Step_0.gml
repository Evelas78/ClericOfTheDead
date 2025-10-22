// Inherit the parent event
event_inherited();

if(bool_Selected && !global.bool_InMenu)
{
	load_character_battle_menu(arr_struct_Basic, arr_struct_Abilities, struct_Ultimate, arr_struct_Items);	
}