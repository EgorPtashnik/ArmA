if (!(BIS_finalRound) && !(BIS_outOfTime)) then {
	// Register destruction
	BIS_wreckDestroyed = true;
	publicVariable "BIS_wreckDestroyed";

	// Succeed task
	["BIS_destroy", "SUCCEEDED"] call BIS_fnc_missionTasks;
	"20_Destroyed" spawn BIS_fnc_missionConversations;
};

// Disable UAV
BIS_UAVAllowed = false;
publicVariable "BIS_UAVAllowed";

// Remove current waypoints
private ["_group"];
_group = group BIS_UAVD;
while {count waypoints _group > 0} do {deleteWaypoint (waypoints _group select 0)};

// Send it back to base
private ["_wp"];
_wp = _group addWaypoint [markerPos "BIS_heliDest", 0];
_wp setWaypointSpeed "NORMAL";
_wp setWaypointType "LOITER";
_group setCurrentWaypoint _wp;

// Prevent defenders from being engaged
BIS_crashCaptive = 1;
publicVariable "BIS_crashCaptive";

// Wait to proceed
waitUntil {BIS_attackTown};

{
	private ["_group", "_heli"];
	_group = _x;
	_heli = if (_forEachIndex == 0) then {BIS_heli1} else {BIS_heli2};

	// Delete exisiting waypoints
	while {count waypoints _group > 0} do {deleteWaypoint (waypoints _group select 0)};

	// Calculate strings
	private _heliString = "BIS_heli1";
	if (_forEachIndex > 0) then {_heliString = "BIS_heli2"};

	private _LZString = "BIS_LZ1";
	if (_forEachIndex > 0) then {_LZString = "BIS_LZ2"};

	// Add waypoint
	private _wp = _group addWaypoint [markerPos (format ["BIS_wp%1", _forEachIndex + 1]), 0];

	// Make helicopter land at LZ
	_wp setWaypointSpeed "NORMAL";
	_wp setWaypointStatements ["true", format ["%1 land 'GET OUT'; %1 landAt %2", _heliString, _LZString]];
	_wp setWaypointType "TR UNLOAD";
	_group setCurrentWaypoint _wp;

	_heli spawn {
		scriptName format ["insertion.sqf: disembark control - %1", _this];
		params ["_heli"];

		// Wait for it to start landing
		waitUntil {((getPosATL _heli) select 2) <= 1};


		private _group = BIS_playerGroup;
		if (_heli == BIS_heli2) then {_group = BIS_group2};

		// Make the units disembark
		_group leaveVehicle _heli;
		{unassignVehicle _x} forEach units _group;

		// Unlock the player's helicopter
		if (_heli == BIS_heli1) then {
			"REMOTEEXEC GETOUT!" call bis_fnc_log;
			{_x remoteExec ["moveout",0];} forEach allPlayers;
		};

		if (_heli == BIS_heli1) then {
			"UNLOCK CHOOPER" call bis_fnc_log;
			{ _x action ["getout", BIS_Heli1]} forEach units BIS_playergroup;
			BIS_heli1Lock = 0;
			publicVariable "BIS_heli1Lock";
		};

		// Check if everyone is out
		waituntil {{_x == vehicle _x} foreach units BIS_playergroup};
		"Everyone out" call bis_fnc_log;
		sleep 0.5;
		if (_heli == BIS_heli1) then {BIS_heli1 land "NONE"};
	};
} forEach [group BIS_heli1D, group BIS_heli2D];

// Set up waypoints
/*{
	private ["_group", "_heli"];
	_group = _x;
	_heli = if (_forEachIndex == 0) then {BIS_heli1} else {BIS_heli2};

	// Delete exisiting waypoints
	while {count waypoints _group > 0} do {deleteWaypoint (waypoints _group select 0)};

	// Choose waypoint & LZ
	private ["_wp", "_LZ"];
	_wp = format ["BIS_wp%1", _forEachIndex + 1];
	_LZ = missionNamespace getVariable (format ["BIS_LZ%1", _forEachIndex + 1]);

	// Add waypoints
	private ["_wp1", "_wp2"];
	_wp1 = _group addWaypoint [markerPos _wp, 0];
	_wp2 = _group addWaypoint [position _LZ, 0];

	{_x setWaypointSpeed "NORMAL"} forEach [_wp1, _wp2];

	// Make helicopter land at LZ
	_wp2 waypointAttachVehicle _LZ;
	_wp2 setWaypointType "TR UNLOAD";

	// Move to first waypoint
	_wp1 setWaypointStatements ["true", format ["%1 land 'GET OUT'; %1 landAt %2", _heli, _LZ]];
	_wp1 setWaypointType "MOVE";
	_group setCurrentWaypoint _wp1;

	if (_heli == BIS_heli1) then {
		_heli spawn {
			scriptName "insertion.sqf: lock control";

			// Wait for helicopter to land
			waitUntil {(getPosATL _this select 2) <= 5};

			// Unlock the helicopter
			BIS_heli1Lock = 0;
			publicVariable "BIS_heli1Lock";

			// Force it on the ground
			BIS_heli1 flyInHeight 0;
		};
	};
} forEach [group BIS_heli1D, group BIS_heli2D];*/

