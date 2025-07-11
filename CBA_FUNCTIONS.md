// EXECUTE UNSCHEDULED
[code, arguments] call CBA_fnc_directCall;

// EXECUTE UNSSCHEDULED AFTER DELAY
[code, [arg1, arg2], delay] call CBA_fnc_waitAndExecute;

// EXECUTE UNSCHEDULED AFTER CONDITION
[condition, statement, [argForBoth], timeOut, codeIfTimeOut] call CBA_fnc_waitUntilAndExecute;

# MENU
1. [CBA_fnc_buildingPositions](#cba_fnc_buildingpositions)
1. [CBA_fnc_clearWaypoints](#cba_fnc_clearwaypoints)
1. [CBA_fnc_currentUnit](#cba_fnc_currentunit)
1. [CBA_fnc_deleteEntity](#cba_fnc_deleteentity)
1. [fnc_waypointGarrison](#fnc_waypointgarrison)
1. [CBA_fnc_nearPlayer](#cba_fnc_nearplayer)
1. [CBA_fnc_randPos](#cba_fnc_randpos)
1. [CBA_fnc_randPosArea](#cba_fnc_randposarea)
1. [CBA_fnc_searchNearby](#cba_fnc_searchnearby)
1. [CBA_fnc_switchPlayer](#cba_fnc_switchplayer)
1. [CBA_fnc_taskAttack](#cba_fnc_taskattack)
1. [CBA_fnc_taskDefend](#cba_fnc_taskdefend)
1. [CBA_fnc_taskPatrol](#cba_fnc_taskpatrol)
1. [CBA_fnc_taskSearchArea](#cba_fnc_tasksearcharea)
1. [CBA_fnc_addWaypoint](#cba_fnc_addwaypoint)

# CBA_fnc_buildingPositions
```
Description
Reports positions of the building including nearby custom building positions.

Parameters
0: _building	The building.  <OBJECT>
1: _max	Maximum number of positions.  (optional, default: all) <NUMBER>

Example
[_building, _maxNumberOfPositions] call CBA_fnc_buildingPositions

Returns
Available building positions including custom positions <ARRAY <PosAGL>>
```

# CBA_fnc_clearWaypoints
```
Description
A function used to correctly clear all waypoints from a group.

Parameters
Group (Group or Object)

Example
[group player] call CBA_fnc_clearWaypoints

Returns
None
```

# CBA_fnc_currentUnit
```
Description
Returns the controlled unit.  (“player” or remote controlled unit via zeus)

Parameters
None

Returns
Currently controlled unit <OBJECT>
```

# CBA_fnc_deleteEntity
```
Description
A function used to delete entities

Parameters
_entity to delete.  Can be array of entites.  <ARRAY, OBJECT, GROUP, LOCATION, MARKER>

Example
[car1,car2,car3] call CBA_fnc_deleteEntity

Returns
Nothing
```

# fnc_waypointGarrison
```
Description
Scripted waypoint that makes group garrision nearby buildings and static weapons.

Parameters
0: Group <GROUP> 1: Waypoint position ARRAY

Returns
true <BOOLEAN>

Examples
_group addWaypoint [_position, -1] setWaypointScript "\x\cba\addons\ai\fnc_waypointGarrison.sqf []";

[_group, _position] execVM "\x\cba\addons\ai\fnc_waypointGarrison.sqf";
```

# CBA_fnc_nearPlayer
```
Description
Check whether these are any players within a certain distance of a unit.

Parameters
_unit	the entity to check the distance from.  <OBJECT>
_distance	the desired distance.  <NUMBER>

Returns
true if there are any players within the given distance of the unit, false if there aren’t.  <BOOLEAN>

Examples
[unit, distance] call CBA_fnc_nearPlayer
```

# CBA_fnc_randPos
```
Description
A function used to randomize a position around a given center

Parameters
_position	<MARKER, OBJECT, LOCATION, GROUP, TASK or POSITION>
_radius	random Radius <NUMBER>
_direction	randomization direction (optional, default: 0) <NUMBER>
_angle	the angle of the circular arc in which the random position will end up.  (optional, default: 360) <NUMBER>

Example
_position =  [position, radius] call CBA_fnc_randPos

Returns
Position	[X,Y,Z]
```

# CBA_fnc_randPosArea
```
Description
Find a random (uniformly distributed) position within the given area without rejection sampling.

You can use CBA_fnc_randPos to find a position within a simple radius.

Parameters
_area	The area to find a position within <MARKER, TRIGGER, LOCATION, ARRAY>
_perimeter	True to return only positions on the area perimeter (optional, default: false) <BOOLEAN>

Returns
Position ARRAY (Empty array if invalid area was provided)

Examples
 _position = [marker, true] call CBA_fnc_randPosArea;

 _position = [trigger] call CBA_fnc_randPosArea;

_position = [location] call CBA_fnc_randPosArea;

_position = [[center, a, b, angle, isRectangle]] call CBA_fnc_randPosArea;
```

# CBA_fnc_searchNearby
```
Description
A function for a group to search a nearby building.

Parameters
Group (Group or Object)

Example
[group player] call CBA_fnc_searchNearby

Returns
Nil
```

# CBA_fnc_switchPlayer
```
Description
Switch player to another unit.

Parameters
[type] The type of the new unit the player should switch to [String]

Optional
[type, “LEAVEWEAPS”]	switch to new unit of the given type, but keep the weapons the player had before.
NOTE: the function must be spawned.  It cannot be called.

Returns
nil

Examples
// Change into a M136 AT rifleman
_h = ["USMC_Soldier_LAT"] spawn CBA_fnc_switchPlayer;

// Switch into a corpsman, but keep the weapons
```

# CBA_fnc_taskAttack
```
Description
A function for a group to attack a parsed location.

Parameters
Group (Group or Object)
Position (XYZ, Object, Location or Group)
Optional
Search Radius (Scalar)
Remove Assigned Waypoints (Bool)

Example
[group player, getPos (player findNearestEnemy player), 100] call CBA_fnc_taskAttack

Returns
Nil
```

# CBA_fnc_taskDefend
```
Description
A function for a group to defend a parsed location.  Should be ran locally.

Units will mount nearby static machine guns and garrison in nearby buildings.  10% chance to patrol the radius unless specified differently (100% when no available building positions).  0% chance to hold defensive positions in combat unless specified differently.

Parameters
_group	the group <GROUP, OBJECT>
_position	centre of area to defend <ARRAY, OBJECT, LOCATION, GROUP> (Default: _group)
_radius	radius of area to defend <NUMBER> (Default: 50)
_threshold	minimum building positions required to be considered for garrison <NUMBER> (Default: 3)
_patrol	chance for each unit to patrol instead of garrison, true for default, false for 0% <NUMBER, BOOLEAN> (Default: 0.1)
_hold	chance for each unit to hold their garrison in combat, true for 100%, false for 0% <NUMBER, BOOLEAN> (Default: 0)

Returns
None

Examples
[this] call CBA_fnc_taskDefend
```

# CBA_fnc_taskPatrol
```
Description
A function for a group to randomly patrol a parsed radius and location.

Parameters
Group (Group or Object)

Optional
Position (XYZ, Object, Location or Group)
Radius (Scalar)
Waypoint Count (Scalar)
Waypoint Type (String)
Behaviour (String)
Combat Mode (String)
Speed Mode (String)
Formation (String)
Code To Execute at Each Waypoint (String)
TimeOut at each Waypoint (Array [Min, Med, Max])

Example
[this, getMarkerPos "objective1", 50] call CBA_fnc_taskPatrol
[this, this, 300, 7, "MOVE", "AWARE", "YELLOW", "FULL", "STAG COLUMN", "this call CBA_fnc_searchNearby", [3, 6, 9]] call CBA_fnc_taskPatrol;
```

# CBA_fnc_taskSearchArea
```
Description
Given group will indefinitely randomly search the given marker/trigger area.

Will also perform random building searches.

Parameters
_group	The group that will search [Group or Object]
_area	The area to search [Marker, Trigger or Area Array]

Optional
_behaviour	Waypoint behaviour [String, defaults to “UNCHANGED”]
_combat	Waypoint combat mode [String, defaults to “NO CHANGE”]
_speed	Waypoint speed [String, defaults to “UNCHANGED”]
_formation	Waypoint formation [String, defaults to “NO CHANGE”]
_onComplete	Waypoint completion code [String, defaults to “”]
_timeout	Waypoint timeout [Array, defaults to [0,0,0]]

Returns
None

Examples
[this, "Mark1"] call CBA_fnc_taskSearchArea;
[(allGroups select 2), [getPos player, 200, 200, 0, false]] call CBA_fnc_taskSearchArea;
```

# CBA_fnc_addWaypoint
```
Description
A function used to add a waypoint to a group.

Parameters
Group (Group or Object)
Position (XYZ, Object, Location or Group)

Optional
Radius (Scalar)
Waypoint Type (String)
Behaviour (String)
Combat Mode (String)
Speed Mode (String)
Formation (String)
Code To Execute at Each Waypoint (String)
TimeOut at each Waypoint (Array [Min, Med, Max])
Waypoint Completion Radius (Scalar)

Example
[this, this, 300, "MOVE", "AWARE", "YELLOW", "FULL", "STAG COLUMN", "this spawn CBA_fnc_searchNearby", [3, 6, 9]] call CBA_fnc_addWaypoint
```