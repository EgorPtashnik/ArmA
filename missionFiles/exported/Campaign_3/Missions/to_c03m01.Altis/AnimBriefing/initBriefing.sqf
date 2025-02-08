//Disable player simulation during the briefing
//player enableSimulation false;

//Wait 2 seconds. This is NEEDED else it won't work properly on restart (scripts take too much time to get initialized)
titlecut ["","BLACK FADED"];
sleep 2;

//include both briefings adn tools
#include "AnimBrief_c03_m01.sqf";

private _allMarkers = (getMissionLayerEntities "showAtEnd") select 1;

//hide map controls (diary and so on)
[false] call BIS_fnc_TO_showMapControls;

// - First Briefing -
//BIS_mrkArray_A = ["BIS_mrkh_A_"] call BIS_fnc_getMarkers;
_d = [_timelineA, 0, nil, allMapMarkers, _allMarkers, "mrk_rect_1", false] spawn BIS_fnc_animatedBriefing;

//disable textures
//ctrlActivate ( ( findDisplay 12 ) displayCtrl 107 );

sleep 2;

//Wait until timeline is over
waitUntil{!(missionNamespace getVariable ["BIS_fnc_eventTimeline_playing", true]);};