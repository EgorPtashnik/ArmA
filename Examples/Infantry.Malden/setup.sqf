[compile preprocessFileLineNumbers "createDiary.sqf"] call CBA_fnc_directCall;
execVM "baseAmbience.sqf";

fnc_showSubtitles = compile preprocessFileLineNumbers "function\YP_fnc_showSubtitlesCOD.sqf";

// hide markers
"marker_enemy_zone" setMarkerAlpha 0;
"marker_enemy_group" setMarkerAlpha 0;
"marker_attack_group" setMarkerAlpha 0;
"marker_attack_arrow_1" setMarkerAlpha 0;
"marker_attack_arrow_2" setMarkerAlpha 0;
"marker_sniper_pos" setMarkerAlpha 0;
