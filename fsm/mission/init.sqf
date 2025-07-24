private _stateMachine = ["init"] call fn_fsmCreate;

#include "states\beach.sqf";
#include "states\beachCeased.sqf";

// FSM Loop
[_stateMachine] spawn {
	params ["_machine"];
	while { missionNamespace getVariable ["missionFsmRunning", true] } do {
		[_machine, []] call fn_fsmUpdateStateMachine;
		sleep 1;
	};
};