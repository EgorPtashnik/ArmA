case "01_Spotted": {
	BIS_SFA = leader BIS_group2;
	["01_Spotted", "Showcase_FiringFromVehicles", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	
	// Register that they were spotted
	BIS_spotted = true;
	publicVariable "BIS_spotted";
};

case "05_Sentries": {
	BIS_SFA = leader BIS_group2;
	["05_Sentries", "Showcase_FiringFromVehicles", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "10_Located": {
	BIS_SFA = leader BIS_group2;
	["10_Located", "Showcase_FiringFromVehicles", [["SFA", 0], ["SFA", 0]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	// Let crash site units engage
	{
		private ["_unit"];
		_unit = missionNamespace getVariable [_x, objNull];
		if (!(isNull _unit)) then {_unit spawn {sleep 0.5; _this setCombatMode "YELLOW"}};
	} forEach BIS_crashUnits;
	
	// Wait for helicopters to be engaged
	waitUntil {BIS_ROEPassed};
	
	BIS_SFA = leader BIS_group2;
	["10_Located", "Showcase_FiringFromVehicles", [["HEL", 0]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "15_Technical": {
	BIS_SFA = leader BIS_group2;
	["15_Technical", "Showcase_FiringFromVehicles", [["HEL", 0], ["HEL", 0]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	
	// Helicopter particle effects
	[
		[
			[],
			{
				waitUntil {!(isNil "BIS_fnc_missionEffect_smoke")};
				"BIS_heli2" call BIS_fnc_missionEffect_smoke;
			}
		],
		"BIS_fnc_spawn",
		true,
		true
	] call BIS_fnc_MP;
	
	BIS_SFA = leader BIS_group2;
	["15_Technical", "Showcase_FiringFromVehicles", [["SFA", 0], ["SFA", 2]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	
	sleep 10;
	
	// Allow UAV
	BIS_UAVAllowed = true;
	publicVariable "BIS_UAVAllowed";
	
	// Add task
	"BIS_destroy" call BIS_fnc_missionTasks;
	
	BIS_SFA = leader BIS_group2;
	["15_Technical", "Showcase_FiringFromVehicles", [["BHQ", 1]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "20_Destroyed": {
	BIS_SFA = leader BIS_group2;
	["20_Destroyed", "Showcase_FiringFromVehicles", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	
	"23_Orders" call BIS_fnc_missionConversations;
};

case "23_Orders": {
	BIS_SFA = leader BIS_group2;
	["23_Orders", "Showcase_FiringFromVehicles", [["BHQ", 0], ["SFA", 0]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	
	sleep 1;
	
	BIS_SFA = leader BIS_group2;
	["23_Orders", "Showcase_FiringFromVehicles", [["BHQ", 1], ["BHQ", 1]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	
	// Unhide marker
	"BIS_town_area" setMarkerAlpha 1;
	
	// Let them attack the town
	BIS_attackTown = true;
	publicVariable "BIS_attackTown";
	
	BIS_SFA = leader BIS_group2;
	["23_Orders", "Showcase_FiringFromVehicles", [["BHQ", 2]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "25_Plan": {
	BIS_SFA = leader BIS_group2;
	["25_Plan", "Showcase_FiringFromVehicles", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "30_Bug_Out": {
	// Have truck gunner target helicopter
	private ["_skill"];
	_skill = skill BIS_gas1;
	BIS_gas1 setSkill 1;
	BIS_gas1 reveal BIS_heli1;
	BIS_gas1 doWatch BIS_heli1;
	
	BIS_SFA = leader BIS_group2;
	["30_Bug_Out", "Showcase_FiringFromVehicles", [["HEL", 0], ["HEL", 1]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	
	sleep 0.5;
	
	BIS_gas1 setSkill 1;
	BIS_gas1 reveal BIS_heli1;
	BIS_gas1 doWatch BIS_heli1;
	
	// Make truck gunner fire
	_skill spawn {
		scriptName "missionConversations.sqf: truck fire";
		
		private ["_skill"];
		_skill = _this;
		
		private ["_unit", "_truck", "_target", "_bursts"];
		_unit = BIS_gas1;
		_truck = BIS_gasTruck1;
		_target = BIS_heli1;
		_bursts = 0;
		
		while {_bursts < 6 && {alive _unit && {canFire _truck}}} do {
			private ["_rounds"];
			_rounds = [3,4] call BIS_fnc_selectRandom;
			
			for "_i" from 1 to _rounds do {
				if (alive _unit && {canFire _truck}) then {
					_unit fireAtTarget [_target];
					sleep (0.1 + random 0.1);
				};
			};
			
			_bursts = _bursts + 1;
			
			sleep 0.2;
		};
		
		// Reset gunner
		_unit setSkill _skill;
		_unit doWatch objNull;
		
	};
	
	sleep 0.5;
	
	enableSentences false;
	
	// Make helicopter bug out
	BIS_bugOut = true;
	publicVariable "BIS_bugOut";
	
	// Reset altitude
	BIS_heli1 flyInHeight 50;
	
	private ["_group"];
	_group = group BIS_heli1D;
	
	// Delete exisiting waypoints
	while {count waypoints _group > 0} do {deleteWaypoint (waypoints _group select 0)};
	
	// Add waypoint
	private ["_wp"];
	_wp = _group addWaypoint [markerPos "BIS_heliDest", 0];
	_wp setWaypointSpeed "NORMAL";
	
	// Delete upon reaching the waypoint
	_wp setWaypointStatements ["true", "{deleteVehicle _x} forEach ([BIS_heli1] + units group BIS_heli1D)"];
	
	_wp setWaypointType "MOVE";
	_group setCurrentWaypoint _wp;
	
	BIS_SFA = leader BIS_group2;
	["30_Bug_Out", "Showcase_FiringFromVehicles", [["HEL", 2]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "32_Church_Contact": {
	BIS_SFA = leader BIS_group2;
	["32_Church_Contact", "Showcase_FiringFromVehicles", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "33_Church_Clear": {
	BIS_SFA = leader BIS_group2;
	["33_Church_Clear", "Showcase_FiringFromVehicles", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "35_Crew_Found": {
	BIS_SFA = leader BIS_group2;
	["35_Crew_Found", "Showcase_FiringFromVehicles", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "40_All_In": {
	BIS_SFA = leader BIS_group2;
	["40_All_In", "Showcase_FiringFromVehicles", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "45_Extracted": {
	BIS_SFA = leader BIS_group2;
	["45_Extracted", "Showcase_FiringFromVehicles", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "50_Artillery": {
	BIS_SFA = leader BIS_group2;
	["50_Artillery", "Showcase_FiringFromVehicles", [["SFA", 0], ["SFA", 0]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	
	sleep 1;
	
	BIS_SFA = leader BIS_group2;
	["50_Artillery", "Showcase_FiringFromVehicles", [["SFA", 1], ["SFA", 1]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	
	BIS_SFA = leader BIS_group2;
	["50_Artillery", "Showcase_FiringFromVehicles", [["BHQ", 0], ["BHQ", 0]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	
	sleep 1;
	
	BIS_SFA = leader BIS_group2;
	["50_Artillery", "Showcase_FiringFromVehicles", [["SFA", 2], ["SFA", 2]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	
	sleep 1;
	
	BIS_SFA = leader BIS_group2;
	["50_Artillery", "Showcase_FiringFromVehicles", [["BHQ", 1], ["SFA", 3]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	
	BIS_SFA = leader BIS_group2;
	["50_Artillery", "Showcase_FiringFromVehicles", [["SFA", 4]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	
	sleep 2;
	
	// End the mission
	BIS_endMission = true;
	publicVariable "BIS_endMission";
};

case "x01_ROE_Failed": {
	BIS_SFA = leader BIS_group2;
	["x01_ROE_Failed", "Showcase_FiringFromVehicles", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "x05_UAV_No_Ammo": {
	BIS_SFA = leader BIS_group2;
	["x05_UAV_No_Ammo", "Showcase_FiringFromVehicles", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	
	"23_Orders" call BIS_fnc_missionConversations;
};

case "x10_UAV_Warning": {
	BIS_SFA = leader BIS_group2;
	["x10_UAV_Warning", "Showcase_FiringFromVehicles", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "x15_UAV_Punish": {
	BIS_SFA = leader BIS_group2;
	["x15_UAV_Punish", "Showcase_FiringFromVehicles", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	
	sleep 2;
	
	// Destroy wreck
	BIS_wreck setDamage 1;
	BIS_wreckDestroyed = true;
	publicVariable "BIS_wreckDestroyed";
	
	"20_Destroyed" call BIS_fnc_missionConversations;
};