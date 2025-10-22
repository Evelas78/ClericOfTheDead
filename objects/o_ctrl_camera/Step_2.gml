/// @description Update position to match current target (usually player character)
if (global.o_Follow != -1 && instance_exists(global.o_Follow))
{
	x = clamp(global.o_Follow.x, INT_TILESIZE + int_cam_WidthHalf, (room_width - INT_TILESIZE) - int_cam_WidthHalf);
	y = clamp(global.o_Follow.y, INT_TILESIZE + int_cam_HeightHalf, (room_height - INT_TILESIZE) - int_cam_HeightHalf);
}
//show_debug_message(global.o_Follow);

camera_set_view_pos(Camera, x - int_cam_WidthHalf, y - int_cam_HeightHalf)