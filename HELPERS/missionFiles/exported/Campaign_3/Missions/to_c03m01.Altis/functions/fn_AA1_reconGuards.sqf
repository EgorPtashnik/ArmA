// Script for controlling area with recons (Romeo)
["Recon House"] call BIS_fnc_TO_activateUnits;
//["33_reconsReporting"] spawn BIS_fnc_missionConversations;

private _removeExtraAttackers = {
	params ["_group","_numToRemove"];
	private _units = units BIS_attack_3;
	for "_i" from 0 to (_numToRemove - 1) do {
		deleteVehicle (_units select _i);
	};
	//hint format ["Number of removed units: %1", _numToRemove];
};

// Simulate ambient firefight:
[] spawn {
	waitUntil {!alive BIS_dummy};
	BIS_dummy_2 doTarget BIS_gorgon_ambient;
	group BIS_dummy_2 setCombatMode "YELLOW";
	sleep 1;
	BIS_dummy_2 fireAtTarget [BIS_gorgon_ambient,"NLAW_F"];
	sleep 2;
	BIS_gorgon_ambient setDamage 1;
	deleteVehicle BIS_dummy_2;
};

sleep 10;

private _enemies = (["Recon House"] call BIS_fnc_to_unitList) select {side group _x == RESISTANCE};
private _friendlies = (["Recon House"] call BIS_fnc_to_unitList) select {side group _x == WEST};

private _succeeded = false;
private _result = false;
waitUntil {
	sleep 1;
	if ({alive _x} count _friendlies <= 2) then {
		_succeeded = false;
		_result = true;
	};
	if ({alive _x} count _enemies <= 2) then {
		_succeeded = true;
		_result = true;
	};	
	_result
};

//wait until the conversation is over (it spawns the task)
waitUntil{missionNamespace getVariable ["BIS_to_reconsConversationOver", false];};
waitUntil{!isNil "BIS_atReconHouse"};

if (_succeeded) then {
	{_x allowFleeing 1} forEach _enemies;
	sleep 10;
	["tsk_recon","SUCCEEDED"] call BIS_fnc_taskSetState;
	BIS_reconSucceeded = true;
	["40_helpedRecons"] spawn BIS_fnc_missionConversations;

	// affect number of units in the area
	[BIS_attack_3, 7] call _removeExtraAttackers;
} else {
	["tsk_recon","CANCELED"] call BIS_fnc_taskSetState;
	["38_failedRecons"] spawn BIS_fnc_missionConversations;
	BIS_reconSucceeded = false;

	// decide how many units to delete after loss - 14 by default - take away half of the losses
	private _numSurvivingEnemies = {side _x == RESISTANCE} count (["Recon House"] call BIS_fnc_to_unitList);
	private _numUnitsToDelete = (14 - _numSurvivingEnemies) * 0.5;
	[BIS_attack_3, _numUnitsToDelete] call _removeExtraAttackers;
};

