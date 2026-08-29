spawnhelimark = getMarkerPos "marker_5";
spawnhelimark set [2,50];

_usmchelisp1 = [spawnhelimark, 0, "EF_B_AH99J_MJTF_Des", west] call BIS_fnc_spawnVehicle;


private _heli = _usmchelisp1 select 0;
private _group = group _heli;

// Random position within 100–200m of player
private _offset = [random 200 - 100, random 200 - 100]; // -100 to +100 on X and Y
private _targetPos = player getPos [_offset select 0, 0] vectorAdd [0, _offset select 1, 0];

// Create waypoint
private _wp = _group addWaypoint [_targetPos, 0];
_wp setWaypointType "MOVE";

private _wp = _group addWaypoint [_targetPos, 0];
_wp setWaypointType "MOVE";

private _wp = _group addWaypoint [_targetPos, 0];
_wp setWaypointType "LOITER";
_wp setWaypointLoiterType "CIRCLE";
_wp setWaypointLoiterRadius 150;

_heli setSkill ["aimingAccuracy", 0];
_heli setSkill ["aimingShake", 0];
_heli setSkill ["reloadSpeed", 0];
_heli flyInHeight 50;
_heli setCombatMode "GREEN";