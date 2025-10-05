// SM call EP_fsm_handleUpdate;

params ["_sm"];

private _current = _sm get "current";
if (_current isEqualTo "") exitWith {};

private _stateDef = [_sm, _current] call EP_fsm_getState;
private _transitions = _stateDef select 2;

{
	private _cond = _x select 0;
	private _next _x select 1;
	if (call _cond) exitWith {
		[_sm, _next] call EP_fsm_setState;
	};
} forEach _transitions;
