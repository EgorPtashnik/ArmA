BIS_DourdanNotActivated = false;
//T-100 above the city
_VarsukDourdan = [selectrandom [getMarkerpos "BIS_CSAT_VarsukPoz"], 180, "O_MBT_02_cannon_F", east] call BIS_fnc_spawnVehicle;
BIS_VarsukDourdan = _VarsukDourdan select 0;
BIS_VarsukDourdan engineOn true;

//trigger cant move or fire destroy
_trg = createTrigger ["EmptyDetector", getPos player];
_trg setTriggerArea [0, 0, 0, false];
_trg setTriggerActivation ["NONE", "PRESENT", true];
_trg setTriggerStatements ["!canMove BIS_VarsukDourdan || !canFire BIS_VarsukDourdan", "BIS_VarsukDourdan setDamage 1", ""];
sleep 1;

//Kamysh in city
_KamyshDourdan = [selectrandom [getMarkerpos "BIS_CSAT_KamyshPoz"], 180, "O_APC_Tracked_02_cannon_F", east] call BIS_fnc_spawnVehicle;
BIS_Kamysh02 = _KamyshDourdan select 0;
BIS_Kamysh02 removeMagazinesTurret ["2Rnd_GAT_missiles",[0]];
deleteVehicle driver BIS_Kamysh02;
BIS_Kamysh02 engineOn true;

//trigger cant move or fire destroy
_trg = createTrigger ["EmptyDetector", getPos player];
_trg setTriggerArea [0, 0, 0, false];
_trg setTriggerActivation ["NONE", "PRESENT", true];
_trg setTriggerStatements ["!canMove BIS_Kamysh02 || !canFire BIS_Kamysh02", "BIS_Kamysh02 setDamage 1", ""];

//--------------------
//INFANTRY ALTERNATIVE
//--------------------

