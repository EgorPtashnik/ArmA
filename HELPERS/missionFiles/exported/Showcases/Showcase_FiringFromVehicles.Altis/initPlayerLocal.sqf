private ["_unit", "_didJIP"];
_unit = _this select 0;
_didJIP = _this select 1;

//===================================================================
// PRE-INIT
//===================================================================
// Skip titles and such for debugging purposes
BIS_skipStart = false;
BIS_worldHidden = false;

if (!(BIS_skipStart)) then {
	if (_didJIP) then {
		// Hide world
		[] spawn {
			disableSerialization;
			scriptName "initPlayerLocal.sqf: hide world";
			("BIS_blackScreen" call BIS_fnc_rscLayer) cutText ["", "BLACK FADED", 10e10];
			
			waitUntil {!(alive player)};
			waitUntil {visibleMap};
			
			// Show world
			("BIS_blackScreen" call BIS_fnc_rscLayer) cutText ["", "BLACK IN", 1];
		};
		
		// Fade sound to appropriate level
		[] spawn {
			scriptName "initPlayerLocal.sqf: sound fade";
			waitUntil {!(isNil "BIS_inHeli")};
			if (BIS_inHeli) then {0 fadeSound 0.4} else {0 fadeSound 1};
		};
	} else {
		enableRadio false;
		0 fadeSound 0;
		
		if (!(isMultiplayer)) then {
			titleCut ["", "BLACK FADED", 10e10];
		} else {
			[] spawn {
				disableSerialization;
				
				scriptName "initPlayerLocal.sqf: screen fade";
				
				// Hide helicopters speeding up for non-JIP players
				("BIS_blackScreen" call BIS_fnc_rscLayer) cutText ["", "BLACK FADED", 10e10];
				
				sleep 3;
				
				enableRadio true;
				5 fadeSound 0.4;
				
				sleep 2;
				
				("BIS_blackScreen" call BIS_fnc_rscLayer) cutText ["", "BLACK IN", 3];
			};
		};
	};
};

if (!(isMultiplayer)) then {
	// Register player unit
	BIS_player = BIS_player4;
	
	// Add loadouts
	{_x call BIS_Showcase_FFV_fnc_addLoadout} forEach [BIS_player, BIS_player1, BIS_player2, BIS_player3];
	
	// Prevent units other than the player taking damage
	{
		private ["_damageEH"];
		_damageEH = _x addEventHandler [
			"HandleDamage",
			{
				private ["_damage", "_source"];
				_damage = _this select 2;
				_source = _this select 3;
				
				if (isPlayer _source) then {_damage} else {0};
			}
		];
		
		_x setVariable ["BIS_damageEH", _damageEH];
	} forEach [BIS_player1, BIS_player2, BIS_player3];
} else {
	// Add loadout to player
	player call BIS_Showcase_FFV_fnc_addLoadout;
	
	// Ensure it stays upon respawn
	player addMPEventHandler [
		"MPRespawn",
		{
			private ["_unit"];
			_unit = _this select 0;
			
			if (!(_unit getVariable ["BIS_revive_incapacitated", false])) then {
				// Only apply loadout if they aren't incapacitated
				[[_unit], "BIS_Showcase_FFV_fnc_addLoadout", _unit] call BIS_fnc_MP;
			};
		}
	];
	
	// Eject player from vehicle when killed
	// Otherwise position is still viewed as taken
	player addMPEventHandler [
		"MPKilled",
		{
			private ["_unit", "_vehicle"];
			_unit = _this select 0;
			_vehicle = vehicle _unit;
			
			if (local _unit && {_vehicle != _unit}) then {
				[_unit, _vehicle] spawn {
					disableSerialization;
					
					private ["_unit", "_vehicle"];
					_unit = _this select 0;
					_vehicle = _this select 1;
					
					scriptName (format ["initPlayerLocal.sqf: player killed eventhandler - [%1, %2]", _unit, _vehicle]);
					
					sleep 1;
					
					// Move unit out of vehicle
					_unit setPosATL getPosATL _vehicle;
					
					waitUntil {alive player};
					
					if (!(BIS_inHeli)) then {1 fadeSound 1} else {1 fadeSound 0.4};
				};
			};
		}
	];
};



waitUntil {time > 0};
//===================================================================
// POST-INIT
//===================================================================
// Execute UAV control
BIS_UAV enableUAVWaypoints false;
[] call BIS_Showcase_FFV_fnc_UAV;

// Track if units fire to violate the ROE
[] spawn {
	scriptName "initPlayerLocal.sqf: ROE event handler";
	
	waitUntil {!(isNil "BIS_ROEPassed")};
	
	if (!(BIS_ROEPassed)) then {
		// Add fired event handler
		private ["_firedEH"];
		_firedEH = player addEventHandler [
			"Fired",
			{
				private ["_unit"];
				_unit = _this select 0;
				
				// Remove fired event handler
				_unit removeEventHandler ["Fired", _unit getVariable "BIS_firedEH"];
				_unit setVariable ["BIS_firedEH", nil];
				
				if (!(BIS_ROEPassed)) then {
					// Player failed to follow the ROE
					BIS_ROEFailed = true;
					publicVariable "BIS_ROEFailed";
				};
			}
		];
		
		player setVariable ["BIS_firedEH", _firedEH];
	};
};

