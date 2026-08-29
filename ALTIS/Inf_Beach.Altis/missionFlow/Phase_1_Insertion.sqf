private _handle = nil;
waitUntil { time > 0 };

[B_Apc, "B_WpInsertion", "TR UNLOAD", [{true}, {"C2" call EP_fnc_missionConversations}]] call EP_fnc_addWaypoint;

enableSentences false;
enableRadio false;
["EP_blackScreen", false] call BIS_fnc_blackOut;
[0, 0, false, true] call BIS_fnc_cinemaBorder;

sleep 3;

playMusic "ATrack3";
["EP_blackScreen", false] spawn BIS_fnc_blackIn;
_handle = [1, "BLACK", 5, 0] spawn BIS_fnc_fadeEffect;


waitUntil { scriptDone _handle };
[1, 1.5, false, true] call BIS_fnc_cinemaBorder;
sleep 1.5;

_handle = [
    "ОПЕРАЦИЯ: БЕРЕГ",
    "МЕСТО: АЛТИС, БЕРЕГОВОЙ СЕКТОР",
    format ["ВРЕМЯ: %1", [dayTime, "HH:MM"] call BIS_fnc_timeToString]
] spawn BIS_fnc_EXP_camp_SITREP;


waitUntil { scriptDone _handle };
enableSentences true;
enableRadio true;
sleep 1;
"C1" call EP_fnc_missionConversations;


// Высадка
waitUntil {sleep 1; ((units B_Inf) findIf {_x in B_Apc}) == -1 };
"t1" call EP_fnc_missionTasks;

// След фаза
execVM "missionFlow\Phase_2_Combat.sqf";
