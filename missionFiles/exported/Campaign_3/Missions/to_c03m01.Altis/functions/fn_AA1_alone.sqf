// Wait for player to get over the ridge
waitUntil {triggerActivated trg_overwatch_1};
["Captive Fighters","Beach Guards","Pilot","Enemy Patrols"] call BIS_fnc_to_activateUnits;

// Spawn everything in the area, make the theater play

waitUntil {triggerActivated trg_overwatch};
sleep 5;
BIS_truckDestroyed setDamage 1;
sleep 10;
{_x setDamage 1} forEach (["Captive Fighters"] call BIS_fnc_to_unitList);

sleep 5;

["02_commAttempt"] spawn BIS_fnc_missionConversations;

sleep 30;

private _handle = ["03_commAttempt_2"] spawn BIS_fnc_missionConversations;
waitUntil {scriptDone _handle};

[
	WEST,
	"tsk_regroup",
	[
		localize "STR_A3_TO_C03m01_tskRegroupDesc",
		localize "STR_A3_TO_C03m01_tskRegroupTitle",
		nil
	],
	nil,
	true,
	0,
	true,
	"move",
	false
] call BIS_fnc_taskCreate;

sleep 5;
["Backup Forces_1"] call BIS_fnc_TO_activateUnits;

sleep 45;

// Prevent careless pilots and units bogged in combat.
{
	private _group = group _x;
	if (vehicle leader _group == leader _group) then {
		while {count (waypoints _group) > 0} do {
			deleteWaypoint ((waypoints _group) select 0);
		};
		units _group allowGetIn false;
		_group move getMarkerPos "mrk_regroup";
	};

	_x disableAI "AUTOCOMBAT";
	_x setBehaviour "AWARE";
	group _x setCombatMode "YELLOW";
} forEach (["Air Assault Units"] call BIS_fnc_to_unitList);


sleep 60;

{
	group _x setBehaviour "AWARE"
} forEach (["Beach Guards"] call BIS_fnc_TO_unitList);