// Wait for player's team to be out
waitUntil {{alive _x && vehicle _x == _x} count units BIS_playerGroup == {alive _x} count units BIS_playerGroup};

// Let the helicopter take off
//BIS_heli1 flyInHeight 50;

// Lock helicopter
BIS_heli1Lock = 2;
publicVariable "BIS_heli1Lock";

// Prevent helicopters from being engaged
BIS_heli1Captive = 1;
BIS_heli2Captive = 1;
{publicVariable _x} forEach ["BIS_heli1Captive", "BIS_heli2Captive"];

// Delete crash site units
{
	private ["_unit"];
	_unit = missionNamespace getVariable [_x, objNull];
	if (!(isNull _unit)) then {deleteVehicle _unit};
} forEach (["BIS_crashTruck1", "BIS_crashTruck2", "BIS_crashTruck3", "BIS_crashTruck4"] + BIS_crashUnits);

// Unhide defenders
{
	[_x, _x getVariable "BIS_height"] call BIS_fnc_setHeight;
	_x hideObjectGlobal false;
	_x enableSimulationGlobal true;
} forEach BIS_townUnits;

BIS_townStatus = 1;
publicVariable "BIS_townStatus";

// Save game in SP
if (!(isMultiplayer)) then {
	sleep 0.5;

	saveGame;

	sleep 1;
};

{
	_x spawn {
		private ["_group"];
		_group = _this;

		scriptName (format ["insertion.sqf: heli takeoff control - [%1]", _group]);

		private ["_heli"];
		_heli = if (_group == BIS_playerGroup) then {BIS_heli1} else {BIS_heli2};

		// Wait for cargo to unload
		waitUntil {{alive _x && vehicle _x == _x} count units _group == {alive _x} count units _group};

		// Rearm AI
		{if (alive _x && !(isPlayer _x)) then {_x call BIS_Showcase_FFV_fnc_addLoadout}} forEach units _group;

		if (_group == BIS_playerGroup) then {
			// Players were inserted
			BIS_inHeli = false;
			publicVariable "BIS_inHeli";

			// Fade sound to normal
			10 fadeSound 1;
		};

		_group = group driver _heli;

		if (_heli == BIS_heli2) then {
			// Send the other helicopter back to base
			private ["_wp"];
			_wp = _group addWaypoint [markerPos "BIS_heliDest", 0];
			_wp setWaypointSpeed "NORMAL";
			_wp setWaypointType "MOVE";

			// Delete it when it returns
			_wp setWaypointStatements ["true", "{deleteVehicle _x} forEach ([BIS_heli2] + units group BIS_heli2D)"];
			_group setCurrentWaypoint _wp;
		} else {
			// Have the player one provide recon
			BIS_heli1 flyInHeight 100;

			private ["_pos"];
			_pos = markerPos "BIS_loiter1";

			private ["_wp1", "_wp2"];
			_wp1 = _group addWaypoint [_pos, 0];
			_wp2 = _group addWaypoint [_pos, 0];

			{_x setWaypointSpeed "LIMITED"} forEach [_wp1, _wp2];
			_wp1 setWaypointType "MOVE";
			_wp2 setWaypointType "LOITER";

			_group setCurrentWaypoint _wp1;
		};
	};
} forEach [BIS_playerGroup, BIS_group2];

// Add tasks
{_x call BIS_fnc_missionTasks} forEach ["BIS_loc1", "BIS_loc2"];

// Recap plan
"25_Plan" spawn BIS_fnc_missionConversations;

sleep 50;

// Have helicopter leave
"30_Bug_Out" call BIS_fnc_missionConversations;

sleep 2;

// Wait until other team gets into contact
waitUntil {
	{
		private ["_unit"];
		_unit = _x;
		{_unit knowsAbout _x >= 0.1} count BIS_churchUnits > 0
	} count units BIS_group2 > 0
	||
	BIS_crewFound
};

if (!(BIS_crewFound)) then {
	// Play conversation
	"32_Church_Contact" call BIS_fnc_missionConversations;

	// Wait for all enemies to be dead
	waitUntil {{alive _x} count BIS_churchUnits == 0 || BIS_crewFound};

	if (!(BIS_crewFound)) then {
		// Continue their sweep
		"33_Church_Clear" call BIS_fnc_missionConversations;
	};
};