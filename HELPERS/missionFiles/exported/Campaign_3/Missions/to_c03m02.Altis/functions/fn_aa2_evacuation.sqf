// This script controls evacuation of wounded to the LZ Stallion
["tsk_support","CANCELED"] call BIS_fnc_taskSetState;

[] spawn {
	// countdown for attack launch
	sleep 40;
	["Attack RP1"] call BIS_fnc_TO_activateUnits;
};

// check for evac fail
[] spawn {
	waitUntil {sleep 0.1; !alive BIS_apc || {alive _x} count BIS_wounded == 0};
	BIS_evacFailed = true;
};

// Wait until player's APC at RP
waitUntil {BIS_apc distance getMarkerPos "mrk_regroup" < 50};

// Remove all units from scouting parts
//private _unitsToDelete = (["Flatlands","Scout attack"] call BIS_fnc_to_unitList) select {side _x == RESISTANCE};
//{deleteVehicle _x} forEach _unitsToDelete;

sleep 5;
private _handle = ["ta_return_to_erv"] spawn BIS_fnc_missionConversations;
waitUntil {scriptDone _handle};
saveGame;

private _criticalWounded = [BIS_injured_1, BIS_medic_1];

// Evac all people except 2
{
	sleep 0.5 + random 4;
	_x setCaptive false;

	_x enableAI "all";
	_x setUnconscious false;
	_x assignAsCargo BIS_apc;
	[_x] orderGetIn true;
	group _x setBehaviour "CARELESS";
	group _x setSpeedMode "LIMITED";
	
	// switchMove 
	if (typeOf _x == "B_medic_F") then {
		cursorObject switchMove "UnconsciousMedicOutRifle";
	} else {
		_x switchMove "UnconsciousOutProne";
	};
	_x setUnitPos "up";
} forEach (BIS_wounded - _criticalWounded);

// Wait 2 minutes before their evacuation - you have to try hard to make it right
["Scout Attack","Flatlands 1"] call BIS_fnc_TO_activateUnits;

_criticalWounded spawn {
	sleep 120;
	// Evac the rest of them
	{
		_x enableAI "all";
		_x setUnconscious false;
		_x assignAsCargo BIS_apc;
		[_x] orderGetIn true;
		group _x setBehaviour "CARELESS";

		// switchMove 
		if (typeOf _x == "B_medic_F") then {
			cursorObject switchMove "UnconsciousMedicOutRifle";
		} else {
			_x switchMove "UnconsciousOutProne";
		};
		_x setUnitPos "up";
	} forEach _this;
};

waitUntil {
	sleep 1;
	{alive _x && vehicle _x != BIS_apc} count BIS_wounded == 0 && isNil "BIS_evacFailed"
};

{_x disableAI "all"} forEach BIS_wounded;
BIS_apc allowCrewInImmobile true;
BIS_apc setUnloadInCombat [false, false];

BIS_evacRegroup = true;

private _handle = ["ta_return_to_erv_contact"] spawn BIS_fnc_missionConversations;
["tsk_evac",getMarkerPos "mrk_lz"] call BIS_fnc_taskSetDestination;
["tsk_evac","ASSIGNED"] call BIS_fnc_taskSetState;

sleep 1;

// evacuate people from regroup point
{
	_x disableAI "autocombat";
	_x setDamage 0;
} forEach ((units BIS_groupOscar) + (units BIS_groupNovember));

{
	_x enableAI "path";
	_x setUnitPos "UP";
} forEach units BIS_groupOscar;
BIS_groupOscar setBehaviour "AWARE";
BIS_groupOscar setCombatMode "GREEN";

// Activate forces in scouting area and give them terrible aiming
private _unitsActivated = [BIS_gorgonScout] call BIS_fnc_to_unitList;
[_unitsActivated] call BIS_fnc_TO_activateUnits; 
{
	_x setSkill 0.2;
	_x setSkill ["aimingAccuracy", 0.1];
} forEach _unitsActivated;

[] spawn {
	// Everyone reached Kappa note
	waitUntil {{alive _x && _x distance BIS_village > 200} count units BIS_groupOscar == 0};
};

// Reached LZ
waitUntil {BIS_apc distance BIS_lz_2 < 50 && speed BIS_apc < 5};
BIS_evacCompleted = true;
{
	unassignVehicle _x;
	_x enableAI "all";
} forEach BIS_wounded;

{group _x move getMarkerPos "mrk_tent"} forEach BIS_wounded;