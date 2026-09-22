waitUntil { !visibleMap };
disableMapIndicators [false, false, false, false];
[I_GrpCar, true] call EP_fnc_showObjects;
"Start_1" call EP_fnc_missionTasks;
[I_Spotter] joinSilent player;
{ _x moveInAny I_Car } forEach units group player;

sleep 3;

playMusic "Track_P_01";
["EP_blackScreen"] spawn BIS_fnc_blackIn;
enableEnvironment true;
enableSentences true;
enableRadio true;