// Punish the player they become a renegade
[] spawn {
	scriptName "initPlayerLocal.sqf: renegade control";
	
	if (!(isMultiplayer)) then {
		// Single player
		waitUntil {side player == sideEnemy};
		["friendlyFire", false] call BIS_fnc_endMission;
	} else {
		// Multiplayer
		while {true} do {
			// Wait for the player to become a renegade
			waitUntil {side player == sideEnemy};
			
			// Punish player
			player setDamage 1;
			titleText [toUpper (localize "STR_A3_CfgDebriefing_friendlyFire_1"), "PLAIN"];
			
			// Wait for respawn
			waitUntil {alive player && side player != sideEnemy};
		};
	};
};

// Track player's search progress
[] spawn {
	scriptName "initPlayerLocal.sqf: search control";
	
	waitUntil {!(isNil "BIS_crewLocation")};
	
	if (BIS_crewLocation == 2) then {
		// Track if player searches the gas station
		waitUntil {{isNil _x} count ["BIS_gasSearched", "BIS_gasUnits"] == 0};
		
		while {!(BIS_gasSearched)} do {
			waitUntil {({alive _x} count BIS_gasUnits == 0 && {vehicle player == player && {player in list BIS_gasTrig}}) || BIS_gasSearched};
			
			if (!(BIS_gasSearched)) then {
				private ["_time"];
				_time = time + 2;
				
				waitUntil {time >= _time || vehicle player != player || !(player in list BIS_gasTrig) || BIS_gasSearched};
				
				if (time >= _time) then {
					// Register that the gas station was searched
					BIS_gasSearched = true;
					publicVariable "BIS_gasSearched";
				};
			};
		};
	} else {
		// Track if player searches the outpost
		waitUntil {{isNil _x} count ["BIS_outpostSearched", "BIS_outpostUnits"] == 0};
		
		while {!(BIS_outpostSearched)} do {
			waitUntil {({alive _x} count BIS_outpostUnits == 0 && {vehicle player == player && {player in list BIS_outpostTrig}}) || BIS_outpostSearched};
			
			if (!(BIS_outpostSearched)) then {
				private ["_time"];
				_time = time + 2;
				
				waitUntil {time >= _time || vehicle player != player || !(player in list BIS_outpostTrig) || BIS_outpostSearched};
				
				if (time >= _time) then {
					// Register that the gas station was searched
					BIS_outpostSearched = true;
					publicVariable "BIS_outpostSearched";
				};
			};
		};
	};

};

// Track if player enters secret room
[] spawn {
	scriptName "initPlayerLocal.sqf: secret";
	
	waitUntil {(!(alive BIS_secretGuard) && {vehicle player == player && {player in list BIS_secretTrig}}) || player in BIS_extract};
	
	if (!(player in BIS_extract)) then {
		sleep 1;
		
		0 fadeMusic 1;
		playMusic "EventTrack01a_F_EPB";
		
		// Unlock achievement
		setStatValue ["MarkBadOmens", 1];
	};
};

if (!(isMultiplayer)) then {
	if (!(BIS_skipStart)) then {
		// Only show titlecard & establishing shot in SP
		sleep 1;
		
		0 fadeMusic 0.8;
		playMusic "LeadTrack02_F_Mark";
		
		// Show titlecard
		["\a3\missions_f_mark\video\ffv.ogv", "STR_A3_Showcase_FiringFromVehicles_Titlecard1"] spawn BIS_fnc_titlecard;
		waitUntil {!(isNil "BIS_fnc_titlecard_finished")};
		
		// Show establishing shot
		private ["_colorWest", "_colorEast"];
		_colorWest = WEST call BIS_fnc_sideColor;
		_colorEast = EAST call BIS_fnc_sideColor;
		{_x set [3, 0.33]} forEach [_colorWest, _colorEast];
		
		[
			BIS_heli1,							// Target object
			localize "STR_A3_Showcase_FiringFromVehicles_SITREP_text",	// SITREP text
			800,								// 500m altitude
			400,								// 200m radius
			0,								// 0 degrees viewing angle
			1,								// Clockwise movement
			[
				["\a3\ui_f\data\map\markers\nato\b_air.paa", _colorWest, group BIS_heli1D, 1, 1, 0, "", 0],
				["\a3\ui_f\data\map\markers\nato\b_air.paa", _colorWest, group BIS_heli2D, 1, 1, 0, "", 0]
			],
			0,
			false
		] spawn BIS_fnc_establishingShot;
		
		waitUntil {!(isNil "BIS_missionStarted")};
		
		enableRadio true;
		0 fadeSound 0;
		titleCut ["", "BLACK FADED", 10e10];
		3 fadeSound 0.4;
		titleCut ["", "BLACK IN", 3];
	};
	
	// Raise player's weapon
	BIS_player enableSimulation true;
	BIS_player action ["WeaponInHand", BIS_player];
};