player switchCamera "EXTERNAL";

// Import
fnc_subtitles = compile preprocessFileLineNumbers "function\dialog\YP_fnc_showSubtitlesCOD.sqf";
fnc_comms = compile preprocessFileLineNumbers "function\dialog\YP_fnc_communications.sqf";

// Init briefing
#include "initBriefing.sqf";
#include "intro.sqf";
#include "initTasks.sqf";
