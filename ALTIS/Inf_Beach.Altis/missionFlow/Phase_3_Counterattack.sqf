// Создаем ОБР
private _qrf = call compileScript ["scripts\SpawnQRF.sqf", true];
private _timeout = (time + 600);
"t2" call EP_fnc_missionTasks;


sleep 10;
savegame;

// ОБР убиты или таймаут
waitUntil {sleep 1; ((units _qrf) findIf {alive _x}) == -1 || time > _timeout };
    // Отправляем вертолеты
    ["Вертолеты с пехотой", true] call EP_fnc_showObjects;
    [B_Heli_1, Helipad_1, "CARELESS", [ { true }, { B_Heli_1 landAt [Helipad_1, "GetOut"] } ]] call EP_fnc_addWaypoint;
    [B_Heli_1, Helipad_1, "TR UNLOAD"] call EP_fnc_addWaypoint;
    [B_Heli_1, B_Heli_1, [{ true }, { [this, 50] call EP_fnc_cleanupArea }]] call EP_fnc_addWaypoint;

    [B_Heli_2, Helipad_2, "CARELESS", [ { true }, { B_Heli_2 landAt [Helipad_2, "GetOut"] } ]] call EP_fnc_addWaypoint;
    [B_Heli_2, Helipad_2, "TR UNLOAD"] call EP_fnc_addWaypoint;
    [B_Heli_2, B_Heli_2, [{ true }, { [this, 50] call EP_fnc_cleanupArea }]] call EP_fnc_addWaypoint;

    [B_Heli_3, Helipad_3, "CARELESS", [ { true }, { B_Heli_3 landAt [Helipad_3, "GetOut"] } ]] call EP_fnc_addWaypoint;
    [B_Heli_3, Helipad_3, "TR UNLOAD"] call EP_fnc_addWaypoint;
    [B_Heli_3, B_Heli_3, [{ true }, { [this, 50] call EP_fnc_cleanupArea }]] call EP_fnc_addWaypoint;

    private _heliInfUnits = [B_InfHeli_1, B_InfHeli_2, B_InfHeli_3] call EP_fnc_collectUnits;

    sleep 10;
    "C4" call EP_fnc_missionConversations;

// Вертолеты высадили пехоту
waitUntil {sleep 1; (_heliInfUnits findIf { vehicle _x != _x }) == -1 };
["t2", true] call EP_fnc_missionTasks;

// След фаза
execVM "missionFlow\Phase_4_Assault.sqf";
