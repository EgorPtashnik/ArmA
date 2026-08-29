// Execute code after 45 minutes
["task_faildistract","FAILED"] call BIS_fnc_taskSetState;
mekes commandchat "Basilisk! You weren't able to shake their attention from the airport!";
sleep 5;
mekes commandchat "They're starting their attack on the airport now! WE-- ~~zzztt~~";
["endfail1", false, 8] call BIS_fnc_endMission;
sleep 5;
pl1 sidechat "Damn it. We were too slow....";