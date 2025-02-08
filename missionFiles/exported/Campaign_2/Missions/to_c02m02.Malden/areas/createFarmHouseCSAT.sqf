//units on farmhouse closer
BIS_CSAT_EvergladesActivated = true;

BIS_CSAT_Reinf01 = [getMarkerPos "BIS_CSATReinf01", east, ["O_A_soldier_F","O_A_medic_F"]] call BIS_fnc_spawnGroup;
_poz = [[[getMarkerPos "BIS_CSATReinf01",50]]] call BIS_fnc_randomPos;
_wp1 = BIS_CSAT_Reinf01 addwaypoint [_poz,0];
_poz = [[[getMarkerPos "BIS_CSATReinf01",50]]] call BIS_fnc_randomPos;
_wp2 = BIS_CSAT_Reinf01 addwaypoint [_poz,0];
_poz = [[[getMarkerPos "BIS_CSATReinf01",50]]] call BIS_fnc_randomPos;
_wp3 = BIS_CSAT_Reinf01 addwaypoint [_poz,0];
_wpC = BIS_CSAT_Reinf01 addwaypoint [waypointposition _wp3,0];
_wpC setwaypointtype "cycle";

BIS_CSAT_Reinf02 = [getMarkerPos "BIS_CSATReinf01", east, ["O_A_soldier_TL_F","O_A_soldier_F","O_A_soldier_AR_F"]] call BIS_fnc_spawnGroup;
_poz = [[[getMarkerPos "BIS_CSATReinf01",120]]] call BIS_fnc_randomPos;
_wp1 = BIS_CSAT_Reinf02 addwaypoint [_poz,0];
_poz = [[[getMarkerPos "BIS_CSATReinf01",120]]] call BIS_fnc_randomPos;
_wp2 = BIS_CSAT_Reinf02 addwaypoint [_poz,0];
_poz = [[[getMarkerPos "BIS_CSATReinf01",120]]] call BIS_fnc_randomPos;
_wp3 = BIS_CSAT_Reinf02 addwaypoint [_poz,0];
_wpC = BIS_CSAT_Reinf02 addwaypoint [waypointposition _wp3,0];
_wpC setwaypointtype "cycle";
sleep 1;
//trigger area cleared
_trg = createTrigger ["EmptyDetector", getMarkerPos "BIS_CSATReinf01"];
_trg setTriggerArea [180, 180, 0, false];
_trg setTriggerActivation ["EAST", "NOT PRESENT", false];
_trg setTriggerStatements ["this", "BIS_EvergladesFall = true", ""];
_trg setTriggerTimeout [5, 10, 7, false];

sleep 10;

{_x allowFleeing 0} forEach [BIS_CSAT_Reinf01,BIS_CSAT_Reinf02];
[allUnits - [player]] call BIS_fnc_to_removeSmokes;