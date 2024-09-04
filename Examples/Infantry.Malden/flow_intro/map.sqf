forceMap true;

/*
    marker_enemy_group
    marker_enemy_zone
    marker_attack_arrow_1
    marker_attack_arrow_2
    marker_attack_group
    marker_sniper_pop

    Отдалить карту
    Показать маркер позиции противника на НП marker_enemy_pos
    Показать и помигать маркером marker_attack_group внутри позиции противника
    Показать маркер marker_attack_group
    Передвинуть маркер ближе (справа налево) marker_attack_group
    Показать и помигать стрелками marker_attack_arrow_1 & marker_attack_arrow_2
    Показать маркер снайпера marker_sniper_pos
    Удалить маркер группы врага marker_enemy_group
    Поменять цвет маркера marker_enemy_pos на красный
 */

mapAnimAdd [1, 0.5, getMarkerPos "marker_enemy_pos"];
mapAnimCommit;

["Командир", "Итак, начнем инструктаж.", 2, false, "beep"] call fnc_showSubtitles;

sleep 1;
["marker_enemy_zone", 2] spawn BIS_fnc_showMarker;
["Командир", "Силы противника оккупировали этот населенный пункт.", 2, false, "beep"] call fnc_showSubtitles;
sleep 2;
["marker_enemy_group", 2] spawn BIS_fnc_showMarker;
["Командир", "Разведданные говорят, что силы небольшие. Отряд пехоты и бронемашина. Однако нужно быть начеку.", 2, false, "beep"] call fnc_showSubtitles;
sleep 5;
["marker_attack_group", 2] spawn BIS_fnc_showMarker;
sleep 2;
["marker_attack_group",/*NEW POSITIOn*/, 2] call BIS_fnc_moveMarker;
["Командир", "Группа захвата займет позицию на востоке и будет готова начать штурм.", 2, false, "beep"] call fnc_showSubtitles;
sleep 2;
["marker_attack_arrow_1", 1] spawn BIS_fnc_showMarker;
["marker_attack_arrow_2", 1] spawn BIS_fnc_showMarker;
sleep 1;
["marker_attack_arrow_1", 3, 5] spawn BIS_fnc_blinkMarker;
["marker_attack_arrow_2", 3, 5] spawn BIS_fnc_blinkMarker;
sleep 3;
["marker_sniper_pos", 2] spawn BIS_fnc_showMarker;
["Командир", "Для поддержки - с юга будет предоставлен снайпер.", 2, false, "beep"] call fnc_showSubtitles;
sleep 2;
["Командир", "Он точнее разведает ситуацию и даст сигнал основой группе начинать атаку. Без сигнала не наступать!", 2, false, "beep"] call fnc_showSubtitles;
sleep 2;
private _attackGroupPosition = getMarkerPos "marker_attack_group";
["marker_enemy_group", 2] spawn BIS_fnc_hideMarker;
["marker_enemy_zone", color , 2] spawn BIS_fnc_colorMarker;
["marker_attack_group", getMarkerPos "marker_enemy_group", 2] call BIS_fnc_moveMarker;

["Командир", "Для поддержки - с юга будет предоставлен снайпер.", 2, false, "beep"] call fnc_showSubtitles;





sleep 2;

forceMap false;

// поменять цвета маркеров обратно

player setVariable ["taskDone", true];
