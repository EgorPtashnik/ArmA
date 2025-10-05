// #include "initLibrary.sqf";
EP_fnc_addHoldAction = compile preprocessFileLineNumbers "lib\fn_addHoldAction.sqf";
EP_fnc_showSubs = compile preprocessFileLineNumbers "lib\fn_showSubs.sqf";
EP_fnc_conversation = compile preprocessFileLineNumbers "lib\fn_conversation.sqf";
EP_fnc_fadeIn = compile preprocessFileLineNumbers "lib\fn_fadeIn.sqf";
EP_fnc_fadeOut = compile preprocessFileLineNumbers "lib\fn_fadeOut.sqf";
EP_fnc_showHideUnits = compile preprocessFileLineNumbers "lib\fn_showHideUnits.sqf";

// Event Machine
EP_fsm_createStateMachine = compile preprocessFileLineNumbers "lib\StateMachine\fn_createStateMachine.sqf";
EP_fsm_addState = compile preprocessFileLineNumbers "lib\StateMachine\fn_addState.sqf";
EP_fsm_getState = compile preprocessFileLineNumbers "lib\StateMachine\fn_getState.sqf";
EP_fsm_handleUpdate = compile preprocessFileLineNumbers "lib\StateMachine\fn_handleUpdate.sqf";
EP_fsm_setState = compile preprocessFileLineNumbers "lib\StateMachine\fn_setState.sqf";
EP_fsm_startStateMachine = compile preprocessFileLineNumbers "lib\StateMachine\fn_startStateMachine.sqf";
