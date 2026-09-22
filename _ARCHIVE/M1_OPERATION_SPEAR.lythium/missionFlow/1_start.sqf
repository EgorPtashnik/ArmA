private _handle = nil;

// Intro shot
[
	"m_town",
	["Somewhere in Takistan", 300, 200, random 360],
	[ "Operation 'SPEAR'", "Support squad 'Bravo'", (dayTime call BIS_fnc_timeToString)]
] call ep_fnc_missionIntro;

playMusic "LeadTrack02_F_EPA";

sleep 3;

_handle = "intro" call ep_fnc_showSubtitles;

waitUntil { sleep 1; (combatBehaviour e_grp_start) == "COMBAT" };

[e_grp_start, player] call ep_fnc_taskAttack;

waitUntil { sleep 1; (units e_grp_start) findIf {alive _x} == -1 };

sleep 4;

playMusic "CUP_A2OA_Arrival";
["taskOutpost", "SUCCEEDED"] call ep_fnc_missionTasks;

waitUntil { sleep 1; player distance2D ("m_position" call ep_fnc_getPosition) <= 25 };

["taskPosition", "SUCCEEDED"] call ep_fnc_missionTasks;

sleep 3;

_handle = "inPosition" call ep_fnc_showSubtitles;

waitUntil { sleep 1; scriptDone _handle };

execVM "missionFlow\2_town_preparations.sqf";
