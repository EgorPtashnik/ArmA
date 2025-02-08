BIS_follow = {
	private ["_unit"];
	_unit = _this;
	
	scriptName (format ["extraction.sqf: BIS_follow - [%1]", _unit]);
	
	// Find the closest player
	private ["_closestPlayer"];
	_closestPlayer = {
		private ["_unit"];
		_unit = _this;
		
		// Find alive players
		private ["_players"];
		_players = playableUnits + switchableUnits;
		{if (!(isPlayer _x) || !(alive _x)) then {_players deleteAt (_players find _x)}} forEach _players;
		
		if (count _players == 0) exitWith {objNull};
		
		// Find distances
		private ["_dists"];
		_dists = [];
		{_dists set [count _dists, _unit distance vehicle _x]} forEach _players;
		
		// Find closest player
		private ["_closest"];
		_closest = [_dists, 0] call BIS_fnc_findExtreme;
		_players select (_dists find _closest)
	};
	
	private ["_group"];
	_group = group _unit;
	
	while {alive _unit && {!(BIS_extractReady)}} do {
		waitUntil {sleep 1; !(isNull (_unit call _closestPlayer))};
		
		private ["_player"];
		_player = _unit call _closestPlayer;
		
		// Stance control
		[_unit, _player] spawn {
			private ["_unit", "_player"];
			_unit = _this select 0;
			_player = _this select 1;
			
			scriptName (format ["BIS_follow: stance control - [%1, %2]", _unit, _player]);
			
			while {{!(alive _x)} count [_unit, _player] == 0 && {!(BIS_extractReady)}} do {
				// Copy player's stance
				switch (stance _player) do {
					case "STAND": {_unit setUnitPos "AUTO"};
					case "CROUCH": {_unit setUnitPos "MIDDLE"};
					case "PRONE": {_unit setUnitPos "DOWN"};
				};
				
				sleep 1;
			};
		};
		
		// Follow the player
		while {{!(alive _x)} count [_unit, _player] == 0 && {!(BIS_extractReady)}} do {
			private ["_vehicle", "_playerPos"];
			_vehicle = vehicle _player;
			_playerPos = position _vehicle;
			_playerPos set [2, 0];
			
			if (speed _vehicle > 0) then {
				_unit doMove _playerPos;
				sleep 1;
			} else {
				private ["_unitPos"];
				_unitPos = [_playerPos, 5, random 360] call BIS_fnc_relPos;
				_unit doMove _unitPos;
				waitUntil {sleep 1; vehicle _player distance _playerPos > 5 || {!(alive _x)} count [_unit, _player] > 0 || BIS_extractReady};
			};
		};
	};
};

{
	private ["_unit"];
	_unit = _x;
	
	// Track whether unit is taking their weapon
	_unit setVariable ["BIS_takeWeapon", false];
	
	// Move to crate
	private ["_group", "_wp"];
	_group = group _unit;
	_wp = _group addWaypoint [[BIS_crate, 2, random 360] call BIS_fnc_relPos, 0];
	_wp setWaypointStatements ["true", format ["%1 setVariable ['BIS_takeWeapon', true]", _unit]];
	_wp setWaypointType "MOVE";
	_group setCurrentWaypoint _wp;
	
	_unit spawn {
		private ["_unit"];
		_unit = _this;
		
		scriptName (format ["extraction.sqf: captive weapon control - [%1]", _unit]);
		
		waitUntil {_unit getVariable "BIS_takeWeapon"};
		
		// Prevent from moving
		_unit disableAI "MOVE";
		
		// Track animations
		private ["_animEH"];
		_animEH = _unit addEventHandler [
			"AnimDone",
			{
				private ["_unit", "_anim"];
				_unit = _this select 0;
				_anim = _this select 1;
				
				switch (_anim) do {
					case "amovpercmstpsnonwnondnon_ainvpknlmstpsnonwnondnon": {
						// Give them their weapon
						if (_unit == BIS_crew1) then {
							_unit addMagazines ["30Rnd_556x45_Stanag", 5];
							_unit addWeapon "arifle_Mk20_F";
						} else {
							_unit addMagazines ["30Rnd_556x45_Stanag", 5];
							_unit addWeapon "arifle_TRG20_F";
						};
						
						_unit selectWeapon primaryWeapon _unit;
						
						// Make them follow the players
						_unit spawn BIS_follow;
					};

					case "ainvpknlmstpslaywrfldnon_amovpercmstpsraswrfldnon": {
						// Remove event handler
						_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
						_unit setVariable ["BIS_animEH", nil];
						
						// Let them move
						_unit enableAI "MOVE";
						_unit setBehaviour "AWARE";
					};
				};
			}
		];
		
		// Store event handler
		_unit setVariable ["BIS_animEH", _animEH];
		
		// Bend down
		_unit playMove "AinvPknlMstpSnonWnonDnon_1";
	};
} forEach [BIS_crew1, BIS_crew2];

