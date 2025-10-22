//While while loops arent a great idea for step functions, there'll never be too many sound effects queued to cause issues
while(!ds_queue_empty(queue_SoundEffects))
{
	var _struct_Current = ds_queue_dequeue(queue_SoundEffects);
	play_sfx(_struct_Current);
} 

if(struct_NextSong != -1)
{
	sound_CurrentSong = play_music(struct_NextSong);
	struct_NextSong = -1;
}