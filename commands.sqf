// IF			condition must return bool
if (condition) then {

} else {

};

// EXIT WITH	condition must return bool
if (condition) exitWith {};

// WHILE		condition must return bool
while {condition} do {

};

// SWITCH
switch(variable) do {
	case "": {

	};
	default {

	};
};

// FOR
for "_i" from 1 to 3 do {

};

// FOR EACH
{ _x } forEach array;

// COUNT
{ alive _x } count array;

// ARRAYS
{ _x } forEach units group1 + units group2;

// CREATE TRIGGER
//trigger area cleared
_trg = createTrigger ["EmptyDetector", [7639,6221]];
_trg setTriggerArea [100, 100, 0, false];
_trg setTriggerActivation ["EAST", "NOT PRESENT", false];
_trg setTriggerStatements ["this", "BIS_SuppliSeize = true", ""];
_trg setTriggerTimeout [5, 10, 7, false];


// EXECUTE UNSCHEDULED
[code, arguments] call CBA_fnc_directCall;

// EXECUTE UNSSCHEDULED AFTER DELAY
[code, [arg1, arg2], delay] call CBA_fnc_waitAndExecute;

// EXECUTE UNSCHEDULED AFTER CONDITION
[condition, statement, [argForBoth], timeOut, codeIfTimeOut] call CBA_fnc_waitUntilAndExecute;

