private _fadeHandle = [] execVM "flow_intro\fadeIn.sqf";
execVM "flow_intro\baseAmbience.sqf";

[
    base_commander,
    "Начать брифинг",
    "a3\ui_f_oldman\data\igui\cfg\holdactions\map_ca.paa",
    "a3\ui_f_oldman\data\igui\cfg\holdactions\map_ca.paa", 
    "_this distance _target < 3", "true", {}, {}, { execVM "flow_intro\map.sqf"}, {}, [], 1, 1, true] call BIS_fnc_holdActionAdd;

start_car setVehicleLock "LOCKED";
start_car move [10293.6,4092.1,0];
player setVariable ["taskDone", false];

sleep 10;

["Водитель", "Подъезжаем, товарищ Капитан.", 1, "beep"] call fnc_showSubtitles;

waitUntil {
    sleep 1;
    speed start_car <= 1;
};

doStop start_car;
sleep 2;
player moveOut start_car;
player action ["WeaponOnBack", player];
start_car engineOn false;

private _task = [
	player,
	"task_1", 
	["Выслушайте брифинг к предстоящей операции.","Брифинг"], 
	objNull,
	"ASSIGNED", 
	-1, 
	true, 
	"talk" 
] call BIS_fnc_taskCreate;
sleep 5;

hintC "Вы можете настроить свое снаряжение, используя ящик с аммуницией около коммандира базы.";

private _taskOpt = [
    player,
    "task_1_opt",
    ["Проверьте своё снаряжение.", "Снаряжение (Опционально)"],
    objNull,
    "CREATED",
    -1,
    true,
    "backpack"
] call BIS_fnc_taskCreate;

waitUntil {
    sleep 1;
    (player getVariable "taskDone");
};
[_task, "SUCCEEDED"] call BIS_fnc_taskSetState;
[_taskOpt, "SUCCEEDED", false] call BIS_fnc_taskSetState;
