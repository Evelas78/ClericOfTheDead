/*
struct_SFX=
	{
		sfx_Asset: -1,
		int_Priority: -1,
		float_Gain: -1,
		float_Pitch: -1,
		float_TimeOffset: -1,
		vec3_Position: [0,0,0],
		int_falloff_half: -1,
		int_falloff_max: -1,
		float_falloff_factor: -1,
		
	}
	
struct_Music =
	{
		sfx_Asset: -1,
		struct_Music_FeederSong: -1, //song that plays after this song ends (do not implement yet, unless i have not much else to do atm)
		int_Priority: -1,
		float_Gain: -1,
		float_Pitch: -1,
		float_TimeOffset: -1,
		vec3_Position: [0,0,0],
		int_falloff_half: -1,
		int_falloff_max: -1,
		float_falloff_factor: -1,
	}
*/

function enqueue_SoundQueue(_struct_SFX)
{

	with(global.o_ctrl_Sound)
	{
		ds_queue_enqueue(_struct_SFX);
	}
}

function update_listener(_int_x, _int_y, _int_z)
{
	audio_listener_position(_int_x, _int_y, _int_z)
}


function play_sfx(_struct_SFX)
{
	var _sfx_Asset = _struct_SFX.sfx_Asset;
	var _int_Priority = _struct_SFX.int_Priority;
	
	var _float_Gain = _struct_SFX.float_Gain;
	if(_float_Gain == -1) _float_Gain = 1;
	
	var _float_Pitch = _struct_SFX.float_Pitch;
	if(_float_Pitch == -1) _float_Pitch = 1;
		
	var _float_TimeOffset = _struct_SFX.float_TimeOffset;
	if(_float_TimeOffset == -1) _float_TimeOffset = 0;
	
	if(_struct_SFX.vec3_Position != -1)//Non positional nor falloff
	{
		audio_play_sound(_sfx_Asset, _int_Priority, false, _float_Gain, _float_TimeOffset, _float_Pitch);
		return;
	}
	var _int_xPos = _struct_SFX.vec3_Position[0];
	var _int_yPos = _struct_SFX.vec3_Position[1];
	var _int_zPos = _struct_SFX.vec3_Position[2];
	
	var _int_falloff_half = _struct_SFX.int_falloff_half;
	var _int_falloff_max = _struct_SFX.int_falloff_max;
	var _float_falloff_factor = _struct_SFX.float_falloff_factor;
	
	if(_int_falloff_half == -1) //positional, but no falloff
	{
		audio_falloff_set_model(audio_falloff_none);
		audio_play_sound_at(_sfx_Asset, _int_xPos, _int_yPos, _int_zPos, 0, 0, 1, false, _int_Priority, _float_Gain, _float_TimeOffset, _float_Pitch);
		return;
	}
	else
	{
		audio_falloff_set_model(audio_falloff_exponent_distance);
		audio_play_sound_at(_sfx_Asset, _int_xPos, _int_yPos, _int_zPos, _int_falloff_half, _int_falloff_max, _float_falloff_factor, false, _int_Priority, _float_Gain, _float_TimeOffset, _float_Pitch);
		audio_falloff_set_model(audio_falloff_none);
		return;
	}
}

function play_music(_struct_Music)
{
	var _Current_Song;
	
	var _sfx_Asset = _struct_Music.sfx_Asset;
	var _int_Priority = _struct_Music.int_Priority;
	
	var _float_Gain = _struct_Music.float_Gain;
	if(_float_Gain == -1) _float_Gain = 1;
	
	var _float_Pitch = _struct_Music.float_Pitch;
	if(_float_Pitch == -1) _float_Pitch = 1;
		
	var _float_TimeOffset = _struct_Music.float_TimeOffset;
	if(_float_TimeOffset == -1) _float_TimeOffset = 0;
	
	if(_struct_Music.vec3_Position == -1)//Non positional nor falloff. Most fall under this category. 
	{
		//Set up a prep function to draw the name of a song to the screen. Should NOT do any of the drawin
		_Current_Song = audio_play_sound(_sfx_Asset, _int_Priority, true, _float_Gain, _float_TimeOffset, _float_Pitch);
		return _Current_Song;
	}
	var _int_xPos = _struct_Music.vec3_Position[0];
	var _int_yPos = _struct_Music.vec3_Position[1];
	var _int_zPos = _struct_Music.vec3_Position[2];
	
	var _int_falloff_half = _struct_Music.int_falloff_half;
	var _int_falloff_max = _struct_Music.int_falloff_max;
	var _float_falloff_factor = _struct_Music.float_falloff_factor;
	
	if(_int_falloff_half == -1) //positional, but no falloff
	{
		audio_falloff_set_model(audio_falloff_none);
		_Current_Song = audio_play_sound_at(_sfx_Asset, _int_xPos, _int_yPos, _int_zPos, 0, 0, 1, true, _int_Priority, _float_Gain, _float_TimeOffset, _float_Pitch);
		return _Current_Song;
	}
	else
	{
		audio_falloff_set_model(audio_falloff_exponent_distance);
		_Current_Song = audio_play_sound_at(_sfx_Asset, _int_xPos, _int_yPos, _int_zPos, _int_falloff_half, _int_falloff_max, _float_falloff_factor, true, _int_Priority, _float_Gain, _float_TimeOffset, _float_Pitch);
		audio_falloff_set_model(audio_falloff_none);
		return _Current_Song;
	}
}