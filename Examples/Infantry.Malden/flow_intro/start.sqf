private _fadeHandle = execVM "flow_intro\fadeIn.sqf";
start_car setVehicleLock "LOCKED";
start_car move /* POSITION */;
player setVariable ["taskDone", false];

waitUntil {
    sleep 1;
    scriptDone _fadeHandle;
};

["Водитель", "Подъезжаем, товарищ Капитан.", 1, false, "beep"] call fnc_showSubtitles;

waitUntil {
    sleep 1;
    speed start_car <= 1;
};

doStop start_car;
player moveOut start_car;
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
