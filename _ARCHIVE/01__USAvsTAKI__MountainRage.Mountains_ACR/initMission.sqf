//**************************
//Taki Roablock
//**************************
{
    _x setUnitPos "UP";
    [_x, selectRandom ["Watch", "StandArmed"]] call EF_fnc_ambientAnim;
} forEach units EP_groupRoadblock;

//**************************
//Hide on start + deactivate triggers
//**************************
["Taki Roadblock", "Taki Base", EP_Alpha, EP_Heli, "Counterattack", EP_Reinforcements] call EP_fnc_deactivateUnits;
trg_BaseSeized enableSimulation false;

//**************************
//Taki Base
//**************************
private _groupsBase = getMissionLayerEntities "Taki Base" # 2;
{_x call CBA_fnc_taskDefend} forEach _groupsBase;

//**************************
//Groups
//**************************
private _colorWEST = west call BIS_fnc_sideColor;
EP_Bravo1 setGroupId ["Bravo-1"];
EP_Bravo1 addGroupIcon ["b_inf"];
EP_Bravo1 setGroupIconParams [_colorWest, "Bravo-1-1", 1, true];

EP_Bravo2 setGroupId ["Bravo-2"];
EP_Bravo2 addGroupIcon ["b_inf"];
EP_Bravo2 setGroupIconParams [_colorWest, "Bravo-1-2", 1, true];


//**************************
//Set Skills
//**************************
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