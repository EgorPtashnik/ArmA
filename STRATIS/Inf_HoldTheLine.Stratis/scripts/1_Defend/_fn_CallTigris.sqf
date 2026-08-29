private _target = cursorTarget;
private _gunner = gunner O_Tigris;
private _handle = nil;

player setVariable ["TigrisSupportActive", false];

// Comms start
_handle = "CallTigris" call EP_fnc_missionConversations;
waitUntil {sleep 1; scriptDone _handle };
// Comms end

_gunner enableAI "ALL";
O_GrpTigris reveal [_target, 4];
O_Tigris doWatch _target;
private _timeout = (time + 60);

sleep 3;

while { sleep 1; true } do {
    if (!alive _gunner) exitWith {};
    
    // Target KIA
    if (!alive _target) exitWith {
        "CallTigris_Done" call EP_fnc_missionConversations;
        sleep 1;
    };

    // Failed
    if (time > _timeout) exitWith {
        "CallTigris_Failed" call EP_fnc_missionConversations;
    };

    // Fire until exit
    [O_Tigris, currentWeapon O_Tigris] call BIS_fnc_fire;
};

if (alive _gunner) then {
    player setVariable ["TigrisSupportActive", true];
    _gunner disableAI "ALL";
};
