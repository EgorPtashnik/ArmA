[pl2,0] call BIS_fnc_holdActionRemove;
[pl3,0] call BIS_fnc_holdActionRemove;
pl2 removeAllEventHandlers "Killed";
pl3 removeAllEventHandlers "Killed";
pl4 removeAllEventHandlers "Killed";
["endfail2", false, 2] call BIS_fnc_endMission;