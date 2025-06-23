// IMPORT
// pf_comms = compile preprocessFileLineNumbers "fnc\YP_handleComms.sqf";
// CALL
// [""] spawn pf_comms;

params ["_comm"];
private _handle = objNull;

switch(_comm) do {
	case "firstCarDestroyed": {
		_handle = [
			"Альфа",
			"Говорит Альфа! Первый заправщик уничтожен."
		] spawn pf_subs;
		waitUntil { sleep 1; scriptDone _handle; };
	};
	case "secondCarDestroyed": {
		_handle = [
			"Альфа",
			"Говорит Альфа! Вторая машина горит. Продолжаю выполнение, ищу последнее авто."
		] spawn pf_subs;
		waitUntil { sleep 1; scriptDone _handle; };
	};
	case "thirdCarDestroyed": {
		_handle = [
			"Альфа",
			"Приём, как слышно? Последний грузовик снабжения сбит. Повторяю! Все заправщики уничтожены. Жду указаний. Приём."
		] spawn pf_subs;
		waitUntil { sleep 1; scriptDone _handle; };
	};
};
