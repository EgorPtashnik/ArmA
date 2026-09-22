//***************
//Ambience
//***************
// "filmGrain" ppEffectEnable true;
// "filmGrain" ppEffectAdjust [0.5, 1.2, 2, 0.2, 0.2, true];
// "filmGrain" ppEffectCommit 0;

// "colorCorrections" ppEffectEnable true;
// "colorCorrections" ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [1.1, 1.3, 1.1, 0.8], [0.299, 0.587, 0.114, 0]];
// "colorcorrections" ppeffectcommit 0;
[{true}, true, true, true] spawn EP_fnc_ambientWarfare;

//***************
// Sides Setup
//***************
{
	_x setSkill 0.5;
	_x setSkill ["aimingAccuracy", 0.2];
	_x setSkill ["aimingShake", 0.2];
	_x setSkill ["aimingSpeed", 0.2];
	_x setSkill ["spotDistance", 0.5];
	_x setSkill ["spotTime", 0.25];
	_x setSkill ["courage", 1];
	_x setSkill ["reloadSpeed", 0.5];
	_x setSkill ["commanding", 0.5];
	_x allowFleeing 0;
} forEach units BLUFOR;

{
	_x setSkill 0.5;
	_x setSkill ["aimingAccuracy", 0.2];
	_x setSkill ["aimingShake", 0.2];
	_x setSkill ["aimingSpeed", 0.2];
	_x setSkill ["spotDistance", 0.5];
	_x setSkill ["spotTime", 0.25];
	_x setSkill ["courage", 1];
	_x setSkill ["reloadSpeed", 0.5];
	_x setSkill ["commanding", 0.5];
	_x allowFleeing 0;
} forEach units OPFOR;

{ _x deleteGroupWhenEmpty true } forEach allGroups;

//***************
//Units & Groups
//***************
//Player start
{ _x moveInAny B_Truck } forEach units B_PlayerGroup;

//***************
//Markers
//***************
//Hide
{ _x setMarkerAlpha 0 } forEach ["Mrk_Task_1a", "Mrk_Task_1b", "Mrk_Task_2"];

//***************
//Layers
//***************
{ _x enableSimulation false } forEach getMissionLayerEntities "StartAmb" # 0;
{ _x enableSimulation false } forEach getMissionLayerEntities "StartCombat" # 0;
