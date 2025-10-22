/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

global.o_MainCharacter = self;

spr_Idle = spr_MainCharacter_Idle;
spr_Walk = spr_MainCharacter_Walking;

spr_CurrentSprite = spr_Idle;

float_SprSpd = float_Idle_SprSpd;
float_Idle_SprSpd = 0;

float_AdditionalDepth = .1;

int_yTo = 0;
int_xTo = 0;
bool_Sprint = false;