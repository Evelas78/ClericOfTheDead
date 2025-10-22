handle_random_timer();

if(int_ActiveMove != INT_NONE){
	method_call(arr_struct_MovesCompendium[int_ActiveMove].method_Move);
}