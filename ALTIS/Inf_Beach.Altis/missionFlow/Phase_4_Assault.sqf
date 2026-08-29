"O_MrkAlpha" setMarkerAlpha 1;
"O_MrkBravo" setMarkerAlpha 1;
["ZoneAO_2"] call LXWS_fnc_CoverMap;


private _handle = "C5" call EP_fnc_missionConversations;

waitUntil { scriptDone _handle };
// Одна группа идет к точке Альфа
[B_InfHeli_3, "O_MrkAlpha"] call EP_fnc_addWaypoint;

// Остальные к браво
{ [B_InfHeli_1, _x] call EP_fnc_addWaypoint } forEach ["B_WpInfHeli_1_1", "O_MrkBravo"];
{ [B_InfHeli_2, _x] call EP_fnc_addWaypoint } forEach ["B_WpInfHeli_2_1", "O_WpInfHeli_2_2", "O_MrkBravo"];
B_Inf call EP_fnc_clearWaypoints;
[B_Inf, "O_MrkBravo", "AWARE"] call EP_fnc_addWaypoint;


//********************************************************************
// Точка Альфа
//********************************************************************
private _alphaClasses = [ "Atlas_O_Soldier_R_TL_F",  "Atlas_O_Soldier_R_GL_F", "Atlas_O_Soldier_R_M_F", "Atlas_O_Soldier_R_AR_F"];
private _alphaGrp = ["O_MrkAlpha", opfor, _alphaClasses] call EP_fnc_createGroup;
[_alphaGrp, _alphaGrp, "GUARD"] call EP_fnc_addWaypoint;
// Триггер
_alphaGrp spawn {
    waitUntil {sleep 1;  ((units _this) findIf { alive _x }) == -1 };
        "C6" call EP_fnc_missionConversations;
        "O_MrkAlpha" setMarkerColor "ColorWEST";
};

//********************************************************************
// Точка Браво
//********************************************************************
["Точка Браво", true] call EP_fnc_showObjects;
[O_BravoGuards, O_BravoGuards, 200] call EP_fnc_taskDefend;
[(units O_BravoStatic), "UP", ["PATH", false]] call EP_fnc_setAIMode;

private _bravoGroups = [O_BravoGuards, O_BravoPatrol, O_BravoStatic];
private _bravoUnits = _bravoGroups call EP_fnc_collectUnits;
private _bravoThreshold = (count _bravoUnits) * 0.1;
private _bluforUnits = [B_InfHeli_1, B_InfHeli_2, B_Inf] call EP_fnc_collectUnits;
private _bluforThreshold = 10;

// Триггер боя
_bravoGroups spawn {
    waitUntil { sleep 1; _this findIf { (combatBehaviour _x) == "COMBAT" } != -1 };
    playMusic "LeadTrack01_F";
    {
        private _leader = leader _x;
        private _pos = _leader call EP_fnc_getPosition;
        private _blufor = (_leader nearEntities ["Man", 1000]) select { side _x == blufor };
        
        if (({ alive _x } count _blufor) > 0) then {
            private _nearestEnemy = ([_blufor, [_leader], { _input0 distance2D _x }, "ASCEND", { alive _x }] call BIS_fnc_sortBy) # 0;
            _pos = _nearestEnemy call EP_fnc_getPosition;
        };

        [_x, _pos] call EP_fnc_taskAttack;
    } forEach (_this - [O_BravoStatic]);
};

"t3" call EP_fnc_missionTasks;
sleep 5;
savegame;
playMusic "QGTrack7";

while { sleep 1; true } do {
    // Потери BLUFOR
    if (({ alive _x } count _bluforUnits) < _bluforThreshold) exitWith {
        sleep 10;
    	["Fail", false] call BIS_fnc_endMission;
    };

    // Потери OPFOR
    if (({ alive _x } count _bravoUnits) < _bravoThreshold) exitWith {
        ["t3", true] call EP_fnc_missionTasks;
        {
            _x setCaptive true;
            [_x, "CARELESS", "BLUE"] call EP_fnc_setAIMode;
            _x playActionNow "Surrender";
        } forEach (_bravoUnits select { alive _x });

        _handle = "C7" call EP_fnc_missionConversations;
        waitUntil { scriptDone _handle };

        sleep 10;

        "Win" call BIS_fnc_endMission;
    };
};
