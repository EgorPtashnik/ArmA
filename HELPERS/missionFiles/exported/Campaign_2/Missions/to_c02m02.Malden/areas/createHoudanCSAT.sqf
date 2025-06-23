//CSAT units

//Ifrit
BIS_IfritHoudan = "O_MRAP_02_hmg_F" createVehicle getMarkerPos "BIS_Ifrit01";
BIS_IfritHoudan setDir 199;
BIS_IfritHoudan engineOn true;
BIS_CSAT_IfritGunner = [getMarkerPos "BIS_CSATInf01", east, ["O_A_soldier_F"]] call BIS_fnc_spawnGroup;
(units BIS_CSAT_IfritGunner select 0) moveIngunner BIS_IfritHoudan;
BIS_IfritHoudan lock true;
clearWeaponCargo BIS_IfritHoudan;
clearMagazineCargo BIS_IfritHoudan;

//infantry in Houdan
BIS_CSAT_InfantrySquad01 = [getMarkerPos "BIS_CSATInf01", east, ["O_A_soldier_F","O_A_soldier_M_F"]] call BIS_fnc_spawnGroup;
_wp1 = BIS_CSAT_InfantrySquad01 addwaypoint [getMarkerPos "BIS_CSATInf01WP01",0];
_wp1 setWaypointType "HOLD";

BIS_CSAT_InfantrySquad03 = [getMarkerPos "BIS_CSATInf03", east, ["O_A_soldier_F","O_A_soldier_F","O_A_soldier_AR_F"]] call BIS_fnc_spawnGroup;
_wp1 = BIS_CSAT_InfantrySquad03 addwaypoint [getMarkerPos "BIS_CSATInf03",0];
_wp2 = BIS_CSAT_InfantrySquad03 addwaypoint [getMarkerPos "BIS_CSATInf04",0];
_wp3 = BIS_CSAT_InfantrySquad03 addwaypoint [getMarkerPos "BIS_CSATInf05",0];
_wpC = BIS_CSAT_InfantrySquad03 addwaypoint [getMarkerPos "BIS_CSATInf03",0];
_wpC setWaypointType "CYCLE";

