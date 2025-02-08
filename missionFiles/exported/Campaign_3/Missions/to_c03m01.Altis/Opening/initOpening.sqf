#include "\a3\Missions_F_Tacops\Functions\fn_TO_AnimatedOpening.inc"
#include "AnimOpening_c03_m01.sqf";

enableEnvironment false;

_d = [ _timeline, 0, "LeadTrack03_F_Tacops" ] spawn BIS_fnc_animatedOpening;

//wait until timeline is over
waitUntil{!(missionNamespace getVariable ["BIS_fnc_eventTimeline_playing", true]);};

//end Intro and start mission
endMission "END1";
