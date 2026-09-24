//******************************************************************************************
// Миссия
//******************************************************************************************
[ [blufor, [] ], [opfor, [] ] ] call ep_fnc_missionInit;
["ZoneAO_1"] call LXWS_fnc_CoverMap;

//******************************************************************************************
// BLUFOR - Игрок
//******************************************************************************************
B_ApcC moveInCommander B_Apc;
B_ApcD moveInDriver B_Apc;

B_Inf addVehicle B_Apc;
{ _x moveInCargo B_Apc } forEach units B_Inf;

//******************************************************************************************
// BLUFOR - Вертолеты
//******************************************************************************************
{ _x moveInCargo B_Heli_1} forEach units B_InfHeli_1;
{ _x moveInCargo B_Heli_2} forEach units B_InfHeli_2;
{ _x moveInCargo B_Heli_3} forEach units B_InfHeli_3;
{ _x setCaptive true } forEach [B_Heli_1, B_Heli_2, B_Heli_3];
["Вертолеты с пехотой", false] call EP_fnc_showObjects;
["Точка Браво", false] call EP_fnc_showObjects;


//******************************************************************************************
// OPFOR - аванпост
//******************************************************************************************
{ [_x, (selectRandom ["StandArmed", "Watch", "KneelArmed"])] call EF_fnc_ambientAnim} forEach units O_InfOutpost;



//******************************************************************************************
// Маркеры
//******************************************************************************************
{ _x setMarkerAlpha 0 } forEach ["O_MrkAlpha", "O_MrkBravo", "ZoneAO_1", "Zone_AO_2"];