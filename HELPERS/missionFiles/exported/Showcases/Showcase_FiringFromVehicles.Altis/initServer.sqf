//===================================================================
// PRE-INIT
//===================================================================
// Set up markers
"BIS_crashSite_area" setMarkerPos markerPos "BIS_crashSite";
"BIS_town_area" setMarkerAlpha 0;

// Tasks
{_x call BIS_fnc_missionTasks} forEach ["BIS_locate", "BIS_ROE"];

// Mission flow variables
// Broadcasted for debugging purposes
{
	missionNamespace setVariable [_x, false];
	publicVariable _x;
} forEach [
	"BIS_spotted", "BIS_flee", "BIS_ROEPassed", "BIS_ROEFailed", "BIS_engaged", "BIS_UAVAllowed", "BIS_outOfTime", "BIS_finalRound", "BIS_wreckDestroyed", "BIS_attackTown",
	"BIS_bugOut", "BIS_gasSearched", "BIS_toOutpost", "BIS_outpostSearched", "BIS_crewFound", "BIS_extractReady", "BIS_rocketSplash", "BIS_endMission"
];

BIS_inHeli = true;
publicVariable "BIS_inHeli";

// Local arrays
// Used only by the server to evaluate flow conditions
BIS_crashUnits = ["BIS_crash1", "BIS_crash2", "BIS_crash3", "BIS_crash4", "BIS_crash5", "BIS_crash6", "BIS_crash7", "BIS_crash8", "BIS_crash9", "BIS_crash10", "BIS_crash11", "BIS_crashTruck1D", "BIS_crashTruck1G", "BIS_crashTruck2D", "BIS_crashTruck3D", "BIS_crashTruck4D"];
BIS_gasUnits = [BIS_gas1, BIS_gas2, BIS_gas3, BIS_gas4];
BIS_outpostUnits = [BIS_outpost1, BIS_outpost2, BIS_outpost3, BIS_outpost4];
BIS_churchUnits = [BIS_church1, BIS_church2, BIS_church3, BIS_church4];

// Global arrays
// Used by the server and clients for either flow conditions or events
BIS_townUnits = (BIS_gasUnits + BIS_outpostUnits + BIS_churchUnits + units BIS_townGroup1 + units BIS_townGroup2 + units BIS_townGroup3);
BIS_townTrucks = [BIS_townTruck1, BIS_townTruck2, BIS_townTruck3, BIS_townTruck4, BIS_gasTruck1];
BIS_civUnits = ["BIS_civ1", "BIS_civ2", "BIS_civ3", "BIS_civ4", "BIS_civ5"];
{publicVariable _x} forEach ["BIS_townUnits", "BIS_townTrucks", "BIS_civUnits"];

// Statuses
// Broadcasted due to local functionality
BIS_crewStatus = 0;	// 0: captive, 1: rescued
BIS_heli1Captive = 0;	// 0: normal, 1: captive
BIS_heli2Captive = 0;	// 0: normal, 1: captive
BIS_heli1Lock = 2;	// Functions the same as the lock command
BIS_heli2Lock = 2;	// Functions the same as the lock command
BIS_crashCaptive = 0;	// 0: normal, 1: captive
BIS_townStatus = 0;	// 0: hidden, 1: unhidden
BIS_extractStatus = 0;	// 0: hidden, 1: unhidden
BIS_extractLock = 2;	// Functions the same as the lock command

{publicVariable _x} forEach ["BIS_crewStatus", "BIS_heli1Captive", "BIS_heli2Captive", "BIS_heli1Lock", "BIS_heli2Lock", "BIS_crashCaptive", "BIS_townStatus", "BIS_extractStatus"];

// Hide players' waypoints
{_x setWaypointVisible false} forEach (waypoints BIS_playerGroup);

{
	// Add loadouts to the other group
	_x call BIS_Showcase_FFV_fnc_addLoadout;
	
	// Prevent them from taking damage from anyone other than the player(s)
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
} forEach units BIS_group2;

