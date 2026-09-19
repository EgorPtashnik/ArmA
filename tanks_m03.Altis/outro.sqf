#include "\a3\Missions_F_Tacops\Functions\fn_TO_AnimatedOpening.inc"
#include "\a3\Missions_F_Tank\AnimatedOpenings.inc"
#include "T03_Outro.sqf";

_d = [_timeline2,0,"AmbientTrack02_F_EXP"] spawn BIS_fnc_animatedOpening;

//wait until timeline is over
waitUntil {!(missionNamespace getVariable ["BIS_fnc_eventTimeline_playing",true]);};

//end the Outro, end the Campaign
endMission "END1";
