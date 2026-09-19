// Function to create APC
private _spawnAPC = {
	params ["_mrkSpawn", "_mrkDest", "_group"];
	private _spawnPos = getMarkerPos _mrkSpawn;
	private _destPos = getMarkerPos _mrkDest;
	private _dir = markerDir _mrkSpawn;
	private _spawned = [_spawnPos, _dir, "Aegis_B_E_APC_tracked_03_cannon_v2_F", _group] call BIS_fnc_spawnVehicle;
	EP_ambAPC = _spawned # 0;
	[
		EP_ambAPC,
		["EAF_01", 1],
		["showBags",0,"showBags2",1,"showCamonetHull",1,"showCamonetTurret",1,"showTools",0,"showSLATHull",1,"showSLATTurret",1]
	] call BIS_fnc_initVehicle;

	// Trigger for APC to be destroyed by player
	// If destroyed - APC will be no longer spawned
	EP_trg_ambAPC = [] spawn {
		private _group = group EP_ambAPC;
		while { true } do {
			if (!canMove EP_ambAPC && !(_group getVariable "KIA")) exitWith {
				EP_ambAPC setDamage 1;
				_group setVariable ["KIA", true];
				["taskAPC", "SUCCEEDED"] call EP_fnc_missionTasks;
				"apcKIA" call EP_fnc_showSubtitles;
			};

			if ( !(_group getVariable "detected") && cursorTarget == EP_ambAPC) then {
				_group setVariable ["detected", true];
				private _handle = "apcSee" call EP_fnc_showSubtitles;
				waitUntil { sleep 1; scriptDone _handle };
				"taskAPC" call EP_fnc_missionTasks;

				// Send QRF
				private _groupClasses = [ "Aegis_B_E_Soldier_SL_F", "Aegis_B_E_RadioOperator_F", "Aegis_B_E_Soldier_LAT_F", "Aegis_B_E_Soldier_M_F", "Aegis_B_E_Soldier_TL_F", "Aegis_B_E_Soldier_AR_F", "Aegis_B_E_Soldier_A_F", "Aegis_B_E_Medic_F" ];
				private _grp = ["EP_mrkLCity", blufor, _groupClasses] call EP_fnc_createGroup;
				[_grp, EP_ambAPC, "MOVE", "AWARE", "FULL"] call EP_fnc_addWaypoint;
				[_grp, EP_ambAPC, "SAD", "AWARE", "LIMITED"] call EP_fnc_addWaypoint;
			};

			sleep 1;
		};
	};

	_group setVariable ["enRoute", true];
	_group call EP_fnc_clearWaypoints;
	[_group, _destPos, "LIMITED", "SAFE", [
		{ true },
		{
			(group this) setVariable ["enRoute", false];
			terminate EP_trg_ambAPC;
			EP_ambAPC = nil;
			{
				private _veh = _x;
				{ _veh deleteVehicleCrew _x } forEach crew _veh;
				deleteVehicle _veh;
			} forEach ([group this, true] call BIS_fnc_groupVehicles);
		}
	]] call EP_fnc_addWaypoint;
};


private _group = createGroup blufor;
_group setVariable ["markers", ["EP_mrkAmbAPC_1", "EP_mrkAmbAPC_2"]];
_group setVariable ["KIA", false];
_group setVariable ["detected", false];
_group setVariable ["enRoute", false];

while { true } do {
	if (_group getVariable "KIA") exitWith {};

	if !(_group getVariable "enRoute") then {
		private _mrkSpawn = ((_group getVariable "markers") # 0);
		private _mrkDest = ((_group getVariable "markers") # 1);
		if (_mrkSpawn == "EP_mrkAmbAPC_1") then {
			_group setVariable ["markers", ["EP_mrkAmbAPC_2", "EP_mrkAmbAPC_1"]];
		} else {
			_group setVariable ["markers", ["EP_mrkAmbAPC_1", "EP_mrkAmbAPC_2"]];
		};

		[_mrkSpawn, _mrkDest, _group] call _spawnAPC;
	};

	sleep (random 120);
};
