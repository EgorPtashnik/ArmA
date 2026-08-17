#include "scripts\startSetup.sqf";
#include "scripts\baseSetup.sqf";
#include "scripts\convoySetup.sqf";
#include "scripts\setKits.sqf";

[ [opfor, []], [blufor, []] ] call EP_fnc_missionInit;
player spawn EP_fnc_ext_healthRegen;
player spawn EP_fnc_ext_healthBar;
(group player) setGroupId ["Longbow"];
EP_sword setGroupId ["Sword"];

{ _x setMarkerAlpha 0 } forEach ["EPMrkInsertion", "EPMrkSword", "EPMrkSwordDir"];


// CHEAT FOR OPF BASE START
private _cheat1 = false;
if (_cheat1) exitWith {
	// CLEANUP BASE
	spawn {
		[EP_VEH_BLU_Heli, EP_startHP] call EP_fnc_addWaypoint;
		sleep 20;
		waitUntil { unitReady driver EP_VEH_BLU_Heli };
		[EP_VEH_BLU_Heli, 500] call EP_fnc_cleanupArea;
	};
	player setPos (getMarkerPos "EP_wpHeli_2");
	execVM "mission\2_opfBase.sqf";
};

// CHEAT FOR CONVOY START
private _cheat2 = false;
if (_cheat2) exitWith {
	// CLEANUP BASE
	spawn {
		[EP_VEH_BLU_Heli, EP_startHP] call EP_fnc_addWaypoint;
		sleep 20;
		waitUntil { unitReady driver EP_VEH_BLU_Heli };
		[EP_VEH_BLU_Heli, 500] call EP_fnc_cleanupArea;
	};
	// Kill all base units
	{ _x setDamage 1 } forEach (allUnits select { side _x == opfor && _x inArea [getMarkerPos "EPMrkBase", 500, 500]});
	[EP_sword, true] call EP_fnc_showObjects;
	{ _x setPos (getMarkerPos "EPMrkBase")} forEach units EP_sword;
	player setPos (getMarkerPos "EP_nestPos_2");
	execVM "mission\3_Convoy.sqf";
};

execVM "mission\1_Insertion.sqf";
