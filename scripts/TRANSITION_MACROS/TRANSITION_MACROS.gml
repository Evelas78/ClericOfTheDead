//make sure the next is always the opening version of it
enum int_transition_type
{
	TRANS_CLOSE_FULL = 0,
	TRANS_CLOSE_BOX = 1,
	TRANS_OPEN_BOX = 2,
	TRANS_CLOSE_SLOWFADE = 3,
	TRANS_OPEN_SLOWFADE = 4,
	TRANS_CLOSE_BLINK_FADE = 5,
	TRANS_OPEN_BLINK_FADE = 6
}

enum int_transition_array
{
	CLOSE = 0,
	OPEN = 1,

	TRANSITION_TYPE = 0,
	TRANSITION_TT = 1,
	END_SCRIPT = 2,
}