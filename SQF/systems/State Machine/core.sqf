// --- Create SM instance
SM_fnc_create = {
	private _sm = createHashMap;
	_sm set ["states", []];
	_sm set ["current", ""];
	_sm set ["running", false];
	_sm
};

// --- Start the state machine
SM_fnc_start = {
    params ["_sm", "_initial"];

    [_sm, _initial] call SM_fnc_setState;
    _sm set ["running", true];

    [_sm] spawn {
        params ["_sm"];
        while { _sm get "running" } do {
            [_sm] call SM_fnc_update;
            sleep 1;
        };
    };
};

// --- Add new state to SM
SM_fnc_addState = {
    params ["_sm", "_name", "_onEnter", "_transitions"];
    private _states = _sm get "states";
    _states pushBack [_name, _onEnter, _transitions];
    _sm set ["states", _states];
};

// --- Find a state definition by name
SM_fnc_getState = {
    params ["_sm", "_name"];
    private _states = _sm get "states";
    private _found = (_states select { _x select 0 == _name } ) select 0;
    if (_found isEqualTo []) exitWith { objNull };
    _found;
};

// --- Switch to a new state
SM_fnc_setState = {
    params ["_sm", "_newStateName"];

    private _stateDef = [_sm, _newStateName] call SM_fnc_getState;

    _sm set ["current", _newStateName];

    private _onEnter = _stateDef select 1;
    call _onEnter;
};

// --- Update loop (checks only transitions)
SM_fnc_update = {
    params ["_sm"];

    private _current = _sm get "current";
    if (_current isEqualTo "") exitWith {};

    private _stateDef = [_sm, _current] call SM_fnc_getState;

    private _transitions = _stateDef select 2;

    {
        private _cond = _x select 0;
        private _next = _x select 1;
        if (call _cond) exitWith {
            [_sm, _next] call SM_fnc_setState;
        };
    } forEach _transitions;
};
