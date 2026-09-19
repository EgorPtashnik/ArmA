#include "\a3\Missions_F_Tacops\Functions\fn_TO_AnimatedOpening.inc"
#include "\a3\Missions_F_Tank\AnimatedOpenings.inc"
#include "T02_Intro.sqf";

_d = [_timeline,0,"LeadTrack03_F_EPC"] spawn BIS_fnc_animatedOpening; // AmbientTrack01_F_Orange, LeadTrack03_F_EPB, LeadTrack03_F_EPC

//wait until timeline is over
waitUntil {!(missionNamespace getVariable ["BIS_fnc_eventTimeline_playing",true]);};

//end Intro and start mission
endMission "END1";
