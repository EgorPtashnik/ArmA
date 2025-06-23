/**
	Init tasks and triggers
 */

waitUntil {
	sleep 1;
	f_introDone;
};

[
	player,
	"task_locate",
	["Обнаружить технику противника и доложить", "Обнаружить технику"],
	[7100.8,5993.78,0],
	true,
	-1,
	true,
	"search"
] call BIS_fnc_taskCreate;

// Initialize tasks after knowsAbout > 3;
[] spawn {
	waitUntil {
		sleep 1;
		{player knowsAbout _x >= 3} count [bmp_1, bmp_2, tank, car_1, car_2, car_3, car_4] > 0;
	};
	["task_locate", "SUCCEEDED"] call BIS_fnc_taskSetState;
	private _handle = ["located"] call fnc_comms;
	waitUntil {
		sleep 1;
		scriptDone _handle;
	};
	[
		player,
		"task_destroy",
		["", "Уничтожить технику"],
		objNull,
		true,
		-1,
		true,
		"destroy"
	] call BIS_fnc_taskCreate;
};

[] spawn {
	waitUntil {
		sleep 1;
		["task_destroy"] call BIS_fnc_taskExists && player knowsAbout bmp_1 > 3;
	};
	if (!(["task_destroy"] call BIS_fnc_taskCompleted)) then {
		[
			player,
			["task_destroy_bmp_1", "task_destroy"],
			["Уничтожить БМП-2", "БМП"],
			position bmp_1,
			"CREATED",
			-1,
			true,
			"mine"
		] call BIS_fnc_taskCreate;
	};
};

[] spawn {
	waitUntil {
		sleep 1;
		["task_destroy"] call BIS_fnc_taskExists && player knowsAbout bmp_2 > 3;
	};
	if (!(["task_destroy"] call BIS_fnc_taskCompleted)) then {
		[
			player,
			["task_destroy_bmp_2", "task_destroy"],
			["Уничтожить БМП-2", "БМП"],
			position bmp_2,
			"CREATED",
			-1,
			true,
			"mine"
		] call BIS_fnc_taskCreate;
	};
};

[] spawn {
	waitUntil {
		sleep 1;
		["task_destroy"] call BIS_fnc_taskExists && player knowsAbout tank > 3;
	};
	if (!(["task_destroy"] call BIS_fnc_taskCompleted)) then {
		[
			player,
			["task_destroy_tank", "task_destroy"],
			["Уничтожить Т-72", "Т-72"],
			position tank,
			"CREATED",
			-1,
			true,
			"mine"
		] call BIS_fnc_taskCreate;
	};
};

[] spawn {
	waitUntil {
		sleep 1;
		["task_destroy"] call BIS_fnc_taskExists && player knowsAbout car_1 > 3;
	};
	if (!(["task_destroy"] call BIS_fnc_taskCompleted)) then {
		[
			player,
			["task_destroy_car_1", "task_destroy"],
			["Уничтожить Урал (Аммуниция)", "Урал (Аммуниция)"],
			position car_1,
			"CREATED",
			-1,
			true,
			"mine"
		] call BIS_fnc_taskCreate;
	};
};

[] spawn {
	waitUntil {
		sleep 1;
		["task_destroy"] call BIS_fnc_taskExists && player knowsAbout car_2 > 3;
	};
	if (!(["task_destroy"] call BIS_fnc_taskCompleted)) then {
		[
			player,
			["task_destroy_car_2", "task_destroy"],
			["Уничтожить Урал (Заправщик)", "Урал (Заправщик)"],
			position car_2,
			"CREATED",
			-1,
			true,
			"mine"
		] call BIS_fnc_taskCreate;
	};
};

[] spawn {
	waitUntil {
		sleep 1;
		["task_destroy"] call BIS_fnc_taskExists && player knowsAbout car_3 > 3;
	};
	if (!(["task_destroy"] call BIS_fnc_taskCompleted)) then {
		[
			player,
			["task_destroy_car_3", "task_destroy"],
			["Уничтожить Урал (Заправщик)", "Урал (Заправщик)"],
			position car_3,
			"CREATED",
			-1,
			true,
			"mine"
		] call BIS_fnc_taskCreate;
	};
};

[] spawn {
	waitUntil {
		sleep 1;
		["task_destroy"] call BIS_fnc_taskExists && player knowsAbout car_4 > 3;
	};
	if (!(["task_destroy"] call BIS_fnc_taskCompleted)) then {
		[
			player,
			["task_destroy_car_4", "task_destroy"],
			["Уничтожить Урал (Ремонтный)", "Урал (Ремонтный)"],
			position car_4,
			"CREATED",
			-1,
			true,
			"mine"
		] call BIS_fnc_taskCreate;
	};
};