If (BIS_Infantry) then
{
	waitUntil {{_x distance getMarkerPos "BIS_CSAT_Dourdan01Poz" < 450} count units group player >0};

	// first group moving
	BIS_CSAT_Dourdan01 = [getMarkerPos "BIS_CSAT_Dourdan01Poz", east, ["O_A_soldier_AR_F","O_A_soldier_A_F","O_A_soldier_LAT_F","O_A_soldier_M_F","O_A_medic_F","O_A_soldier_GL_F","O_A_soldier_F","O_A_soldier_F","O_A_soldier_LAT_F"]] call BIS_fnc_spawnGroup;

	_wp1 = BIS_CSAT_Dourdan01 addwaypoint [getMarkerpos "BIS_CSAT_Dourdan01WP01",0];
	_wp2 = BIS_CSAT_Dourdan01 addwaypoint [getMarkerpos "BIS_CSAT_Dourdan01WP02",0];
	_wp3 = BIS_CSAT_Dourdan01 addwaypoint [getMarkerpos "BIS_CSAT_Dourdan01WP03",0];
	_wp4 = BIS_CSAT_Dourdan01 addwaypoint [getMarkerpos "BIS_CSAT_Dourdan01WP04",0];
	_wpC = BIS_CSAT_Dourdan01 addwaypoint [waypointposition _wp4,0];
	_wpC setwaypointtype "cycle";

	[] spawn
	{
		waitUntil {{_x distance getMarkerPos "BIS_CSAT_Dourdan01Poz" < 150} count units group player >0};
		// second group moving
		BIS_CSAT_Dourdan02 = [getMarkerPos "BIS_CSAT_Dourdan02Poz", east, ["O_A_soldier_AR_F","O_A_soldier_A_F","O_A_soldier_LAT_F","O_A_soldier_M_F","O_A_medic_F","O_A_soldier_GL_F","O_A_soldier_F","O_A_soldier_F","O_A_soldier_LAT_F"]] call BIS_fnc_spawnGroup;
		_poz = [[[getMarkerPos "BIS_CSAT_Dourdan02Poz",150]]] call BIS_fnc_randomPos;
		_wp1 = BIS_CSAT_Dourdan02 addwaypoint [_poz,0];
		_poz = [[[getMarkerPos "BIS_CSAT_Dourdan02Poz",150]]] call BIS_fnc_randomPos;
		_wp2 = BIS_CSAT_Dourdan02 addwaypoint [_poz,0];
		_poz = [[[getMarkerPos "BIS_CSAT_Dourdan02Poz",150]]] call BIS_fnc_randomPos;
		_wp3 = BIS_CSAT_Dourdan02 addwaypoint [_poz,0];
		_wpC = BIS_CSAT_Dourdan02 addwaypoint [waypointposition _wp3,0];
		_wpC setwaypointtype "cycle";

		sleep 5;

		{_x allowFleeing 0} forEach units BIS_CSAT_Dourdan02;
		{_x disableAI "AUTOCOMBAT"} forEach units BIS_CSAT_Dourdan02;
	};

	waitUntil {{_x distance getMarkerPos "BIS_CSAT_Dourdan01Poz" < 250} count units group player >0};
	sleep 30;
	//counterattack units
	//T-100 in LaTrinite
	_VarsukLaTri = [selectrandom [getMarkerpos "BIS_CSAT_Varsuk01Poz"], 188, "O_MBT_02_cannon_F", east] call BIS_fnc_spawnVehicle;
	BIS_Varsuk01 = _VarsukLaTri select 0;

	//trigger cant move or fire destroy
	_trg = createTrigger ["EmptyDetector", getPos player];
	_trg setTriggerArea [0, 0, 0, false];
	_trg setTriggerActivation ["NONE", "PRESENT", true];
	_trg setTriggerStatements ["!canMove BIS_Varsuk01 || !canFire BIS_Varsuk01", "BIS_Varsuk01 setDamage 1", ""];

	sleep 1;

	//T-100 in Arudy
	_VarsukAru = [selectrandom [getMarkerpos "BIS_CSAT_Varsuk02Poz"], 190, "O_MBT_02_cannon_F", east] call BIS_fnc_spawnVehicle;
	BIS_Varsuk02 = _VarsukAru select 0;

	//trigger cant move or fire destroy
	_trg = createTrigger ["EmptyDetector", getPos player];
	_trg setTriggerArea [0, 0, 0, false];
	_trg setTriggerActivation ["NONE", "PRESENT", true];
	_trg setTriggerStatements ["!canMove BIS_Varsuk02 || !canFire BIS_Varsuk02", "BIS_Varsuk02 setDamage 1", ""];

	sleep 1;

	//Kamysh in LaTrinite
	_KamyshLaTri = [selectrandom [getMarkerpos "BIS_CSAT_Kamysh01Poz"], 190, "O_APC_Tracked_02_cannon_F", east] call BIS_fnc_spawnVehicle;
	BIS_kamysh01 = _KamyshLaTri select 0;
	BIS_kamysh01 removeMagazinesTurret ["2Rnd_GAT_missiles",[0]];

	//trigger cant move or fire destroy
	_trg = createTrigger ["EmptyDetector", getPos player];
	_trg setTriggerArea [0, 0, 0, false];
	_trg setTriggerActivation ["NONE", "PRESENT", true];
	_trg setTriggerStatements ["!canMove BIS_kamysh01 || !canFire BIS_kamysh01", "BIS_kamysh01 setDamage 1", ""];

	sleep 10;

	{_x allowFleeing 0} forEach units BIS_CSAT_Dourdan01  + units BIS_VarsukDourdan + units BIS_Varsuk01 + units BIS_Varsuk02 + units BIS_Kamysh01 + units BIS_Kamysh02;
	{_x disableAI "AUTOCOMBAT"} forEach units BIS_CSAT_Dourdan01  + units BIS_VarsukDourdan + units BIS_Varsuk01 + units BIS_Varsuk02 + units BIS_Kamysh01 + units BIS_Kamysh02;


	BIS_armoredCounterattack = true;
	["35_Inf_CSATArmoredCounterattack"] spawn BIS_fnc_missionConversations;
	sleep 20;
	BIS_Varsuk01 move getMarkerPos "BIS_CSAT_Varsuk01WP01";
	sleep 30;
	BIS_Varsuk02 move getMarkerPos "BIS_CSAT_Varsuk02WP01";
	sleep 30;
	BIS_kamysh01 move getMarkerPos "BIS_CSAT_Kamysh01WP01";

	//trigger that will end all of this
	BIS_trgEnd = createTrigger ["EmptyDetector",getMarkerPos "BIS_task5"];
	BIS_trgEnd setTriggerArea [250, 250, 0, false];
	BIS_trgEnd setTriggerActivation ["ANY", "PRESENT", false];
	BIS_trgEnd setTriggerStatements ["opfor countSide list BIS_trgEnd < 4 and !alive BIS_VarsukDourdan and !alive BIS_Kamysh02 and !alive BIS_Varsuk01 and !alive BIS_Varsuk02 and !alive BIS_Kamysh01","BIS_endMissionInfantry = true",""];
	[allUnits - [player]] call BIS_fnc_to_removeSmokes;
}

else

