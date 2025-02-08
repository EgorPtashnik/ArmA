if (!(isMultiplayer)) then {
	BIS_cheat1Used = false;
	BIS_cheat2Used = false;
	
	BIS_cheat1 = {
		{missionNamespace setVariable [_x, true]} forEach ["BIS_spotted", "BIS_flee", "BIS_ROEPassed", "BIS_UAVAllowed"];
		
		["BIS_locate", "SUCCEEDED"] call BIS_fnc_missionTasks;
		["BIS_ROE", "SUCCEEDED"] call BIS_fnc_missionTasks;
		"BIS_destroy" call BIS_fnc_missionTasks;
		
		{deleteVehicle _x} forEach [BIS_sentry1D, BIS_sentry1, BIS_sentry2D, BIS_sentry2, BIS_crashTruck1, BIS_crashTruck2, BIS_crashTruck3, BIS_crashTruck4];
		{deleteVehicle (missionNamespace getVariable _x)} forEach BIS_crashUnits;
		
		{_x setCombatMode "YELLOW"} forEach (units BIS_playerGroup + units BIS_group2);
		
		BIS_wreck setDamage 1;
		
		if (BIS_cheat1Used) then {
			BIS_heli1 setPos [markerPos "BIS_cheat1Pos1" select 0, markerPos "BIS_cheat1Pos1" select 1, 50];
			BIS_heli2 setPos [markerPos "BIS_cheat1Pos2" select 0, markerPos "BIS_cheat1Pos2" select 1, 50];
		};
	};
	
	BIS_cheat2 = {
		[] call BIS_cheat1;
		
		BIS_wreckDestroyed = true;
		BIS_UAVAllowed = false;
		BIS_crashCaptive = 1;
		BIS_heli1Lock = 2;
		BIS_townStatus = 1;
		BIS_heli1Captive = 1;
		BIS_heli2Captive = 1;
		
		["BIS_destroy", "SUCCEEDED"] call BIS_fnc_missionTasks;
		{_x call BIS_fnc_missionTasks} forEach ["BIS_loc1", "BIS_loc2"];
		
		{deleteVehicle _x} forEach ([BIS_LZ1, BIS_LZ2, BIS_heli1, BIS_heli2] + units group BIS_heli1D + units group BIS_heli2D + BIS_townUnits);
		
		if (BIS_cheat2Used) then {
			{_x setPos markerPos "BIS_cheat2Pos1"} forEach units BIS_playerGroup;
			{_x setPos markerPos "BIS_cheat2Pos2"} forEach units BIS_group2;
			{_x setPos markerPos "BIS_cheat2Pos3"} forEach [BIS_crew1, BIS_crew2];
		};
	};
};