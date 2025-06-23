#include "\a3\Missions_F_Tacops\Functions\fn_TO_AnimatedOpening.inc"
#include "Outro\Outro_c02_m02.sqf";

enableSentences false;

private _codeInterrupt =
{
 	titleCut ["", "BLACK FADED", 10e10];
	[MODE_RESET,[true,true]] call bis_fnc_animatedScreen;
	[MODE_BLACKIN,0,false] call bis_fnc_animatedScreen;
	[MODE_DESTROY] call bis_fnc_animatedScreen;
};

[ _timeline, 0, "LeadTrack04_F_Tacops", _codeInterrupt, _codeInterrupt ] spawn BIS_fnc_eventTimeline;



