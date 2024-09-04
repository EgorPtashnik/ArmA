execVM "createDiary.sqf";

fnc_showSubtitles = compile preprocessFileLineNumbers "function\YP_fnc_showSubtitlesCOD.sqf";

// hide markers

["marker_enemy_zone",0] spawn BIS_fnc_hideMarker;
["marker_enemy_group",0] spawn BIS_fnc_hideMarker;
["marker_attack_group",0] spawn BIS_fnc_hideMarker;
["marker_attack_arrow_1",0] spawn BIS_fnc_hideMarker;
["marker_attack_arrow_2",0] spawn BIS_fnc_hideMarker;
["marker_sniper_pos",0] spawn BIS_fnc_hideMarker;

execVM "flow_intro\start.sqf";
