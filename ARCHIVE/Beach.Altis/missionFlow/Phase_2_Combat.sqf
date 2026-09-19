// Двигаемся к аванпосту
[B_Inf, "O_MrkOutpost"] call EP_fnc_addWaypoint;

private _outpostPos = "O_MrkOutpost" call EP_fnc_getPosition;
waitUntil {sleep 1; (player distance2D _outpostPos) < 300 };
savegame;
playMusic "ATrack4";

// Бой
waitUntil {sleep 1; combatBehaviour O_InfOutpost == "COMBAT" };
[O_InfOutpost, "O_MrkOutpost", "GUARD", "RED", "COMBAT"] call EP_fnc_addWaypoint;
private _trigger = ["O_MrkOutpost", 1, [100, 100, 0, false], ["EAST", "NOT PRESENT", false]] call EP_fnc_createTrigger;

// Захвачено
waitUntil {sleep 1; triggerActivated _trigger };
["t1", true] call EP_fnc_missionTasks;
deleteVehicle _trigger;
[B_Apc, (["O_MrkOutpost", 100] call EP_fnc_getRandomPosition)] call EP_fnc_addWaypoint;
[B_Inf, "O_MrkOutpost", "GUARD", "COMBAT"] call EP_fnc_addWaypoint;
"O_MrkOutpost" setMarkerColor "ColorWEST";

sleep 5;
"C3" call EP_fnc_missionConversations;

// След фаза
execVM "missionFlow\Phase_3_Counterattack.sqf";
