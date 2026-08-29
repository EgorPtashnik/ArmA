sleep 5;

private _handle = "2_inserted" call EP_fnc_missionConversations;
waitUntil { sleep 1; scriptDone _handle };
sleep 3;
"EPTaskScout" call EP_fnc_missionTasks;
sleep 2;
savegame;

sleep 3;
_handle = "2_swordReady" call EP_fnc_missionConversations;
waitUntil { sleep 1; scriptDone _handle };
private _supID = [player, "SwordGo"] call BIS_fnc_addCommMenuItem;
player setVariable ["EPSupID", _supID];
"EPMrkSword" setMarkerAlpha 1;
"EPMrkSwordDir" setMarkerAlpha 1;

//******************************************************
// SCOUT LOOP
//******************************************************
// Create detection trigger

private _detPlayerTrigger = [
	"EPMrkBase", [500, 500, 0, false], 5, ["WEST", "EAST D", false], [ { this }, {}, {} ]
] call EP_fnc_createTrigger;
private _detCarGunner = false;
private _detSniper = false;
private _detNest = false;
private _detPatrol = false;
playMusic "Track11_StageB_stealth";

while { sleep 1; true } do {

	// Detected Car Machine Gun
	if (!_detCarGunner && cursorTarget == vehicle EP_baseCarG) then {
		_detCarGunner = true;
		_handle = "2_detCarGunner" call EP_fnc_missionConversations;
		waitUntil { scriptDone _handle };

		if !(["EPTaskSupportAssault"] call BIS_fnc_taskExists) then {
			"EPTaskSupportAssault" call EP_fnc_missionTasks;
		};
		"EPTaskKillCarGunner" call EP_fnc_missionTasks;
		[[0,0,0], 5, [ { !alive EP_baseCarG }, { ["EPTaskKillCarGunner", "SUCCEEDED"] call EP_fnc_missionTasks }, {} ]] call EP_fnc_createTrigger;
	};

	// Detected sniper
	if (!_detSniper && cursorTarget == EP_baseSniper) then {
		_detSniper = true;
		_handle = "2_detSniper" call EP_fnc_missionConversations;
		waitUntil { scriptDone _handle };

		if !(["EPTaskSupportAssault"] call BIS_fnc_taskExists) then {
			"EPTaskSupportAssault" call EP_fnc_missionTasks;
		};
		"EPTaskKillSniper" call EP_fnc_missionTasks;
		[[0,0,0], 5, [ { !alive EP_baseSniper }, { ["EPTaskKillSniper", "SUCCEEDED"] call EP_fnc_missionTasks }, {} ]] call EP_fnc_createTrigger;
	};

	// Detected NEST machine gun
	if (!_detNest && cursorTarget == vehicle EP_nestOperator) then {
		_detNest = true;
		_handle = "2_detNest" call EP_fnc_missionConversations;
		waitUntil { scriptDone _handle };

		if !(["EPTaskSupportAssault"] call BIS_fnc_taskExists) then {
			"EPTaskSupportAssault" call EP_fnc_missionTasks;
		};
		"EPTaskKillNestGunner" call EP_fnc_missionTasks;
		[[0,0,0], 5, [ { !alive EP_nestOperator }, { ["EPTaskKillNestGunner", "SUCCEEDED"] call EP_fnc_missionTasks }, {} ]] call EP_fnc_createTrigger;
	};

	// Detected Patrol
	if (!_detPatrol && (group cursorTarget) == EP_basePatrol) then {
		_detPatrol = true;
		_handle = "2_detPatrol" call EP_fnc_missionConversations;
		waitUntil { scriptDone _handle };

		if !(["EPTaskSupportAssault"] call BIS_fnc_taskExists) then {
			"EPTaskSupportAssault" call EP_fnc_missionTasks;
		};
		"EPTaskKillPatrol" call EP_fnc_missionTasks;
		[[0,0,0], 5, [ { ((units EP_basePatrol) findIf { alive _x }) == -1 }, { ["EPTaskKillPatrol", "SUCCEEDED"] call EP_fnc_missionTasks }, {} ]] call EP_fnc_createTrigger;
	};

	// EXIT -  Found all
	if (_detCarGunner && _detSniper && _detNest && _detPatrol) exitWith {
		_handle = "2_detAll" call EP_fnc_missionConversations;
		waitUntil { sleep 1; scriptDone _handle };
		["EPTaskScout", "SUCCEEDED"] call EP_fnc_missionTasks;
	};

	// EXIT - Called Sword
	if (EPSwordGo) exitWith {
		["EPTaskScout", "CANCELED"] call EP_fnc_missionTasks;
	};

	// EXIT - Player was detected
	if (triggerActivated _detPlayerTrigger) exitWith {
		[player, (player getVariable "EPSupID")] call BIS_fnc_removeCommMenuItem;
		["EPTaskScout", "CANCELED"] call EP_fnc_missionTasks;
		EPSwordGo = true;
		_handle = "2_detPlayer" call EP_fnc_missionConversations;
		waitUntil { sleep 1; scriptDone _handle };
	};
};


//******************************************************
// START ASSAULT
//******************************************************
waitUntil { sleep 1; EPSwordGo };

savegame;

sleep 2;

if !(triggerActivated _detPlayerTrigger) then {
	"2_swordGo" call EP_fnc_missionConversations;
};

[EP_sword, true] call EP_fnc_showObjects;
[EP_sword, "COMBAT", "RED", "LINE", "NORMAL"] call EP_fnc_setAIMode;
[EP_sword, "EPMrkBase", "SAD"] call EP_fnc_addWaypoint;

_detPlayerTrigger spawn {
	waitUntil { sleep 1; triggerActivated _this };
	{
		_x call EP_fnc_clearWaypoints;
		[_x, "EPMrkBase", "SAD", "COMBAT"] call EP_fnc_addWaypoint;
	} forEach (getMissionLayerEntities "OPF_BASE_UNITS" # 2);
	deleteVehicle _this;
};

private _baseUnits = (getMissionLayerEntities "OPF_BASE_UNITS" # 0);
sleep 15;
playMusic "Track10_StageB_action";
waitUntil { sleep 1; ({alive _x } count _baseUnits) < 3 };
{ _x setDamage 1 } forEach _baseUnits;

sleep 5;

["EPTaskSupportAssault", "SUCCEEDED"] call EP_fnc_missionTasks;

sleep 5;

_handle = "2_baseCaptured" call EP_fnc_missionConversations;
waitUntil { sleep 1; scriptDone _handle };

execVM "mission\3_Convoy.sqf";
