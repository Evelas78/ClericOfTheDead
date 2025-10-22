//For battle controller
global.int_BattleState = int_battle_state.NOT_BATTLING;
global.sf_Battle = surface_create(INT_VIEWPORT_DEFAULT_W, INT_VIEWPORT_DEFAULT_H);

prep_hero_template_structs();

global.arr_int_HeroLoadOrder = [ 
	int_HeroTemplates.PLACEHOLDER,
	int_HeroTemplates.PLACEHOLDER
];

//Battle Entities will handle their own timers and have a bool_ready that can be read
arr_o_HeroBattle = [-1,-1,-1,-1];

arr_o_EnemyLoadOrder = [];
arr_o_EnemyBattle = [[],[],[]];

int_CurrentEnemySelected = -1;
int_CurrentHeroSelected = -1;

struct_TargetMove = {};
int_TargetingType = INT_NONE;
bool_NullSelectable = false;
bool_Highlighted = false;
int_TargetSelector = 10;
stack_Targets = ds_stack_create();

queue_TurnOrder = ds_queue_create();

float_PlayerPrepare_Timer = 0;
bool_DoneInitializing = false;
bool_LoadTurnOrder = true;

global.o_be_CurrentCharacter = -1;

define_original_BattleMenu();