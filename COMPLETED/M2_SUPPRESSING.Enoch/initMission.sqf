[ [east, []], [west, []], [resistance, []] ] call ep_fnc_missionInit;
{ _x setUnitPos "MIDDLE"; _x disableAI "MOVE"; _x setCaptive true } forEach units EP_subsGroup;

{
	if (side _x == blufor) then {
	    _x unlinkItem hmd _x;
		_x addPrimaryWeaponItem "acc_flashlight";
		_x enableGunLights "ForceOn";
	};
} forEach allUnits;

//**********************************************************
// AMBIENT SETUP
//**********************************************************

// Ambient pickup route
EP_script_ambPickup = execVM "scripts\ambientPickup.sqf";
// Ambient APC patrol
EP_script_ambAPC = execVM "scripts\ambientAPC.sqf";

//**********************************************************
// LEFT CITY SETUP
//**********************************************************

[units EP_lCityGuards_1, "SAFE"] call EP_fnc_setAIMode;
[units EP_lCityGuards_2, "SAFE", ["PATH", false]] call EP_fnc_setAIMode;
{ [_x, false] call EP_fnc_showObjects } forEach ("EP_lCityGuards" call EP_fnc_collectVariables);

// Trigger to enable left city units when player is near
EP_trg_lCity = [] spawn {
	private _playerNear = false;
	private _cityPos = "EP_mrkLCity" call EP_fnc_getPosition;
	while { true } do {
		if (player distance2D _cityPos < 500) then {
			if !(_playerNear) then {
				{ [_x, true] call EP_fnc_showObjects } forEach ("EP_lCityGuards" call EP_fnc_collectVariables);
				_playerNear = true;
			};
		} else {
			if (_playerNear) then {
				{ [_x, false] call EP_fnc_showObjects } forEach ("EP_lCityGuards" call EP_fnc_collectVariables);
				_playerNear = false;
			};
		};

		sleep 1;
	};
};

//**********************************************************
// RIGHT CITY SETUP
//**********************************************************

[units EP_rCityGuards_1, "SAFE"] call EP_fnc_setAIMode;
[units EP_rCityGuards_2, "SAFE"] call EP_fnc_setAIMode;
[units EP_rCityGuards_3, "SAFE", ["PATH", false]] call EP_fnc_setAIMode;
{ [_x, false] call EP_fnc_showObjects } forEach ("EP_rCityGuards" call EP_fnc_collectVariables);

// Trigger to enable left city units when player is near
EP_trg_rCity = [] spawn {
	private _playerNear = false;
	private _cityPos = "EP_mrkRCity" call EP_fnc_getPosition;
	while { true } do {
		if (player distance2D _cityPos < 600) then {
			if !(_playerNear) then {
				{ [_x, true] call EP_fnc_showObjects } forEach ("EP_rCityGuards" call EP_fnc_collectVariables);
				_playerNear = true;
			};
		} else {
			if (_playerNear) then {
				{ [_x, false] call EP_fnc_showObjects } forEach ("EP_rCityGuards" call EP_fnc_collectVariables);
				_playerNear = false;
			};
		};

		sleep 1;
	};
};

//**********************************************************
// ROADBLOCK SETUP
//**********************************************************

{ [_x, selectRandom ["Watch", "StandArmed"]] call EF_fnc_ambientAnim } forEach units EP_roadblockGuards;

//**********************************************************
// BASE SETUP
//**********************************************************

// Lock base vehicles
EP_basePickup lock true;
{ _x lock true } forEach ([ ["EP_baseArty", "EP_baseTruck"] ] call EP_fnc_collectVariables);

// Patrols
private _altRoute = ["EP_mrkBasePatrolWp_5", "EP_mrkBasePatrolWp_6", "EP_mrkBasePatrolWp_7", "EP_mrkBasePatrolWp_8", "EP_mrkBasePatrolWp_1", "EP_mrkBasePatrolWp_2", "EP_mrkBasePatrolWp_3", "EP_mrkBasePatrolWp_4"];
[EP_basePatrol_1, _altRoute, true, true, [5, 10, 15], "LIMITED"] call EP_fnc_taskPatrol;
[EP_basePatrol_2, "EP_mrkBasePatrolWp", true, true, [5, 10, 15], "LIMITED"] call EP_fnc_taskPatrol;