// Ensure correct crew appearance
{
	_x setBehaviour "CARELESS";
	_x setUnitPos "UP";
	
	// Add AAF clothing
	[_x, "I_Helipilot_F"] call BIS_fnc_loadInventory;
	removeAllWeapons _x;
	removeHeadgear _x;
	_x unlinkItem "NVGoggles_INDEP";
} forEach [BIS_crew1, BIS_crew2];

// Prevent units from engaging
if (!(isMultiplayer)) then {
	{_x setCombatMode "BLUE"} forEach units BIS_playerGroup;
};

{_x setCombatMode "BLUE"} forEach units BIS_group2;

// Delete extraction helicopter gunners
{
	private ["_unit", "_group"];
	_unit = BIS_extract turretUnit [_x];
	_group = createGroup WEST;
	[_unit] joinSilent _group;
	unassignVehicle _unit;
	_group leaveVehicle BIS_extract;
	deleteVehicle _unit;
} forEach [1,2];



waitUntil {time > 0};
//===================================================================
// POST-INIT
//===================================================================
enableSentences false;

// Set up insertion helicopters
{
	private ["_heli"];
	_heli = _x;
	
	// Lock cabin seats
	{_heli lockCargo [_x, true]} forEach [0,1];
	_heli setUnloadInCombat [false, false];
	
	// Clear cargo
	clearBackpackCargoGlobal _heli;
	clearItemCargoGlobal _heli;
	clearMagazineCargoGlobal _heli;
	clearWeaponCargoGlobal _heli;
} forEach [BIS_heli1, BIS_heli2];

// Set up extraction helicopter
BIS_extract setUnloadInCombat [false, false];
clearBackpackCargoGlobal BIS_extract;
clearItemCargoGlobal BIS_extract;
clearMagazineCargoGlobal BIS_extract;
clearWeaponCargoGlobal BIS_extract;

if (!(isMultiplayer)) then {
	// Position player
	BIS_player assignAsCargoIndex [BIS_heli1, 2];
	BIS_player moveInCargo [BIS_heli1, 2];
	
	// Position Marksman
	BIS_player2 assignAsCargoIndex [BIS_heli1, 5];
	BIS_player2 moveInCargo [BIS_heli1, 5];
	
	// Position the rest
	{
		_x assignAsCargo BIS_heli1;
		_x moveInCargo BIS_heli1;
	} forEach [BIS_player1, BIS_player3];
	
	// Stop player from shooting
	BIS_player enableSimulation false;
	
	// Disable fatigue
	{_x enableFatigue false} forEach [BIS_player1, BIS_player2, BIS_player3];
} else {
	private ["_index"];
	_index = 2;
	
	{
		// Broadcast to move them into the helicopter where the unit is local
		_x assignAsCargoIndex [BIS_heli1, _index];
		[[_x, [BIS_heli1, _index]], "moveInCargo", _x] call BIS_fnc_MP;
		_index = _index + 1;
		
		waitUntil {_x in BIS_heli1};
		
		// Raise all player weapons
		if (isPlayer _x) then {[[_x, ["WeaponInHand", _x]], "action", _x] call BIS_fnc_MP};
	} forEach units BIS_playerGroup;
	
	// Handle respawn positions
	[] spawn {
		scriptName "initServer.sqf: add group respawn";
		
		// Wait for group to exist
		waitUntil {!(isNull (missionNamespace getVariable ["BIS_playerGroup", grpNull]))};
		
		// Add group respawn
		[WEST, BIS_playerGroup] call BIS_fnc_addRespawnPosition;
	};
	
	// Fail the mission if all players are killed
	[] spawn {
		scriptName "initServer.sqf: players killed control";
		
		waitUntil {{alive _x} count units BIS_playerGroup > 0};
		waitUntil {{alive _x} count units BIS_playerGroup == 0};
		
		[["Fail01", false], "BIS_fnc_endMission", true, true] call BIS_fnc_MP;
	};
};

{
	// Move the other group into their helicopter
	_x assignAsCargo BIS_heli2;
	_x moveInCargo BIS_heli2;
	
	// Disable fatigue
	_x enableFatigue false;
} forEach units BIS_group2;