{

	//--------------------
	//SPECIAL ALTERNATIVE
	//--------------------

	// first group moving
	BIS_CSAT_Dourdan01 = [getMarkerPos "BIS_CSAT_Dourdan01Poz", east, ["O_A_soldier_AR_F","O_A_soldier_A_F","O_A_soldier_LAT_F","O_A_soldier_M_F","O_A_medic_F","O_A_soldier_GL_F","O_A_soldier_F","O_A_soldier_F","O_A_soldier_LAT_F"]] call BIS_fnc_spawnGroup;

	_wp1 = BIS_CSAT_Dourdan01 addwaypoint [getMarkerpos "BIS_CSAT_Dourdan01WP01",0];
	_wp2 = BIS_CSAT_Dourdan01 addwaypoint [getMarkerpos "BIS_CSAT_Dourdan01WP02",0];
	_wp3 = BIS_CSAT_Dourdan01 addwaypoint [getMarkerpos "BIS_CSAT_Dourdan01WP03",0];
	_wp4 = BIS_CSAT_Dourdan01 addwaypoint [getMarkerpos "BIS_CSAT_Dourdan01WP04",0];
	_wpC = BIS_CSAT_Dourdan01 addwaypoint [waypointposition _wp4,0];
	_wpC setwaypointtype "cycle";

	gunner BIS_Slammer01 lookAt objNull;

	//counterattack units
	//T-100 in LaTrinite
	_VarsukLaTri = [selectrandom [getMarkerpos "BIS_CSAT_Varsuk01Poz"], 188, "O_MBT_02_cannon_F", east] call BIS_fnc_spawnVehicle;
	BIS_Varsuk01 = _VarsukLaTri select 0;

	//trigger cant move or fire destroy
	_trg = createTrigger ["EmptyDetector", getPos player];
	_trg setTriggerArea [0, 0, 0, false];
	_trg setTriggerActivation ["NONE", "PRESENT", true];
	_trg setTriggerStatements ["!canMove BIS_Varsuk01 || !canFire BIS_Varsuk01", "BIS_Varsuk01 setDamage 1", ""];

	sleep 1;

	//T-100 in Arudy
	_VarsukAru = [selectrandom [getMarkerpos "BIS_CSAT_Varsuk02Poz"], 190, "O_MBT_02_cannon_F", east] call BIS_fnc_spawnVehicle;
	BIS_Varsuk02 = _VarsukAru select 0;

	//trigger cant move or fire destroy
	_trg = createTrigger ["EmptyDetector", getPos player];
	_trg setTriggerArea [0, 0, 0, false];
	_trg setTriggerActivation ["NONE", "PRESENT", true];
	_trg setTriggerStatements ["!canMove BIS_Varsuk02 || !canFire BIS_Varsuk02", "BIS_Varsuk02 setDamage 1", ""];

	sleep 1;

	//Kamysh in LaTrinite
	_KamyshLaTri = [selectrandom [getMarkerpos "BIS_CSAT_Kamysh01Poz"], 190, "O_APC_Tracked_02_cannon_F", east] call BIS_fnc_spawnVehicle;
	BIS_kamysh01 = _KamyshLaTri select 0;
	BIS_kamysh01 removeMagazinesTurret ["2Rnd_GAT_missiles",[0]];

	//trigger cant move or fire destroy
	_trg = createTrigger ["EmptyDetector", getPos player];
	_trg setTriggerArea [0, 0, 0, false];
	_trg setTriggerActivation ["NONE", "PRESENT", true];
	_trg setTriggerStatements ["!canMove BIS_kamysh01 || !canFire BIS_kamysh01", "BIS_kamysh01 setDamage 1", ""];

	sleep 10;

	{_x allowFleeing 0} forEach units BIS_CSAT_Dourdan01 + units BIS_VarsukDourdan + units BIS_Varsuk01 + units BIS_Varsuk02 + units BIS_Kamysh01 + units BIS_Kamysh02;
	{_x disableAI "AUTOCOMBAT"} forEach units BIS_CSAT_Dourdan01 + units BIS_VarsukDourdan + units BIS_Varsuk01 + units BIS_Varsuk02 + units BIS_Kamysh01 + units BIS_Kamysh02;

	BIS_armoredCounterattack = true;
	BIS_Varsuk01 move getMarkerPos "BIS_CSAT_Varsuk01WP01";
	sleep 10;
	BIS_Varsuk02 move getMarkerPos "BIS_CSAT_Varsuk02WP01";
	sleep 10;
	BIS_kamysh01 move getMarkerPos "BIS_CSAT_Kamysh01WP01";
	[allUnits - [player]] call BIS_fnc_to_removeSmokes;
};
