//Remove useless unit when final hill is reached
{
	if (_x isKindOf "Man") then {
		deleteVehicle _x;
	};
} forEach (["Recon House","Enemy Patrols","Backup Forces_1"] call BIS_fnc_to_unitList);
