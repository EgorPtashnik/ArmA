// PLAYER NEAR APC => START ENEMY WAVE
waitUntil { sleep 1; player distance apc < 20; };
[ "Защитник",
  "Внимание всем! Продвигаться вглубь города! Конец связи.",
  0,
  "in3",
  false,
  true,
  "in4"
] spawn fnc_subtitles;
{ _x enableSimulation true; _x hideObject false; _x setUnitPos "UP"; } forEach units group_enemy_1;
[group_enemy_1, getPos apc, 0, "MOVE", "AWARE", "RED", "FULL", "LINE"] call CBA_fnc_addWaypoint;
private _leader = leader group_friend_1;
group_friend_1 setBehaviour "COMBAT";
_leader enableAI "PATH";
[_leader, [[3560.92,3282.2,0]], {}, "AmovPercMrunSrasWrflDf"] call BIS_fnc_scriptedMove;
_leader setUnitPos "MIDDLE";
_leader lookAt [3682.74,3256.93,0];
_leader disableAI "PATH";

sleep 30;

// START ADVANCING
{ _x allowDamage true; _x enableAI "PATH"; _x setUnitPos "UP"; } forEach units group_friend_1;
[group_friend_1,getPosATL pos_1, 0, "MOVE", "COMBAT", "RED", "FULL", "LINE"] call CBA_fnc_addWaypoint;

// FRIEND IS KILLED => MOVE APC
sleep 30;
execVM "apc\move_1.sqf";

// PLAYER REACHES FIRST DESTINATION
waitUntil { sleep 1; (player distance getPosATL pos_1) < 10; };
{ _x setDamage 1; } forEach units group_enemy_1;
savegame;
sleep 1;
{_x enableSimulation true; _x hideObject false; _x setUnitPos "UP"; } forEach units group_friend_2;
[group_friend_2,getPosATL pos_2, 0, "MOVE", "AWARE", "YELLOW", "FULL", "LINE"] call CBA_fnc_addWaypoint;
{ _x enableSimulation true; _x hideObject false; _x setUnitPos "UP"; } forEach units group_friend_3;
[group_friend_3,getPosATL pos_2, 0, "MOVE", "AWARE", "YELLOW", "FULL", "LINE"] call CBA_fnc_addWaypoint;
[group_friend_1,getPosATL pos_2, 0, "MOVE", "COMBAT", "RED", "FULL", "LINE"] call CBA_fnc_addWaypoint;
{ _x enableSimulation true; _x hideObject false; _x setUnitPos "UP"; } forEach units group_enemy_2;
[group_enemy_2,[3747.4,3170.49,0], 0, "SAD", "AWARE", "YELLOW", "FULL", "LINE"] call CBA_fnc_addWaypoint;
{ _x enableSimulation true; _x hideObject false; _x setUnitPos "UP";} forEach units group_enemy_3;
[group_enemy_3,[3747.4,3170.49,0], 0, "SAD", "AWARE", "YELLOW", "FULL", "LINE"] call CBA_fnc_addWaypoint;

sleep 40;
execVM "apc\move_2.sqf";

sleep 90;
apc allowDamage true;
apcC allowDamage true;
apcD allowDamage true;
apcG allowDamage true;
apc setDamage 1;

{ _x enableSimulation true; _x hideObject false; _x setUnitPos "UP";} forEach units group_enemy_4;
[group_enemy_4,[3746.47,3108.73,0], 0, "SAD", "AWARE", "YELLOW", "FULL", "LINE"] call CBA_fnc_addWaypoint;
{ _x enableSimulation true; _x hideObject false; _x setUnitPos "UP";} forEach units group_friend_4;
[group_friend_4,getPosATL pos_2, 0, "MOVE", "AWARE", "YELLOW", "FULL", "LINE"] call CBA_fnc_addWaypoint;
{ _x enableSimulation true; _x hideObject false; _x setUnitPos "UP";} forEach units group_friend_5;
[group_friend_5,getPosATL pos_2, 0, "SAD", "AWARE", "YELLOW", "FULL", "LINE"] call CBA_fnc_addWaypoint;

waitUntil {
	sleep 1;
	opfor countSide allUnits < 4;
};
["task_id", "SUCCEEDED"] call BIS_fnc_taskSetState;
[ "Защитник",
  "Говорит Защитник. Город наш! Повторяю. Город взят! Конец связи.",
  1,
  "in3",
  false,
  true,
  "in4"
] spawn fnc_subtitles;
sleep 10;
["end1"] call BIS_fnc_endMission;