// Track if players disobey the ROE
[] spawn {
	scriptName "initServer.sqf: ROE control";
	
	waitUntil {BIS_ROEFailed || BIS_ROEPassed};
	
	if (!(BIS_ROEPassed)) then {
		// Players disobeyed the ROE
		["BIS_ROE", "FAILED"] call BIS_fnc_missionTasks;
		"x01_ROE_Failed" call BIS_fnc_missionConversations;
	};
};

// Prevent damage to helicopters and crew
{_x allowDamage false} forEach ([BIS_heli1, BIS_heli2] + units group BIS_heli1D + units group BIS_heli2D);

// Prevent units from fleeing
{_x allowFleeing 0} forEach allUnits;

// Set up the wreckage
BIS_wreck setDamage 0.8;
{BIS_wreck setHitPointDamage [_x, 1]} forEach ["HitHRotor", "HitVRotor"];
clearBackpackCargoGlobal BIS_wreck;
clearItemCargoGlobal BIS_wreck;
clearMagazineCargoGlobal BIS_wreck;
clearWeaponCargoGlobal BIS_wreck;

// Set up the UAV
private ["_vel"];
_vel = velocity BIS_UAV;
[BIS_UAV, 600] call BIS_fnc_setHeight;
BIS_UAV setVelocity _vel;
BIS_UAV flyInHeight 600;
BIS_UAV removeMagazines "Laserbatteries";
BIS_UAV removeWeapon "Laserdesignator_mounted";
BIS_UAV lockDriver true;

// Randomize where the UAV is looking
private ["_pos"];
_pos = [markerPos "BIS_UAVTarget", random 360, random 200] call BIS_fnc_relPos;
"BIS_UAVTarget" setMarkerPos _pos;
BIS_UAV lockCameraTo [markerPos "BIS_UAVTarget", [0]];

// Set up characters
BIS_BHQ hideObjectGlobal true;
BIS_BHQ enableSimulationGlobal false;
BIS_BHQ allowDamage false;
BIS_BHQ setCaptive true;
[BIS_BHQ, 1000] call BIS_fnc_setHeight;

// Apply insignias
{if ((faction _x) in ["BLU_F", "IND_F"]) then {[_x, "TFAegis"] call BIS_fnc_setUnitInsignia}} forEach allUnits;

{
	private ["_unit"];
	_unit = missionNamespace getVariable [_x, objNull];
	
	if (!(isNull _unit)) then {
		// Prevent crash site units from firing
		_unit setCombatMode "BLUE";
		
		// Track when they engage
		private ["_firedEH"];
		_firedEH = _unit addEventHandler ["Fired", {BIS_engaged = true; publicVariable "BIS_engaged"}];
		_unit setVariable ["BIS_firedEH", _firedEH];
	};
} forEach BIS_crashUnits;

// Change crews' faces and voices
{
	private ["_face", "_speaker"];
	_face = (format ["GreekHead_A3_0%1", round (1 + random 8)]);
	_speaker = (format ["Male0%1GRE", round (1 + random 5)]);
	
	[[_x, _face], "setFace", true, true] call BIS_fnc_MP;
	[[_x, _speaker], "setSpeaker", true, true] call BIS_fnc_MP;
} forEach [BIS_crew1, BIS_crew2];

// Fail the mission if either crew member is killed
[] spawn {
	scriptName "initServer.sqf: crew killed control";
	
	waitUntil {{!(alive _x)} count [BIS_crew1, BIS_crew2] > 0};
	[["Fail02", false], "BIS_fnc_endMission", true, true] call BIS_fnc_MP;
};

// Define locations
private ["_positions"];
_positions = [
	// Gas Station
	[
		[
			[[8490.67,18274.5,0.291611], 76.2442],
			[[8490.22,18276,0.348389], 76.2442]
		]
	],
	// Outpost
	[
		[
			[[8380.97,18259,0.800369], 159.457],
			[[8380.08,18258.7,0.799957], 159.457]
		],
		[
			[[8359.06,18248.1,0.823975], 73.0772],
			[[8359.36,18247.1,0.799789], 73.0772]
		]
	]
];

