[] spawn {
	for "_i" from 1 to 120 do { EP_baseLoudspeakers say3D "Alarm"; sleep 2; };
};

// Delay between groups spawning
sleep random 10; 

// Spawn enemy
private _groupClasses = [ "Aegis_B_E_Soldier_SL_F", "Aegis_B_E_RadioOperator_F", "Aegis_B_E_Soldier_LAT_F", "Aegis_B_E_Soldier_M_F", "Aegis_B_E_Soldier_TL_F", "Aegis_B_E_Soldier_AR_F", "Aegis_B_E_Soldier_A_F", "Aegis_B_E_Medic_F" ];
private _spawned = [];

{ 
	private _group = [_x, blufor, _groupClasses] call EP_fnc_createGroup;
	_spawned pushBack _group;
} forEach (["EP_mrkBaseSpawn"] call EP_fnc_collectMarkers);

// Attack player immediately
{ [_x, player] call EP_fnc_taskAttack } forEach _spawned;
