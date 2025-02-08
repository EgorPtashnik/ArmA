 If (BIS_Infantry) then
 {
 	// first group static
	BIS_CSAT_Coast01 = [getMarkerPos "BIS_CSAT_Coast01Poz", east, ["O_A_soldier_LAT_F"]] call BIS_fnc_spawnGroup;
	_wp1 = BIS_CSAT_Coast01 addwaypoint [getMarkerPos "BIS_CSAT_Coast01Poz",0];
	_wp1 setWaypointType "HOLD";
	{_x allowFleeing 0} forEach units BIS_CSAT_Coast01;

		// fourth group moving
	BIS_CSAT_Coast04 = [getMarkerPos "BIS_CSAT_Coast04Poz", east, ["O_A_soldier_GL_F"]] call BIS_fnc_spawnGroup;
	_wp1 = BIS_CSAT_Coast04 addwaypoint [getMarkerpos "BIS_CSAT_Coast04WP01",0];
	_wp2 = BIS_CSAT_Coast04 addwaypoint [getMarkerpos "BIS_CSAT_Coast04WP02",0];
	_wpC = BIS_CSAT_Coast04 addwaypoint [waypointposition _wp2,0];
	_wpC setwaypointtype "cycle";

	// fifth group static
	BIS_CSAT_Coast05 = [getMarkerPos "BIS_CSAT_Coast05Poz", east, ["O_A_soldier_LAT_F","O_A_soldier_M_F"]] call BIS_fnc_spawnGroup;
	_wp1 = BIS_CSAT_Coast05 addwaypoint [getMarkerPos "BIS_CSAT_Coast05Poz",0];
	_wp1 setWaypointType "HOLD";

	{_x allowFleeing 0} forEach units BIS_CSAT_Coast05;

	// eight group moving
	BIS_CSAT_Coast08 = [getMarkerPos "BIS_CSAT_Coast08Poz", east, ["O_A_soldier_M_F"]] call BIS_fnc_spawnGroup;
	_wp1 = BIS_CSAT_Coast08 addwaypoint [getMarkerpos "BIS_CSAT_Coast08Poz",0];
	_wp1 setwaypointtype "HOLD";

	{_x allowFleeing 0} forEach units BIS_CSAT_Coast08;

	// nineth group static
	BIS_CSAT_Coast09 = [getMarkerPos "BIS_CSAT_Coast09Poz", east, ["O_A_soldier_A_F"]] call BIS_fnc_spawnGroup;
	_wp1 = BIS_CSAT_Coast09 addwaypoint [getMarkerPos "BIS_CSAT_Coast09Poz",0];
	_wp1 setWaypointType "HOLD";
	{_x allowFleeing 0} forEach units BIS_CSAT_Coast09;

	//EH for units on civ. farm house that they firing on the player

	sleep 10;

	{
	_x addEventHandler
	[
	   "Fired",
	 	{
	 		{_x removeAllEventHandlers "Fired"} forEach units BIS_CSAT_Coast09 + units BIS_CSAT_Coast05 + units BIS_CSAT_CivHouse01 + units BIS_CSAT_CivHouse02 + units BIS_CSAT_CivHouse03;
	   		BIS_CivilianHouseSeizeDetected = true;
	  	}
	 ];
	} forEach units BIS_CSAT_Coast09 + units BIS_CSAT_Coast05 + units BIS_CSAT_CivHouse01 + units BIS_CSAT_CivHouse02 + units BIS_CSAT_CivHouse03;
};

// second group moving
BIS_CSAT_Coast02 = [getMarkerPos "BIS_CSAT_Coast02Poz", east, ["O_A_soldier_F"]] call BIS_fnc_spawnGroup;
_wp1 = BIS_CSAT_Coast02 addwaypoint [getMarkerpos "BIS_CSAT_Coast02Poz",0];
_wp1 setwaypointtype "HOLD";

// third group moving
BIS_CSAT_Coast03 = [getMarkerPos "BIS_CSAT_Coast03Poz", east, ["O_A_soldier_AR_F","O_A_soldier_GL_F"]] call BIS_fnc_spawnGroup;
_wp1 = BIS_CSAT_Coast03 addwaypoint [getMarkerpos "BIS_CSAT_Coast03WP01",0];
_wp2 = BIS_CSAT_Coast03 addwaypoint [getMarkerpos "BIS_CSAT_Coast03WP02",0];
_wp3 = BIS_CSAT_Coast03 addwaypoint [getMarkerpos "BIS_CSAT_Coast03WP03",0];
_wpC = BIS_CSAT_Coast03 addwaypoint [waypointposition _wp3,0];
_wpC setwaypointtype "cycle";


// sixth group moving
BIS_CSAT_Coast06 = [getMarkerPos "BIS_CSAT_Coast06Poz", east, ["O_A_soldier_F","O_A_soldier_AT_F"]] call BIS_fnc_spawnGroup;
_wp1 = BIS_CSAT_Coast06 addwaypoint [getMarkerpos "BIS_CSAT_Coast06WP01",0];
_wp2 = BIS_CSAT_Coast06 addwaypoint [getMarkerpos "BIS_CSAT_Coast06WP02",0];
_wp3 = BIS_CSAT_Coast06 addwaypoint [getMarkerpos "BIS_CSAT_Coast06WP03",0];
_wpC = BIS_CSAT_Coast06 addwaypoint [waypointposition _wp3,0];
_wpC setwaypointtype "cycle";

// seventh group moving
BIS_CSAT_Coast07 = [getMarkerPos "BIS_CSAT_Coast07Poz", east, ["O_A_soldier_AT_F"]] call BIS_fnc_spawnGroup;
_wp1 = BIS_CSAT_Coast07 addwaypoint [getMarkerpos "BIS_CSAT_Coast07WP01",0];
_wp2 = BIS_CSAT_Coast07 addwaypoint [getMarkerpos "BIS_CSAT_Coast07WP02",0];
_wpC = BIS_CSAT_Coast07 addwaypoint [waypointposition _wp2,0];
_wpC setwaypointtype "cycle";

{_x allowFleeing 0} forEach units BIS_CSAT_Coast02 + units BIS_CSAT_Coast03 + units BIS_CSAT_Coast06 + units BIS_CSAT_Coast07;

If (BIS_Infantry) then
{
	//trigger area cleared
	_trg = createTrigger ["EmptyDetector", [7639,6221]];
	_trg setTriggerArea [100, 100, 0, false];
	_trg setTriggerActivation ["EAST", "NOT PRESENT", false];
	_trg setTriggerStatements ["this", "BIS_SuppliSeize = true", ""];
	_trg setTriggerTimeout [5, 10, 7, false];
}

//[allUnits - [player]] call BIS_fnc_to_removeSmokes;

