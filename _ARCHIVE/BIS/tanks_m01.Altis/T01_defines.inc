// Defines for tank mission 01

// Flip Wiesel hold action
#define 	FLIP_ICON 		"A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_takeOff2_ca.paa"
#define 	FLIP_CONDITION		"(!(canMove BIS_Wiesel) and (BIS_Wiesel getHitpointDamage 'hithull' < 1) and (BIS_Wiesel getHitpointDamage 'hitltrack' < 1) and (BIS_Wiesel getHitpointDamage 'hitrtrack' < 1) and (vehicle BIS_ARPlayer == BIS_ARPlayer) and (cursorTarget == BIS_Wiesel) and (BIS_ARPlayer distance2D BIS_Wiesel < 5))"
#define 	FLIP_TITLE		(localize "STR_A3_Tanks_M01_flipWiesel")

// Collateral damage
#define PENALTY_UNIT 5
#define PENALTY_VEHICLE 4
#define PENALTY_BUILDING 6
#define PENALTY_WALL 3