BIS_CSAT_InfantrySquad04 = [getMarkerPos "BIS_CSATInf04", east, ["O_A_soldier_TL_F","O_A_soldier_F","O_A_soldier_F","O_A_soldier_GL_F"]] call BIS_fnc_spawnGroup;
_wp1 = BIS_CSAT_InfantrySquad04 addwaypoint [getMarkerPos "BIS_CSATInf05",0];
_wp1 setWaypointType "HOLD";
sleep 10;
{_x allowFleeing 0} forEach [BIS_CSAT_InfantrySquad01,BIS_CSAT_InfantrySquad03,BIS_CSAT_InfantrySquad04];
[allUnits - [player]] call BIS_fnc_to_removeSmokes;
If (BIS_Infantry) then
{
	[] spawn
	{
	waitUntil {player distance getMarkerPos "BIS_Houdan" < 150};

		BIS_CSAT_InfantrySquad02 = [getMarkerPos "BIS_CSATInf02", east, ["O_A_soldier_TL_F","O_A_officer_F","O_A_soldier_AR_F"]] call BIS_fnc_spawnGroup;
		_wp1 = BIS_CSAT_InfantrySquad02 addwaypoint [getMarkerPos "BIS_CSATInf02",0];
		_wp2 = BIS_CSAT_InfantrySquad02 addwaypoint [getMarkerPos "BIS_CSATInf03",0];
		_wp3 = BIS_CSAT_InfantrySquad02 addwaypoint [getMarkerPos "BIS_CSATInf04",0];
		_wpC = BIS_CSAT_InfantrySquad02 addwaypoint [getMarkerPos "BIS_CSATInf02",0];
		_wpC setWaypointType "CYCLE";

		BIS_CSAT_InfantrySquad05 = [getMarkerPos "BIS_CSATInf05", east, ["O_A_soldier_SL_F","O_A_soldier_F","O_A_medic_F"]] call BIS_fnc_spawnGroup;
		_wp1 = BIS_CSAT_InfantrySquad05 addwaypoint [getMarkerPos "BIS_CSATInf05",0];
		_wp1 setWaypointType "HOLD";

		BIS_CSAT_InfantrySquad07 = [getMarkerPos "BIS_CSATInf07", east, ["O_A_soldier_F","O_A_soldier_F"]] call BIS_fnc_spawnGroup;
		_wp1 = BIS_CSAT_InfantrySquad07 addwaypoint [getMarkerPos "BIS_CSATInf07",0];
		_wp1 setWaypointType "HOLD";
		sleep 10;
		{_x allowFleeing 0} forEach [BIS_CSAT_InfantrySquad02,BIS_CSAT_InfantrySquad05,BIS_CSAT_InfantrySquad07];
		[allUnits - [player]] call BIS_fnc_to_removeSmokes;
	};

	[] spawn
	{
		waitUntil {!BIS_houdanSeized and player distance getMarkerPos "BIS_CSATInf04" < 75};
		BIS_CSAT_InfantrySquad08 = [getMarkerPos "BIS_CSATInf04", east, ["O_A_soldier_TL_F","O_A_officer_F","O_A_soldier_AR_F"]] call BIS_fnc_spawnGroup;
		_wp1 = BIS_CSAT_InfantrySquad08 addwaypoint [getMarkerPos "BIS_CSATInf04",0];
		_wp1 setWaypointType "GUARD";

		sleep 3;
		{_x allowFleeing 0} forEach [BIS_CSAT_InfantrySquad08];
	};

}
else
{
	BIS_CSAT_InfantrySquad02 = [getMarkerPos "BIS_CSATInf02", east, ["O_A_soldier_TL_F","O_A_officer_F","O_A_soldier_AR_F"]] call BIS_fnc_spawnGroup;
	_wp1 = BIS_CSAT_InfantrySquad02 addwaypoint [getMarkerPos "BIS_CSATInf02",0];
	_wp2 = BIS_CSAT_InfantrySquad02 addwaypoint [getMarkerPos "BIS_CSATInf03",0];
	_wp3 = BIS_CSAT_InfantrySquad02 addwaypoint [getMarkerPos "BIS_CSATInf04",0];
	_wpC = BIS_CSAT_InfantrySquad02 addwaypoint [getMarkerPos "BIS_CSATInf02",0];
	_wpC setWaypointType "CYCLE";

	BIS_CSAT_InfantrySquad05 = [getMarkerPos "BIS_CSATInf05", east, ["O_A_soldier_SL_F","O_A_soldier_F","O_A_medic_F"]] call BIS_fnc_spawnGroup;
	_wp1 = BIS_CSAT_InfantrySquad05 addwaypoint [getMarkerPos "BIS_CSATInf05",0];
	_wp1 setWaypointType "HOLD";

	BIS_CSAT_InfantrySquad07 = [getMarkerPos "BIS_CSATInf07", east, ["O_A_soldier_F","O_A_soldier_F"]] call BIS_fnc_spawnGroup;
	_wp1 = BIS_CSAT_InfantrySquad07 addwaypoint [getMarkerPos "BIS_CSATInf07",0];
	_wp1 setWaypointType "HOLD";
	sleep 10;
	{_x allowFleeing 0} forEach [BIS_CSAT_InfantrySquad02,BIS_CSAT_InfantrySquad05,BIS_CSAT_InfantrySquad07];
	{_x removeMagazines "SmokeShellYellow"} forEach units BIS_CSAT_InfantrySquad02 + units BIS_CSAT_InfantrySquad05 + units BIS_CSAT_InfantrySquad07;

	BIS_CSAT_InfantrySquad08 = [getMarkerPos "BIS_CSATInf04", east, ["O_A_soldier_TL_F","O_A_officer_F","O_A_soldier_AR_F"]] call BIS_fnc_spawnGroup;
	_wp1 = BIS_CSAT_InfantrySquad08 addwaypoint [getMarkerPos "BIS_CSATInf04",0];
	_wp1 setWaypointType "HOLD";

	sleep 3;
	{_x allowFleeing 0} forEach [BIS_CSAT_InfantrySquad08];
	[allUnits - [player]] call BIS_fnc_to_removeSmokes;
};