// Make other group continue to destination
BIS_group2 setCurrentWaypoint (waypoints BIS_group2 select ((count waypoints BIS_group2) - 1));

if (!(isMultiplayer)) then {
	// Prevent player's group from receiving engage orders
	BIS_playerGroup enableAttack false;
	
	// Determine destination
	private ["_dest"];
	_dest = format ["BIS_main%1WP", if (BIS_crewLocation == 1) then {"Gas"} else {"Outpost"}];
	
	// Add waypoint
	private ["_wp"];
	_wp = BIS_playerGroup addWaypoint [markerPos _dest, 0];
	_wp setWaypointVisible false;
	_wp showWaypoint "NEVER";
	_wp setWaypointSpeed "FULL";
	_wp setWaypointStatements ["true", "{_x setUnitPos 'MIDDLE'} forEach units BIS_playerGroup"];
	BIS_playerGroup setCurrentWaypoint _wp;
};

// Prevent other group from receiving engage orders
BIS_group2 enableAttack false;

// Position the LZ
private ["_marker"];
_marker = format ["BIS_%1LZ", if (BIS_crewLocation == 1) then {"gas"} else {"outpost"}];
BIS_LZ3 setPos markerPos _marker;

// Send extract helicopter
BIS_extractStatus = 1;
publicVariable "BIS_extractStatus";

private ["_group", "_wp"];
_group = group BIS_extractD;
_wp = _group addWaypoint [position BIS_LZ3, 0];
_wp waypointAttachVehicle BIS_LZ3;
_wp setWaypointBehaviour "CARELESS";
_wp setWaypointSpeed "NORMAL";
_wp setWaypointCombatMode "BLUE";
_wp setWaypointStatements ["true", "BIS_extract land 'GET IN'"];
_wp setWaypointType "MOVE";
_group setCurrentWaypoint _wp;

// Wait for extraction to arrive
waitUntil {(getPosATL BIS_extract select 2) >= 8};
waitUntil {(getPosATL BIS_extract select 2) < 8};

// Register that extract is ready
BIS_extractReady = true;
publicVariable "BIS_extractReady";

// Change task destination
["BIS_extract", [BIS_extract, true]] call BIS_fnc_taskSetDestination;

// Open doors
{BIS_extract animateDoor [_x, 1]} forEach ["Door_L", "Door_R"];

// Make player's team get in
BIS_playerGroup addVehicle BIS_extract;

// Assign specific seat indexes in SP
if (!(isMultiplayer)) then {
	private ["_index"];
	_index = if (BIS_crewLocation == 1) then {1} else {3};
	BIS_player assignAsCargoIndex [BIS_extract, _index]
};

// Order them in
(units BIS_playerGroup) orderGetIn true;

private ["_wp"];
_wp = BIS_playerGroup addWaypoint [position vehicle leader BIS_playerGroup, 0];
_wp setWaypointVisible false;
_wp showWaypoint "NEVER";
_wp setWaypointSpeed "FULL";
_wp setWaypointType "GETIN";
BIS_playerGroup setCurrentWaypoint _wp;

// Make other teams get in
{
	_x addVehicle BIS_extract;
	(units _x) orderGetIn true;
	
	private ["_wp"];
	_wp = _x addWaypoint [position vehicle leader _x, 0];
	_wp setWaypointSpeed "FULL";
	_wp setWaypointType "GETIN";
	_x setCurrentWaypoint _wp;
} forEach [BIS_group2, group BIS_crew1, group BIS_crew2];

// Force everyone to stand
{_x setUnitPos "UP"} forEach ([BIS_crew1, BIS_crew2] + units BIS_playerGroup + units BIS_group2);

// Prevent extraction helicopter from taking off
BIS_extract flyInHeight 0;

private ["_group", "_wp"];
_group = group BIS_extractD;
_wp = _group addWaypoint [position BIS_extract, 0];
_wp setWaypointType "MOVE";

if (!(isMultiplayer)) then {
	// Wait for player to get in
	BIS_extractLock = 1;
	waitUntil {BIS_player in BIS_extract};
};

sleep 30;

// Teleport AI closer to helicopter
private ["_pos"];
_pos = markerPos (format ["BIS_%1Move", if (BIS_crewLocation == 1) then {"gas"} else {"outpost"}]);
{if (!(isPlayer _x) && {alive _x && {!(_x in BIS_extract)}}) then {_x setPos _pos}} forEach ([BIS_crew1, BIS_crew2] + units BIS_playerGroup + units BIS_group2);