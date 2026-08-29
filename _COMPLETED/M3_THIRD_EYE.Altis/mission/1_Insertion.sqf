//******************************************************
// Player walks into the scene (INTRO)
//******************************************************
["EP_blackScreen", false] call BIS_fnc_blackOut;
[0, 0, false, true] call BIS_fnc_cinemaBorder;

sleep 1;

["EP_blackScreen", false] spawn BIS_fnc_blackIn;
private _handle = [1, "BLACK", 5, 0] spawn BIS_fnc_fadeEffect;
player switchMove "HubSpectator_walk";
playMusic "Track_R_09";

waitUntil { scriptDone _handle };

[1, 1.5, false, true] call BIS_fnc_cinemaBorder;
sleep 1.5;
player playMoveNow "amovpercmstpslowwrfldnon";

[[ 
	["CAMP VANGUARD", "<t align='start' shadow='1' size='0.7' font='PuristaBold'>%1</t><br/>", 10], 
	["GRID " + mapGridPosition player, "<t align='start' shadow='1' size='0.7' font='PuristaMedium'>%1</t><br/>", 10], 
	[("2025, JUNE, ") + ([dayTime, "HH:MM"] call BIS_fnc_timeToString), "<t align='start' shadow='1' size='0.7' font='PuristaMedium'>%1</t>", 30] 
], 0, 0] spawn BIS_fnc_typeText;

sleep 2;

//******************************************************
// Send Heli
//******************************************************
EP_VEH_BLU_Heli allowDamage false;
EP_VEH_BLU_Heli landAt [EP_startHP, "Land"];

sleep 5;

_handle = "1_Intro" call EP_fnc_missionConversations;

waitUntil { sleep 1; scriptDone _handle };
"EPTaskGetInHeli" call EP_fnc_missionTasks;

waitUntil { sleep 1; player in EP_VEH_BLU_Heli };
["EPTaskGetInHeli", "SUCCEEDED"] call EP_fnc_missionTasks;
{ [EP_VEH_BLU_Heli, _x] call EP_fnc_addWaypoint } forEach [EP_VEH_BLU_Heli, "EP_wpHeli_1", "EP_wpHeli_2"];
sleep 5;
_handle = "1_inHeli" call EP_fnc_missionConversations;
_handle spawn {
	waitUntil { sleep 1; scriptDone _this };
	sleep 5;
	private _handle = "1_inHeliHQ" call EP_fnc_missionConversations;
	enableRadio false;
	waitUntil { sleep 1; scriptDone _handle };
	playMusic "CUP_A2OA_Good_Morning_TStan";
	"EPTaskGetOutHeli" call EP_fnc_missionTasks;
	"EPMrkInsertion" setMarkerAlpha 1;
};

waitUntil { sleep 1; EP_VEH_BLU_Heli distance2D (getMarkerPos "EP_wpHeli_2") < 300 };
EP_VEH_BLU_Heli flyInHeight 30;

waitUntil { unitReady driver EP_VEH_BLU_Heli };

EP_VEH_BLU_Heli land "GET OUT";

waitUntil { unitReady driver EP_VEH_BLU_Heli };

player allowDamage false;
doGetOut player;
["EPTaskGetOutHeli", "SUCCEEDED"] call EP_fnc_missionTasks;

waitUntil { !(player in EP_VEH_BLU_Heli) };

enableRadio true;
EP_VEH_BLU_Heli engineOn true;
EP_VEH_BLU_Heli flyInHeight [100, true];
player allowDamage true;

// Send heli back to base and cleanup once done
spawn {
	[EP_VEH_BLU_Heli, EP_startHP] call EP_fnc_addWaypoint;
	sleep 20;
	waitUntil { unitReady driver EP_VEH_BLU_Heli };
	[EP_VEH_BLU_Heli, 500] call EP_fnc_cleanupArea;
};

sleep 15;

execVM "mission\2_OpfBase.sqf";
