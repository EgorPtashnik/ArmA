// init.sqf
#include "fsmCore.sqf";

// Create a new state machine
mySM = [] call SM_fnc_create;

// Define states
[mySM, "Intro", { hint "Mission starting..."; }, [
   	[ { time > 10 }, "Objective1" ]
]] call SM_fnc_addState;

[mySM, "Objective1", { hint "Secure the area!"; sleep 5; hint "sleep"; },
[
    [ { missionNamespace getVariable ["a1", false] }, "sec" ],
    [ { missionNamespace getVariable ["b1", false] }, "thir" ]
]] call SM_fnc_addState;

[mySM, "sec", { hint "sec"; },
[
    [ { false }, "Extraction" ]
]] call SM_fnc_addState;

[mySM, "thir", { hint "thir"; },
[
    [ { false }, "Extraction" ]
]] call SM_fnc_addState;

// // Start machine at "Intro"
[mySM, "Intro"] call SM_fnc_start;