// Inner Patrols
{
	leader _x spawn {
		while { alive _this } do {
			if (unitReady _this) then {
				private _pos = "EP_mrkBaseArea" call EP_fnc_getRandomPositionArea;
				[_this, _pos, "LIMITED", "SAFE", [10,10,10]] call EP_fnc_addWaypoint;
			};
			sleep 10;
		};
	}
} forEach ("EP_baseInnerPatrol" call EP_fnc_collectVariables);

// Watchers
private _watchers = units EP_baseWatchers;
[ _watchers, "SAFE", "UP", ["PATH", false] ] call EP_fnc_setAIMode;
{ [_x, "WATCH"] call EF_fnc_ambientAnim } forEach _watchers;

// Forest patrol
private _forestPatrolClasses = ["Aegis_B_E_Soldier_SL_F", "Aegis_B_E_Soldier_F", "Aegis_B_E_Soldier_AR_F"];
private _forestPatrol = [ ["EP_mrkForestPatrolSpawnPos", 100], blufor, _forestPatrolClasses ] call EP_fnc_createGroup;
{ _x unlinkItem hmd _x; _x addPrimaryWeaponItem "acc_flashlight"; _x enableGunLights "ForceOn" } forEach units _forestPatrol;
[_forestPatrol, 0, false, 200, 6] call EP_fnc_taskPatrol;

// Setup actions to command allies to plant explosives
EP_demoCharges = [];
{
	_x addAction ["Command setup IED", {
		private _freeDemoSpecIndex = ([EP_demoSpec_1, EP_demoSpec_2] findIf { alive _x && (_x getVariable ["EP_free", true]) == true });
		if (_freeDemoSpecIndex == -1) exitWith {
			hint "Demo specialists are busy right now.";
		};

		(_this # 0) removeAction (_this # 2);
		private _demoSpec = ([EP_demoSpec_1, EP_demoSpec_2] # _freeDemoSpecIndex);
		_demoSpec setVariable ["EP_free", false];
		[[ ["Ten-2", "Plant this vehicle.", 0] ]] call EP_fnc_showSubtitles;

		_demoSpec setCombatBehaviour "CARELESS";
		_demoSpec doMove (getPos (_this # 0));
		 waitUntil { moveToCompleted _demoSpec };

		 sleep 1; 
  		_demoSpec playMove "AinvPknlMstpSrasWrflDnon_Putdown_AmovPknlMstpSrasWrflDnon";
		sleep 1.5;
		private _demoCharge = "DemoCharge_Remote_Ammo_Scripted" createVehicle getPos (_this # 0);
		EP_demoCharges pushBack _demoCharge;
		sleep 5;
		_demoSpec setCombatBehaviour "AWARE";
		_demoSpec setVariable ["EP_free", true];
	}, nil, 10, true, true, "", "alive EP_demoSpec_1 || alive EP_demoSpec_2", 30];
} forEach ("EP_baseArty" call EP_fnc_collectVariables);

player addAction ["Touch off explosives", {
	{ (EP_demoCharges deleteAt 0) setDamage 1 } forEach EP_demoCharges;
}, nil, 10, true, true, "", "(count EP_demoCharges) > 0"];

//**********************************************************
// EXTRACTION SETUP
//**********************************************************

[group EP_extrHeli, false] call EP_fnc_showObjects;

//**********************************************************
// PHASE 2 - CITY SETUP
//**********************************************************

{ [_x, false] call EP_fnc_showObjects } forEach ["CITY_RED_UNITS", "CITY_BLUE_UNITS", "INSERTION_UNITS"];

//**********************************************************
// MARKERS SETUP
//**********************************************************

{ _x setMarkerAlpha 0 } forEach ["EP_mrkExtr", "EP_mrkCityIns", "EP_mrkCity"];

//**********************************************************
// START MISSION FLOW + SETUP PLAYER PROFILE
//**********************************************************

EP_playerGroup setGroupId ["Ten-2"];
EP_flag_teamKIA = false;

execVM "scripts\1Insertion.sqf";
