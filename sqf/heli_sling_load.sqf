/**
    Sling load vehicle on helicopter if possible
    To check if possible put: heli canSlingLoad car to console
    Then creates waypoint to UNHOOK slinged vehicle
 */

heli setSlingLoad car;
[heli, aPosition, 0, "UNHOOK", "CARELESS", "BLUE"] call CBA_fnc_addWaypoint;
