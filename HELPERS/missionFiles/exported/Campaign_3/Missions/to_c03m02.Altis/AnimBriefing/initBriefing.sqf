//Disable player simulation during the briefing
player enableSimulation false;

//Wait 2 seconds. This is NEEDED else it won't work properly on restart (scripts take too much time to get initialized)
titlecut ["","BLACK FADED"];
sleep 2;
//waituntil {!isnil "bis_fnc_init"};

//include both briefings and tools
#include "AnimBrief_c03_m02.sqf";

// - First Briefing -
BIS_mrkArray_A = ["BIS_mrkh_A_"] call BIS_fnc_getMarkers;

//hide map controls (diary and so on)
[false] call BIS_fnc_TO_showMapControls;

[ _timelineA, 0, nil, allMapMarkers, getMissionLayerEntities "showAtEnd" select 1, "BIS_zoom0"] spawn BIS_fnc_animatedBriefing;

//disable textures
//ctrlActivate ( ( findDisplay 12 ) displayCtrl 107 );

//Wait for timeline to initialize and set eventTime_playing to true
Sleep 2;

//Wait until timeline is over 
waitUntil{!(missionNamespace getVariable ["BIS_fnc_eventTimeline_playing", true]);};

//show map controls (diary, etc...)
[true] call BIS_fnc_TO_showMapControls;

//enable player simulation
player enableSimulation true;

//Give the FSM time to teleport the player to its correct position
sleep 1;