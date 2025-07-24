/*
    This is an example for a script that uses the CBA state machine system.
    In this case, we're "sharpening the senses" of AI units that got attacked before.
    Once they had contact, they stay alert.

    This would simulate units that did not expect an attack, but are now aware that
    they might come under fire again.

    You can test this example by executing the following code in the debug console:
    [] call compile preprocessFileLineNumbers "\x\cba\addons\statemachine\example.sqf"
*/

private _stateMachine = [{allGroups select {!isPlayer leader _x}}, true] call CBA_statemachine_fnc_create;

[_stateMachine, {}, {}, {}, "Initial"] call CBA_statemachine_fnc_addState;
[_stateMachine, {}, {}, {}, "Alert"] call CBA_statemachine_fnc_addState;

[_stateMachine, "Initial", "Alert", {combatMode _this == "YELLOW"}, {
    // Set skill once on transition
    // This could also be done in the onStateEntered function
    {
        _x setSkill ["spotDistance", ((_x skill "spotDistance") * 1.5) min 1];
        _x setSkill ["spotTime",     ((_x skill "spotTime")     * 1.5) min 1];
    } forEach (units _this);
}, "InCombat"] call CBA_statemachine_fnc_addTransition;

[_stateMachine, "Initial", "Alert", ["MyAddon_AlarmRaised"], {true}, {
    {
        _x setSkill ["spotDistance", ((_x skill "spotDistance") * 1.5) min 1];
        _x setSkill ["spotTime",     ((_x skill "spotTime")     * 1.5) min 1];
    } forEach (units _this);
}, "Alarm"] call CBA_statemachine_fnc_addEventTransition;

// This makes sure you can execute this through the debug console
_stateMachine spawn {
    sleep 0.1;
    private _output = [_this, true, true] call CBA_statemachine_fnc_toString;
    copyToClipboard _output;
    hintC _output;
};


/**
	METHODS
================================================ CREATE STATE MACHICE

	CBA_statemachine_fnc_create
		_list	list of anything over which the state machine will run (type needs to support setVariable) ARRAY OR code that will generate this list, called once the list has been cycled through <CODE>
		_skipNull	skip list items that are null
			Returns
				_stateMachine	a state machine <LOCATION>

	_stateMachine = call CBA_statemachine_fnc_create;
	_stateMachine = [{allGroups select {!isPlayer leader _x}}, true] call CBA_statemachine_fnc_create;

================================================ ADD STATE

	CBA_statemachine_fnc_addState
		_stateMachine	a state machine <LOCATION>
		_onState	code that is executed when state is active (frequency depends on amount of objects active in state machine) <CODE> (Default: {})
		_onStateEntered	code that is executed once when state was entered, after onTransition (also once for the intial state) <CODE> (Default: {})
		_onStateLeaving	code that is executed once when exiting state, before onTransition <CODE> (Default: {})
		_name	unique state name STRING (Default: “stateX” with X being a unique number)
			Returns
				_name	unique state name or empty string on error STRING

	_name = [_stateMachine, {}] call CBA_statemachine_fnc_addState;
	[_stateMachine, {}, {}, {}, "Initial"] call CBA_statemachine_fnc_addState;

================================================ ADD TRANSITION

	CBA_statemachine_fnc_addTransition
		_stateMachine	a state machine <LOCATION>
		_originalState	state the transition origins from STRING
		_targetState	state the transition goes to STRING
		_condition	condition under which the transition will happen <CODE>
		_onTransition	code that gets executed once transition happens <CODE> (Default: {})
		_name	name for this specific transition STRING (Default: “NONAME”)
			Returns
				_wasCreated	check if the transition was created <BOOL>

	[	_stateMachine, "initial", "end",
		{true},
		{
    		systemChat format ["%1 transitioned from %2 to %3 via %4.",_this, _thisOrigin, _thisTarget, _thisTransition];
		},
		"dummyTransition"
	] call CBA_statemachine_fnc_addTransition;

================================================ ADD EVENT TRANSITION

	CBA_statemachine_fnc_addEventTransition
		_stateMachine	a state machine <LOCATION>
		_originalState	state the transition origins from STRING
		_targetState	state the transition goes to STRING
		_events	list of events that can trigger the transition ARRAY
		_condition	additional condition required for the transition to trigger <CODE>
		_onTransition	code that gets executed once transition happens <CODE> (Default: {})
		_name	name for this specific transition STRING (Default: “NONAME”)
			Returns
				_wasCreated	check if the transition was created <BOOL>

	[	_stateMachine, "initial", "end", ["end_statemachine"],
		{true},
		{
			systemChat format ["%1 transitioned from %2 to %3 via %4.",_this, _thisOrigin, _thisTarget, _thisTransition];
		},
		"dummyTransition"
	] call CBA_statemachine_fnc_addEventTransition;

================================================ DELETE STATE MACHINE

	CBA_statemachine_fnc_delete

	[_stateMachine] call CBA_statemachine_fnc_delete;

================================================ GET CURRENT STATE

	CBA_statemachine_fnc_getCurrentState
	
	_currentState = [player, _stateMachine] call CBA_statemachine_fnc_getCurrentState;

================================================
 */