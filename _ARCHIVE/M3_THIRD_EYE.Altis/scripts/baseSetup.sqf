//******************************************************
// Spawn Machine Gun Nest
//******************************************************
// Create and align composition
private _mrkNest = selectRandom ["EP_nestPos_1", "EP_nestPos_2"];
private _objects = [markerPos _mrkNest, markerDir _mrkNest, EP_compNest] call BIS_fnc_objectsMapper;
{
	private _objPos = getPosATL _x;
	_x setPosATL [_objPos # 0, _objPos # 1, 0];
	_x setVectorUp (surfaceNormal getPos _x);
} forEach _objects;

// Spawn machine gun operator and patrol
private _classes = ["Flex_CUP_PLA_A_rifleman_lite", "Flex_CUP_PLA_A_grenadier", "Flex_CUP_PLA_A_antitank_light"];
private _spawnPos = ((_objects # 0) getRelPos [10, 180]);
private _grp = [_spawnPos, opfor, _classes] call EP_fnc_createGroup;
EP_nestOperator = leader _grp;
[EP_nestOperator] join grpNull;
EP_nestOperator moveInAny (_objects # 0);
[_grp, 0, false, 100, 3, "MOVE", "SAFE", "YELLOW", "LIMITED"] call EP_fnc_taskPatrol;


//******************************************************
// Position Base Sniper
//******************************************************
private _logBaseSniper = selectRandom [EP_baseSniperPos_1, EP_baseSniperPos_2];
EP_baseSniper setPosWorld (getPosWorld _logBaseSniper);
EP_baseSniper setDir (getDir _logBaseSniper);

{ [_x, (selectRandom ["WATCH", "StandArmed"])] call EF_fnc_ambientAnim } forEach (getMissionLayerEntities "OPF_BASE_UNITS" # 0);


//******************************************************
// Set Base Patrol
//******************************************************
[EP_basePatrol, "EP_wpBasePatrol", true, 0, 0, [11, 11, 11], 10] call EP_fnc_taskPatrol;


//******************************************************
// Hide Sword Team
//******************************************************
[EP_sword, false] call EP_fnc_showObjects;
EPSwordGo = false;