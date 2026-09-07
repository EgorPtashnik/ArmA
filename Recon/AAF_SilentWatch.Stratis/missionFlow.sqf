script = execVM "missionBriefing.sqf";

waitUntil { sleep 1; scriptDone script };
["Mission_Start", true] call EP_fnc_showObjects;

[I_Spotter] joinSilent player;
{ _x moveInAny I_Car } forEach units group player;
enableSentences false;
enableRadio false;

waitUntil { !visibleMap };

["EP_blackScreen", false] call BIS_fnc_blackOut;

sleep 3;

playMusic "Track_P_01";
["EP_blackScreen", false] spawn BIS_fnc_blackIn;
enableSentences true;
enableRadio true;

waitUntil {sleep 1; (unitReady driver I_Car) };

script = "Start_1" call EP_fnc_missionConversations;

waitUntil {sleep 1; (player distance2D (markerPos "I_MrkOverwatch_1")) < 50 };


