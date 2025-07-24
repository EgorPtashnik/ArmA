
// ["initState"] call fn_fsmCreate
fn_fsmCreate = {
    params ["_initialState"];
    
    private _machine = createHashMap;
    _machine set ["running", true];
    _machine set ["currentState", _initialState];
    _machine set ["transitions", []];
    _machine
};

// [_stateMachine, "fromState", "targetState", { condition }, { code to execute }] call fn_fsmCreate
fn_fsmAddTransition = {
    params ["_machine", "_fromState", "_toState", "_condition", "_action"];
    
    private _transitions = _machine get "transitions";
    _transitions pushBack [_fromState, _toState, _condition, _action];
};

// [_stateMachine, []] call fn_fsmUpdateStateMachine
fn_fsmUpdateStateMachine = {
    params ["_machine", "_args"];
    
    private _currentState = _machine get "currentState";
    private _transitions = _machine get "transitions";

    {
        _x params ["_fromState", "_toState", "_condition", "_action"];
        
        // Skip if not in the 'from' state
        if (_currentState != _fromState) then { continue };
        
        // Check transition condition (can be code or string)
        private _conditionMet = if (_condition isEqualType "") then {
            call compile _condition
        } else {
            _args call _condition
        };
        
        if (_conditionMet) then {
            // Execute transition action if provided
            if (!isNil "_action") then { _args call _action };
            
            // Change state
            _machine set ["currentState", _toState];
            
            // Break after first valid transition
            break;
        };
    } forEach _transitions;
};
