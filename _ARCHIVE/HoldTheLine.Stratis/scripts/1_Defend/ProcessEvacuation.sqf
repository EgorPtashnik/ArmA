sleep random [180, 90, 180];
waitUntil {sleep 1; EP_WavesSpawned > 2 };

// Comms
"EvacStart" call EP_fnc_missionConversations;

// Send evac units
savegame;
[O_Zamak_1] call EP_spawnOpfEvac;
waitUntil { sleep 1; EP_Evacuated == 1 };
{ deleteVehicle _x } forEach crew O_Zamak_1;
deleteVehicle O_Zamak_1;

savegame;
[O_Zamak_2] call EP_spawnOpfEvac;
waitUntil { sleep 1; EP_Evacuated == 2 };
{ deleteVehicle _x } forEach crew O_Zamak_2;
deleteVehicle O_Zamak_2;

savegame;
[O_Zamak_3] call EP_spawnOpfEvac;
waitUntil { sleep 1; EP_Evacuated == 3 };
{ deleteVehicle _x } forEach crew O_Zamak_3;
deleteVehicle O_Zamak_3;

savegame;
[O_Zamak_4, 2] call EP_spawnOpfEvac;
waitUntil { sleep 1; EP_Evacuated == 4 };
{ deleteVehicle _x } forEach crew O_Zamak_4;
deleteVehicle O_Zamak_4;

// Comms
private _handle = "EvacEnd" call EP_fnc_missionConversations;
waitUntil { scriptDone _handle };