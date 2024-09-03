[compile preprocessFileLineNumbers "createDiary.sqf"] call CBA_fnc_directCall;
execVM "baseAmbience.sqf";

fnc_showSubtitles = compile preprocessFileLineNumbers "function\YP_fnc_showSubtitlesCOD.sqf";
