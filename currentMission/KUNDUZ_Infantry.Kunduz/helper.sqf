_cars = [car_1, car_2, car_3];
_car_1_destroyed = false;
_car_2_destroyed = false;
_car_3_destroyed = false;

// setup random positions for cars 
// setup patrols
{
	_newPos = [carPositionArea] call BIS_fnc_randomPosTrigger;
	_groupPatrolPos = [_newPos, 20, 50] call BIS_fnc_findSafePos;
	_x setPosATL _newPos;
	
	_groupPatrol = [
		_groupPatrolPos, east,
		["UK3CB_TKA_O_GL", "UK3CB_TKA_O_RIF_1", "UK3CB_TKA_O_LAT"]
	] call BIS_fnc_spawnGroup;
    _groupPatrol deleteGroupWhenEmpty true;
	[_groupPatrol, _newPos, 100] call BIS_fnc_taskPatrol;

    _driverPos = [_newPos, 10, 20] call BIS_fnc_findSafePos;
    _groupDriver = [
        _driverPos, east, ["UK3CB_TKA_O_RIF_1"]
    ] call BIS_fnc_spawnGroup;
    _groupDriver deleteGroupWhenEmpty true;
    _driver = (units _groupDriver) select 0;
    [_driver, _car] execFSM "fsm\saveCar.fsm";
} forEach _cars;

_introDone = false;