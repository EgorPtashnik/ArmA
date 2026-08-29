execVM "scripts_d\t_end.sqf";

sleep 5;
["endwin1", true, 8] call BIS_fnc_endMission;
["task_exfiltrate","SUCCEEDED"] call BIS_fnc_taskSetState;

activateKey "AX_DevilsOffensive";