// Define possibilities
// 1: gas station, 2: outpost
private ["_options"];
_options = [1,2];

// Select a random location
private ["_location", "_info"];
_location = _options call BIS_fnc_selectRandom;
_info = (_positions select (_location - 1)) call BIS_fnc_selectRandom;

// Position them
{
	private ["_details", "_pos", "_dir"];
	_details = _info select _forEachIndex;
	_pos = _details select 0;
	_dir = _details select 1;
	
	_x setPos _pos;
	_x setDir _dir;
} forEach [BIS_crew1, BIS_crew2];

// Position crate
private ["_marker"];
_marker = if (_location == 1) then {"BIS_gasCrate"} else {"BIS_outpostCrate"};
BIS_crate setPos markerPos _marker;

// Store and broadcast their location
BIS_crewLocation = _location;
publicVariable "BIS_crewLocation";

// Add other group's extract waypoint
private ["_dest", "_wp"];
_dest = format ["BIS_sec%1WP", if (BIS_crewLocation == 1) then {"Gas"} else {"Outpost"}];
_wp = BIS_group2 addWaypoint [markerPos _dest, 0];
_wp setWaypointSpeed "FULL";
_wp setWaypointStatements ["true", "0 = [] spawn {if (isServer && {!(BIS_extractReady)}) then {{_x setUnitPos 'MIDDLE'} forEach units BIS_group2}}"];

// Open door on civilian's house
private ["_house"];
_house = [8627.86,18255,-0.110504] nearestObject "Land_i_Shop_01_V2_F";
[_house, "Door_5_rot", "Door_Handle_5_rot_1", "Door_Handle_5_rot_2"] call BIS_fnc_DoorOpen;

// Open doors at gas station
private ["_station"];
_station = [8491.19,18271.2,-0.360764] nearestObject "Land_CarService_F";
[_station, "Door_1_rot", "Door_Handle_1_rot_1", "Door_Handle_1_rot_2"] call BIS_fnc_DoorOpen;
[_station, "Door_2_rot", "Door_Handle_2_rot_1", "Door_Handle_2_rot_2"] call BIS_fnc_DoorOpen;
[_station, "Door_3_rot", "Door_Handle_3_rot_1", "Door_Handle_3_rot_2"] call BIS_fnc_DoorOpen;

// Open doors at outpost
private ["_outpost1", "_outpost2"];
_outpost1 = [8362.51,18248.9,0.0571289] nearestObject "Land_Cargo_House_V1_F";
_outpost2 = [8381.82,18255.6,-0.0218048] nearestObject "Land_Cargo_House_V1_F";
{[_x, "Door_1_rot"] call BIS_fnc_DoorNoHandleOpen} forEach [_outpost1, _outpost2];

// Open fence doors at Syrta church
private ["_fence"];
_fence = [8615.04,18361.5,0.0325928] nearestObject "Land_Stone_Gate_F";
[_fence, "Door_1_rot", "Door_Handle_1_rot_1", "Door_Handle_1_rot_2"] call BIS_fnc_DoorOpen;
[_fence, "Door_2_rot"] call BIS_fnc_DoorNoHandleOpen;

// Break church window
private ["_church"];
_church = [8642.73,18363.9,-0.0605469] nearestObject "Land_Chapel_V1_F";
_church setHitPointDamage ["Glass_5_hitpoint", 1];

// Break windows at gas station
private ["_gas"];
_gas = [8491.19,18271.2,-0.360764] nearestObject "Land_CarService_F";
{_gas setHitPointDamage [_x, 1]} forEach ["Glass_1_hitpoint", "Glass_3_hitpoint"];

// Hide helipad
private ["_helipad"];
_helipad = [8423.31,18207.4,0.0205231] nearestObject "Land_HelipadSquare_F";
_helipad hideObjectGlobal true;
_helipad enableSimulationGlobal false;