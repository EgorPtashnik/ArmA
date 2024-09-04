forceMap true;

mapAnimAdd [1, 0.05, getMarkerPos "marker_enemy_zone"];
mapAnimCommit;

["Командир", "Итак, начнем инструктаж.", 2, "beep"] call fnc_showSubtitles;

sleep 5;
["marker_enemy_zone", 2, 1] spawn BIS_fnc_showMarker;
["Командир", "Силы противника оккупировали этот населенный пункт.", 2, "beep"] call fnc_showSubtitles;
sleep 5;
["marker_enemy_group", 2] spawn BIS_fnc_showMarker;
["Командир", "Разведданные говорят, что силы небольшие. Отряд пехоты и бронемашина. Однако нужно быть начеку.", 2, "beep"] call fnc_showSubtitles;
sleep 5;
["marker_attack_group", 2] spawn BIS_fnc_showMarker;
sleep 5;
["marker_attack_group", getMarkerPos "marker_attack_pos", 5] call BIS_fnc_moveMarker;
["Командир", "Группа захвата займет позицию на севере и будет готова начать штурм.", 2, "beep"] call fnc_showSubtitles;
sleep 5;
["marker_attack_arrow_1", 1] spawn BIS_fnc_showMarker;
["marker_attack_arrow_2", 1] spawn BIS_fnc_showMarker;
sleep 1;
["marker_attack_arrow_1", 3, 5] spawn BIS_fnc_blinkMarker;
["marker_attack_arrow_2", 3, 5] spawn BIS_fnc_blinkMarker;
sleep 3;
["marker_sniper_pos", 2] spawn BIS_fnc_showMarker;
["Командир", "Для поддержки - с востока будет предоставлен снайпер.", 2, "beep"] call fnc_showSubtitles;
sleep 5;
["Командир", "Он точнее разведает ситуацию и даст сигнал основой группе начинать атаку. Без сигнала не наступать!", 2, "beep"] call fnc_showSubtitles;
sleep 5;
private _attackGroupPosition = getMarkerPos "marker_attack_group";
["marker_enemy_group", 2] spawn BIS_fnc_hideMarker;
["marker_enemy_zone", "colorOPFOR" , 2] spawn BIS_fnc_colorMarker;
["marker_attack_group", getMarkerPos "marker_enemy_group", 5] call BIS_fnc_moveMarker;

["Командир", "Задача - совместными силами захватить НП", 2, "beep"] call fnc_showSubtitles;

sleep 10;

forceMap false;

"marker_attack_group" setMarkerPos _attackGroupPosition;
["marker_enemy_zone", "colorBLUFOR" , 0] spawn BIS_fnc_colorMarker;
["marker_enemy_group", 1] spawn BIS_fnc_showMarker;

player setVariable ["taskDone", true];
