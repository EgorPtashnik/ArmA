//************************************************************************************************************
// DESTROY BASE BUILDINGS
//************************************************************************************************************
{ _x setDamage 1 } forEach (nearestObjects [(markerPos "S_DestroyBase"), ["house"], 200 ]);



//************************************************************************************************************
// UNITS SETUP
//************************************************************************************************************

group player setGroupId ["Reaper"];
I_QRF setGroupId ["Snake"];

{ [_x, (selectRandom ["StandArmed", "Watch"])] call EF_fnc_ambientAnim } forEach units O_Compound_1_Defenders;
{ [_x, "StandArmed"] call EF_fnc_ambientAnim } forEach units O_Compound_2_Defenders;

{
	_x addEventHandler ["CombatModeChanged", {
		params ["_group", "_newMode"];
		if (_newMode == "COMBAT") then {
			[_group, _group] spawn EP_fnc_taskAttack;
			_group removeEventHandler [_thisEvent, _thisEventHandler];
		};
	}];
} forEach [
	O_Compound_1_Patrol, O_Compound_1_Defenders,
	O_Compound_2_Defenders, O_Compound_3_Defenders
];

O_Compound_3_LightPatrol call EP_fnc_taskPatrol;
[O_Compound_3_Defenders, "O_MrkCompound_3"] call EP_fnc_taskDefend;

{ [_x, false] call EP_fnc_showObjects } forEach [
	O_Compound_1_Patrol,
	O_Compound_1_Defenders,

	O_Compound_2_Defenders,

	O_Compound_3_LightPatrol,
	O_Compound_3_Defenders,
	O_Compound_3_QRF,

	I_GrpCar,
	I_QRF,
	I_QRF_APC
];

(units I_QRF select { vehicle _x == _x }) allowGetIn false;

//************************************************************************************************************
// DISABLE TRIGGERS
//************************************************************************************************************
{ _x enableSimulation false } forEach [
	Trg_Compound_1_KIA,
	Trg_Compound_3_KIA
];
